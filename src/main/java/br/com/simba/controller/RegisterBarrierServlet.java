package br.com.simba.controller;

import br.com.simba.model.entities.School;
import br.com.simba.model.enums.BarrierCategory;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.service.RegisterValidator;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;

@WebServlet("/dashboard/register-barrier")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10,  // 10MB
        maxRequestSize = 1024 * 1024 * 15 // 15MB
)
public class RegisterBarrierServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RegisterValidator validate = new RegisterValidator();
        response.setContentType("text/plain;charset=UTF-8");

        String uploadPath = getServletContext().getRealPath("") + File.separator + "upload" + File.separator + "barrierImage";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        Part filePart = request.getPart("imageUpload");
        String fileName = (filePart != null && filePart.getSize() > 0) ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : "no-image.png"; // Trata o caso de não haver imagem
        String filePath = uploadPath + File.separator + fileName;

        if (filePart != null && filePart.getSize() > 0) {
            filePart.write(filePath);
        } else {
            String defaultImagePath = getServletContext().getRealPath("/images/no-image.png");
            File defaultImageFile = new File(defaultImagePath);
            File destFile = new File(filePath);
            Files.copy(defaultImageFile.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        School school = validate.validateSchoolName(request.getParameter("schoolName"), request);
        BarrierCategory barrierCategory = BarrierCategory.valueOf(request.getParameter("barrierCategory"));
        String specificLocation = request.getParameter("specificLocation");
        String problemDetails = request.getParameter("problemDetails");
        BarrierCriticality barrierCriticality = BarrierCriticality.valueOf(request.getParameter("urgencyLevel"));
        LocalDate identificationDate = validate.validateIdentificationDate(request.getParameter("identificationDate"), request);
        String solutionSuggestion = request.getParameter("solutionSuggestion");

        if (validate.anyNull(school, identificationDate)){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard/register-barrier");
            dispatcher.forward(request, response);
        }
    }
}

