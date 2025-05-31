package br.com.simba.controller;

import br.com.simba.model.dao.DBConnection;
import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.dao.PictureDAO;
import br.com.simba.model.dao.PostgresConnection;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.User;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.valueobject.Username;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.layout.properties.UnitValue;

@WebServlet("/manager/barriers")
public class ManageBarriersServlet extends HttpServlet {

    private static final String OBSERVATION_DELIMITER = ";;;";

    private Manager getManagerFromSessionUser(User sessionUser, Connection conn) throws SQLException {
        if (sessionUser == null) {
            return null;
        }

        String userTypeFromSession = sessionUser.getUserType();
        String normalizedUserType = (userTypeFromSession != null) ? userTypeFromSession.trim().toLowerCase() : null;
        boolean isManagerType = "manager".equals(normalizedUserType);

        if (isManagerType) {
            ManagerDAO managerDAO = new ManagerDAO(conn);
            Manager manager = managerDAO.getManagerByUsername(new Username(sessionUser.getUsername()));
            if (manager != null) {
                return manager;
            }
            return null;
        }
        return null;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || sessionUser == null) {
            if (request.getParameter("reportBarrierId") == null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                PrintWriter out = response.getWriter();
                out.print("{\"error\":\"Usuário não autenticado (sessão ou usuário nulo).\"}");
                out.flush();
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário não autenticado.");
            }
            return;
        }

        String reportBarrierIdStr = request.getParameter("reportBarrierId");
        DBConnection dbConnection = new PostgresConnection();
        Connection conn = null;

        try {
            conn = dbConnection.getConnection();
            Manager manager = getManagerFromSessionUser(sessionUser, conn);

            if (manager == null) {
                if (request.getParameter("reportBarrierId") == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                    PrintWriter out = response.getWriter();
                    out.print("{\"error\":\"Acesso negado. O usuário não é um gestor válido.\"}");
                    out.flush();
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "Acesso negado. O usuário não é um gestor válido.");
                }
                return;
            }

            if (reportBarrierIdStr != null) {
                try {
                    int barrierId = Integer.parseInt(reportBarrierIdStr);
                    handleGeneratePdfReport(request, response, conn, barrierId);
                } catch (NumberFormatException e) {
                    if (!response.isCommitted()) response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID da barreira inválido.");
                }
            }

            if (reportBarrierIdStr == null) {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();

                int schoolId = manager.getSchoolId();
                RegistryDAO registryDAO = new RegistryDAO(conn);
                List<Registry> barriers = registryDAO.listRegistriesBySchoolId(schoolId);

                StringBuilder jsonBuilder = new StringBuilder("[");
                for (int i = 0; i < barriers.size(); i++) {
                    Registry barrier = barriers.get(i);
                    jsonBuilder.append("{");
                    jsonBuilder.append("\"id\":").append(barrier.getId()).append(",");
                    jsonBuilder.append("\"name\":\"").append(escapeJson(barrier.getBarrierSpecification())).append("\",");
                    jsonBuilder.append("\"location\":\"").append(escapeJson(barrier.getLocation())).append("\",");
                    jsonBuilder.append("\"type\":\"").append(escapeJson(barrier.getBarrierType().toString())).append("\",");
                    jsonBuilder.append("\"criticality\":\"").append(escapeJson(barrier.getBarrierCriticality().toString())).append("\",");
                    jsonBuilder.append("\"status\":\"").append(escapeJson(barrier.getBarrierStatus().toString())).append("\",");
                    jsonBuilder.append("\"date\":\"").append(escapeJson(barrier.getBarrierIdentificationDate().format(DateTimeFormatter.ISO_LOCAL_DATE))).append("\",");

                    String obsText = getObservationsTextByRegistryId(conn, barrier.getId());
                    List<String> observationsList = new ArrayList<>();
                    if (obsText != null && !obsText.isEmpty()) {
                        observationsList = Arrays.asList(obsText.split(OBSERVATION_DELIMITER));
                    }
                    jsonBuilder.append("\"observations\":[");
                    for (int j = 0; j < observationsList.size(); j++) {
                        jsonBuilder.append("\"").append(escapeJson(observationsList.get(j))).append("\"");
                        if (j < observationsList.size() - 1) {
                            jsonBuilder.append(",");
                        }
                    }
                    jsonBuilder.append("]");
                    jsonBuilder.append("}");
                    if (i < barriers.size() - 1) {
                        jsonBuilder.append(",");
                    }
                }
                jsonBuilder.append("]");
                out.print(jsonBuilder.toString());
                out.flush();
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()) {
                if (request.getParameter("reportBarrierId") == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    PrintWriter out = response.getWriter();
                    out.print("{\"error\":\"Erro ao acessar o banco de dados (JSON): " + escapeJson(e.getMessage()) + "\"}");
                    out.flush();
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao acessar dados para o relatório.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()) {
                if (request.getParameter("reportBarrierId") == null) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    PrintWriter out = response.getWriter();
                    out.print("{\"error\":\"Erro inesperado (JSON): " + escapeJson(e.getMessage()) + "\"}");
                    out.flush();
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro inesperado ao gerar relatório: " + e.getMessage());
                }
            }
        } finally {
            if (conn != null) {
                try {
                    if (!conn.isClosed()) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace(System.out);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        DBConnection dbConnection = new PostgresConnection();
        Connection conn = null;

        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        User sessionUser = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || sessionUser == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print("{\"error\":\"Usuário não autenticado (sessão ou usuário nulo).\"}");
            out.flush();
            return;
        }

        try {
            conn = dbConnection.getConnection();
            Manager manager = getManagerFromSessionUser(sessionUser, conn);

            if (manager == null) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print("{\"error\":\"Acesso negado para a ação. O usuário não é um gestor válido.\"}");
                out.flush();
                return;
            }

            boolean actionMatched = false;
            if ("changeStatus".equals(action)) {
                actionMatched = true;
                handleChangeStatus(request, response, conn, out);
            }
            if (!actionMatched && "addObservation".equals(action)) {
                actionMatched = true;
                handleAddObservation(request, response, conn, out);
            }
            if (!actionMatched) {
                if (!response.isCommitted()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                out.print("{\"error\":\"Ação desconhecida: " + escapeJson(action) + "\"}");
            }

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Erro ao acessar o banco de dados: " + escapeJson(e.getMessage()) + "\"}");
            }
        } catch (Exception e) {
            e.printStackTrace(System.out);
            if (!response.isCommitted()){
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("{\"error\":\"Erro inesperado: " + escapeJson(e.getMessage()) + "\"}");
            }
        } finally {
            if (conn != null) {
                try {
                    if (!conn.isClosed()) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace(System.out);
                }
            }
            if (out != null) {
                out.flush();
            }
        }
    }

    private void handleGeneratePdfReport(HttpServletRequest request, HttpServletResponse response, Connection conn, int barrierId) throws IOException, SQLException {
        RegistryDAO registryDAO = new RegistryDAO(conn);
        Registry barrier = registryDAO.findById(barrierId);

        if (barrier == null) {
            if (!response.isCommitted()) response.sendError(HttpServletResponse.SC_NOT_FOUND, "Barreira não encontrada.");
            return;
        }

        PictureDAO pictureDAO = new PictureDAO(conn);
        Picture picture = null;
        if (barrier.getPictureId() > 0) {
            picture = pictureDAO.getPictureById(barrier.getPictureId());
        }

        if (!response.isCommitted()) {
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"relatorio_barreira_" + barrier.getId() + ".pdf\"");
        } else {
            return;
        }

        try (OutputStream outStream = response.getOutputStream();
             PdfWriter writer = new PdfWriter(outStream);
             PdfDocument pdfDoc = new PdfDocument(writer);
             Document document = new Document(pdfDoc, PageSize.A4)) {

            PdfFont fontBold = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);
            PdfFont fontRegular = PdfFontFactory.createFont(StandardFonts.HELVETICA);

            document.setMargins(36, 36, 36, 36);

            Paragraph title = new Paragraph("Relatório de Barreira de Acessibilidade")
                    .setFont(fontBold).setFontSize(18).setTextAlignment(TextAlignment.CENTER)
                    .setMarginBottom(10);
            document.add(title);

            if (picture != null && picture.getImagePath() != null && !picture.getImagePath().isEmpty()) {
                String relativeImagePathFromDB = picture.getImagePath();
                String applicationRootPath = request.getServletContext().getRealPath("/");
                String normalizedRelativePath = relativeImagePathFromDB.replace('/', File.separatorChar).replace('\\', File.separatorChar);
                File imageFile = new File(applicationRootPath, normalizedRelativePath);

                if (imageFile.exists() && imageFile.isFile()) {
                    try {
                        Image img = new Image(ImageDataFactory.create(imageFile.getAbsolutePath()));
                        img.setAutoScaleWidth(true);
                        float maxWidth = PageSize.A4.getWidth() - document.getLeftMargin() - document.getRightMargin() - 40;
                        float maxHeight = PageSize.A4.getHeight() * 0.4f;
                        img.scaleToFit(maxWidth, maxHeight);
                        img.setMarginTop(10);
                        img.setMarginBottom(15);
                        document.add(img);
                    } catch (Exception e) {
                        e.printStackTrace(System.out);
                        Paragraph errMsg = new Paragraph("Erro ao carregar imagem: " + relativeImagePathFromDB).setFont(fontRegular).setItalic().setFontColor(ColorConstants.RED);
                        errMsg.setMarginTop(10);
                        errMsg.setMarginBottom(15);
                        document.add(errMsg);
                    }
                } else {
                    Paragraph notFoundMsg = new Paragraph("Arquivo de imagem não encontrado no servidor: " + relativeImagePathFromDB).setFont(fontRegular).setItalic();
                    notFoundMsg.setMarginTop(10);
                    notFoundMsg.setMarginBottom(15);
                    document.add(notFoundMsg);
                }
            } else {
                Paragraph noImgMsg = new Paragraph("Nenhuma imagem associada a esta barreira.").setFont(fontRegular).setItalic();
                noImgMsg.setMarginTop(10);
                noImgMsg.setMarginBottom(15);
                document.add(noImgMsg);
            }

            Table infoTable = new Table(UnitValue.createPercentArray(new float[]{1, 3})).useAllAvailableWidth();

            infoTable.addCell(new Cell().add(new Paragraph("ID da Barreira:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(String.valueOf(barrier.getId())).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Nome/Especificação:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getBarrierSpecification()).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Localização:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getLocation()).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Tipo:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getBarrierType().getDisplayName()).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Criticidade:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getBarrierCriticality().getDisplayName()).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Status Atual:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getBarrierStatus().getDisplayName()).setFont(fontRegular)));

            infoTable.addCell(new Cell().add(new Paragraph("Data de Identificação:").setFont(fontBold)));
            infoTable.addCell(new Cell().add(new Paragraph(barrier.getBarrierIdentificationDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))).setFont(fontRegular)));

            if (barrier.getSchool() != null) {
                infoTable.addCell(new Cell().add(new Paragraph("Escola:").setFont(fontBold)));
                infoTable.addCell(new Cell().add(new Paragraph(barrier.getSchool().getName()).setFont(fontRegular)));
            }

            document.add(infoTable);
            document.add(new Paragraph("\n"));

            Paragraph obsTitle = new Paragraph("Observações Registradas:").setFont(fontBold).setMarginTop(10);
            document.add(obsTitle);

            String observationsText = getObservationsTextByRegistryId(conn, barrier.getId());
            if (observationsText != null && !observationsText.isEmpty()) {
                String[] observationsArray = observationsText.split(OBSERVATION_DELIMITER);
                for (String obs : observationsArray) {
                    document.add(new Paragraph("- " + obs.trim()).setFont(fontRegular).setMarginLeft(20));
                }
            } else {
                document.add(new Paragraph("Nenhuma observação registrada.").setFont(fontRegular).setItalic());
            }
        } catch (IOException ioe) {
            // Cliente pode ter fechado a conexão
        }
    }

    private void handleChangeStatus(HttpServletRequest request, HttpServletResponse response, Connection conn, PrintWriter out) throws SQLException {
        int barrierId = Integer.parseInt(request.getParameter("barrierId"));
        String statusStr = request.getParameter("newStatus");
        BarrierStatus newStatus = BarrierStatus.valueOf(statusStr);

        updateBarrierStatus(conn, barrierId, newStatus);
        if (!response.isCommitted()) {
            out.print("{\"message\":\"Status alterado com sucesso!\"}");
        }
    }

    private void handleAddObservation(HttpServletRequest request, HttpServletResponse response, Connection conn, PrintWriter out) throws SQLException {
        int barrierId = Integer.parseInt(request.getParameter("barrierId"));
        String observationText = request.getParameter("observationText");

        if (observationText == null || observationText.trim().isEmpty()) {
            if (!response.isCommitted()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"O texto da observação não pode ser vazio.\"}");
            }
            return;
        }

        String existingObs = getObservationsTextByRegistryId(conn, barrierId);
        String newObsValue = (existingObs == null || existingObs.isEmpty()) ?
                observationText.trim() :
                existingObs + OBSERVATION_DELIMITER + observationText.trim();
        updateObservationsText(conn, barrierId, newObsValue);
        if (!response.isCommitted()){
            out.print("{\"message\":\"Observação adicionada com sucesso!\"}");
        }
    }

    private String escapeJson(String s) {
        if (s == null) {
            return "";
        }
        return s.replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\b", "\\b")
                .replace("\f", "\\f")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");
    }

    private void updateBarrierStatus(Connection conn, int registryId, BarrierStatus newStatus) throws SQLException {
        String sql = "UPDATE registries SET barrier_status = ? WHERE id = ?";
        try (java.sql.PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, newStatus.name());
            statement.setInt(2, registryId);
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Falha ao atualizar status, nenhuma linha afetada. ID da barreira: " + registryId);
            }
        }
    }

    private String getObservationsTextByRegistryId(Connection conn, int registryId) throws SQLException {
        String sql = "SELECT observations_text FROM registries WHERE id = ?";
        try (java.sql.PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, registryId);
            try (java.sql.ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    String obsText = rs.getString("observations_text");
                    return obsText;
                }
                return null;
            }
        }
    }

    private void updateObservationsText(Connection conn, int registryId, String observationsText) throws SQLException {
        String sql = "UPDATE registries SET observations_text = ? WHERE id = ?";
        try (java.sql.PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, observationsText);
            statement.setInt(2, registryId);
            int affectedRows = statement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Falha ao atualizar observações, nenhuma linha afetada. ID da barreira: " + registryId);
            }
        }
    }
}