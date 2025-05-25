package br.com.simba.controller;

import br.com.simba.exceptions.DataAccessException;
import br.com.simba.model.dao.*;
import br.com.simba.model.entities.*;
import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.service.RegisterValidator;
import br.com.simba.model.valueobject.Username;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path; // Importar Path
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/dashboard/register-barrier")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10,  // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class RegisterBarrierServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private String getUploadPath() {
        String webAppRoot = getServletContext().getRealPath("");

        if (webAppRoot == null) return null;

        if (webAppRoot.endsWith(File.separator)) webAppRoot = webAppRoot.substring(0, webAppRoot.length() - 1);

        String path = webAppRoot + File.separator + "upload" + File.separator + "barrierImage";

        File uploadDir = new File(path);
        if (!uploadDir.exists()) {
            System.out.println("INFO getUploadPath: Upload directory does not exist, trying to create: " + path);
            boolean created = uploadDir.mkdirs();
            if (!created) {
                System.err.println("FAILED TO CREATE UPLOAD DIRECTORY: " + path + ". Check permissions or if the base path (" + webAppRoot + ") is valid and accessible.");
                return null;
            } else {
                System.out.println("INFO getUploadPath: Upload directory created successfully: " + path);
            }
        } else {
            System.out.println("INFO getUploadPath: Upload directory already exists: " + path);
        }

        if (uploadDir.exists()) {
            if (!uploadDir.canWrite()) {
                System.err.println("ERROR getUploadPath: No write permission in the upload directory: " + path);
            } else {
                System.out.println("INFO getUploadPath: Write permission OK for: " + path);
            }
        } else {
            System.err.println("FATAL ERROR getUploadPath: Upload directory does not exist AFTER creation attempt: " + path);
            return null;
        }
        return path;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;

        try {
            DBConnection dbConnection = new PostgresConnection();
            conn = dbConnection.getConnection();
            if (conn == null) {
                System.err.println("ERROR doPost: Could not connect to the database.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("Erro interno: Falha na conexão com o banco de dados.");
                out.flush();
                return;
            }
            conn.setAutoCommit(false);

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                System.out.println("WARN doPost: User not authenticated.");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print("Erro: Usuário não autenticado. Faça login novamente.");
                out.flush();
                conn.rollback();
                return;
            }
            String userUsername = (String) session.getAttribute("user");
            System.out.println("INFO doPost: Session user: " + userUsername);

            String schoolNameParam = request.getParameter("schoolName");
            String barrierCategoryParam = request.getParameter("barrierCategory");
            String specificLocation = request.getParameter("specificLocation");
            String problemDetails = request.getParameter("problemDetails");
            String urgencyLevelParam = request.getParameter("urgencyLevel");
            String identificationDateParam = request.getParameter("identificationDate");
            String solutionSuggestion = request.getParameter("solutionSuggestion");

            if (schoolNameParam == null || schoolNameParam.trim().isEmpty() ||
                    barrierCategoryParam == null || barrierCategoryParam.trim().isEmpty() ||
                    specificLocation == null || specificLocation.trim().isEmpty() ||
                    problemDetails == null || problemDetails.trim().isEmpty() ||
                    urgencyLevelParam == null || urgencyLevelParam.trim().isEmpty() ||
                    identificationDateParam == null || identificationDateParam.trim().isEmpty())
            {
                System.out.println("WARN doPost: Required fields not filled.");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Erro: Todos os campos obrigatórios devem ser preenchidos.");
                out.flush();
                conn.rollback();
                return;
            }

            RegisterValidator validate = new RegisterValidator();
            School school = validate.validateSchoolName(schoolNameParam, request);
            LocalDate identificationDate = validate.validateIdentificationDate(identificationDateParam, request);

            if (school == null || identificationDate == null) {
                System.out.println("WARN doPost: School or date validation failed. School: " + school + ", Date: " + identificationDate);
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Erro de validação: Verifique o nome da escola ou a data.");
                out.flush();
                conn.rollback();
                return;
            }
            System.out.println("INFO doPost: School validated: " + school.getName() + ", Identification date: " + identificationDate);


            BarrierCategory barrierCategory;
            BarrierCriticality barrierCriticality;
            try {
                barrierCategory = BarrierCategory.valueOf(barrierCategoryParam.toUpperCase());
                barrierCriticality = BarrierCriticality.valueOf(urgencyLevelParam.toUpperCase());
            } catch (IllegalArgumentException e) {
                System.out.println("WARN doPost: Invalid category or urgency. Category: " + barrierCategoryParam + ", Urgency: " + urgencyLevelParam);
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Erro: Categoria ou nível de urgência inválido.");
                out.flush();
                conn.rollback();
                return;
            }
            System.out.println("INFO doPost: Category: " + barrierCategory + ", Criticality: " + barrierCriticality);


            String uploadPath = getUploadPath();
            if (uploadPath == null) {
                System.err.println("ERROR doPost: Critical failure to get/create upload directory. Aborting registration.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("Erro interno do servidor: Falha na configuração do diretório de upload.");
                out.flush();
                conn.rollback();
                return;
            }
            System.out.println("INFO doPost: Upload path effectively used: " + uploadPath);

            Part filePart = request.getPart("imageUpload");
            String finalFileName = "no-image.png";
            String relativePathForDB = "images/no-image.png";

            if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().trim().isEmpty()) {
                System.out.println("INFO doPost: Processing upload. Original name: " + filePart.getSubmittedFileName() + ", Size: " + filePart.getSize());

                String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String extension = "";
                int dotIndex = originalFileName.lastIndexOf(".");
                if (dotIndex > 0 && dotIndex < originalFileName.length() - 1) {
                    extension = originalFileName.substring(dotIndex);
                }
                finalFileName = UUID.randomUUID().toString() + extension;
                String fullSavePath = uploadPath + File.separator + finalFileName;
                System.out.println("INFO doPost: Full path to save image: " + fullSavePath);

                try (InputStream input = filePart.getInputStream()) {
                    Path destinationPath = Paths.get(fullSavePath);
                    Files.copy(input, destinationPath, StandardCopyOption.REPLACE_EXISTING);
                    relativePathForDB = "upload/barrierImage/" + finalFileName;
                    System.out.println("INFO doPost: Image saved successfully at: " + fullSavePath);
                    System.out.println("INFO doPost: Relative path for DB: " + relativePathForDB);
                } catch (IOException e) {
                    System.err.println("ERROR doPost WHILE SAVING FILE '" + fullSavePath + "': " + e.getClass().getName() + " - " + e.getMessage());
                    e.printStackTrace();
                    finalFileName = "no-image.png";
                    relativePathForDB = "images/no-image.png";
                    System.err.println("WARN doPost: Image upload failed. Using default image for the database.");
                }
            } else {
                System.out.println("INFO doPost: No image sent or empty file. Using default image.");
            }

            PictureDAO pictureDAO = new PictureDAO(conn);
            ReporterDAO reporterDAO = new ReporterDAO(conn);
            RegistryDAO registryDAO = new RegistryDAO(conn);

            Reporter reporter = reporterDAO.getReporterByUsername(new Username(userUsername));
            if (reporter == null) {
                System.err.println("ERROR doPost: Reporter not found for user: " + userUsername);
                conn.rollback();
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Erro: Repórter associado ao usuário não encontrado.");
                out.flush();
                return;
            }
            System.out.println("INFO doPost: Reporter ID: " + reporter.getId() + " for username: " + userUsername);


            Picture picture = new Picture(relativePathForDB, LocalDate.now());
            try {
                pictureDAO.insert(picture);
                System.out.println("INFO doPost: Image inserted into database. Picture ID: " + picture.getId());
            } catch (DataAccessException e) {
                System.err.println("ERROR doPost: Failed to insert image data into database: " + e.getMessage());
                e.printStackTrace();
                conn.rollback();
                throw new ServletException("Não foi possível salvar os dados da imagem no banco.", e);
            }
            if (picture.getId() == 0) {
                System.err.println("ERROR doPost: Picture ID was not generated after insertion into database.");
                conn.rollback();
                throw new ServletException("Não foi possível salvar a imagem no banco (ID da Picture não gerado).");
            }


            Registry registry = new Registry(barrierCriticality, picture, school, specificLocation, problemDetails, solutionSuggestion, barrierCategory, identificationDate, reporter);

            boolean regSuccess = false;
            try {


                registryDAO.insert(registry);
                regSuccess = true;
                System.out.println("INFO doPost: Record inserted into database successfully.");
            } catch (DataAccessException e) {
                System.err.println("ERROR doPost: Failed to insert record data into database: " + e.getMessage());
                e.printStackTrace();
                conn.rollback();
                throw new ServletException("Não foi possível registrar a barreira no banco.", e);
            }

            if (regSuccess) {
                conn.commit();
                System.out.println("INFO doPost: Transaction committed. Barrier registered successfully!");
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("Barreira registrada com sucesso!");
            } else {
                System.err.println("ERROR doPost: Failed to register barrier (regSuccess was false, but no exception from DAO).");
                conn.rollback();
                throw new ServletException("Não foi possível registrar a barreira (falha não especificada na inserção do registro).");
            }

        } catch (Exception e) {
            System.err.println("GENERAL ERROR doPost: " + e.getClass().getName() + " - " + e.getMessage());
            e.printStackTrace();
            if (conn != null) {
                try {
                    System.err.println("INFO doPost: Attempting rollback due to general exception.");
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("ERROR doPost: Failed to rollback: " + ex.getMessage());
                    ex.printStackTrace();
                }
            }
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("Ocorreu um erro interno ao processar o registro: " + e.getMessage());

        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("INFO doPost: Database connection closed.");
                } catch (SQLException e) {
                    System.err.println("ERROR doPost: Failed to close database connection: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            if (out != null) {
                out.flush();
            }
        }
    }
}