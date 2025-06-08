package br.com.simba.model.service;

import br.com.simba.model.dao.PictureDAO;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Picture;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;
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
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class RegistryHandle {
    private static final String OBSERVATION_DELIMITER = ";;;";
    private List<Registry> userRegistries;
    private List<Registry> firstRecentRegistries;
    private List<Registry> firstOldRegistries;
    private final RegistryDAO registryDAO;

    public RegistryHandle(String username){
        registryDAO = new RegistryDAO();
        userRegistries = registryDAO.listAllUserRegistries(username);
        firstOldRegistries = registryDAO.listAllUserRegistriesOrderedByOldestDate(username);
        firstRecentRegistries = registryDAO.listAllUserRegistriesOrderedByRecentDate(username);
    }

    public RegistryHandle(){
        registryDAO = new RegistryDAO();
    }

    public List<Registry> getRegistriesByNameAndStatus(String name, BarrierStatus barrierStatus){
        List<Registry> foundRegistries = new ArrayList<>();
        if (userRegistries == null) return foundRegistries;

        for (int i = 0; i < userRegistries.size(); i++){
            if (userRegistries.get(i).getBarrierStatus().equals(barrierStatus)){
                if (name != null && userRegistries.get(i).getBarrierSpecification().toLowerCase().contains(name.toLowerCase())) {
                    foundRegistries.add(userRegistries.get(i));
                    continue;
                }

                if (name == null) foundRegistries.add(userRegistries.get(i));
            }
        }

        return foundRegistries;
    }

    public List<Registry> getRegistriesByNameAndUrgency(String name, BarrierCriticality barrierCriticality){
        List<Registry> foundRegistries = new ArrayList<>();
        if (userRegistries == null) return foundRegistries;

        for (int i = 0; i < userRegistries.size(); i++){
            if (userRegistries.get(i).getBarrierCriticality().equals(barrierCriticality)){
                if (name != null && userRegistries.get(i).getBarrierSpecification().toLowerCase().contains(name.toLowerCase())) {
                    foundRegistries.add(userRegistries.get(i));
                    continue;
                }

                if (name == null) foundRegistries.add(userRegistries.get(i));
            }
        }

        return foundRegistries;
    }

    public List<Registry> getRegistriesByNameAndOrder(String name, String order){
        List<Registry> foundRegistries = new ArrayList<>();
        boolean twoListIsNull = firstRecentRegistries == null && firstOldRegistries == null;

        if (order == null || twoListIsNull) return foundRegistries;

        if (order.equals("recent")){
            for (Registry registry : firstRecentRegistries){
                if (registry.getBarrierSpecification().toLowerCase().contains(name.toLowerCase()))
                    foundRegistries.add(registry);
            }
            return foundRegistries;
        }

        for (Registry registry : firstOldRegistries){
            if (registry.getBarrierSpecification().toLowerCase().contains(name.toLowerCase()))
                foundRegistries.add(registry);
        }

        return foundRegistries;
    }

    public void handleGeneratePdfReport(HttpServletRequest request, HttpServletResponse response, int barrierId) throws IOException, SQLException {
        RegistryDAO registryDAO = new RegistryDAO();
        Registry barrier = registryDAO.findById(barrierId);

        if (barrier == null) {
            if (!response.isCommitted()) response.sendError(HttpServletResponse.SC_NOT_FOUND, "Barreira não encontrada.");
            return;
        }

        PictureDAO pictureDAO = new PictureDAO();
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

            boolean isPictureNull = picture == null || picture.getImagePath() == null || picture.getImagePath().isEmpty();

            if (isPictureNull){
                Paragraph noImgMsg = new Paragraph("Nenhuma imagem associada a esta barreira.").setFont(fontRegular).setItalic();
                noImgMsg.setMarginTop(10);
                noImgMsg.setMarginBottom(15);
                document.add(noImgMsg);
            }

            if (!isPictureNull) {
                String relativeImagePathFromDB = picture.getImagePath();
                String applicationRootPath = request.getServletContext().getRealPath("/");
                String normalizedRelativePath = relativeImagePathFromDB.replace('/', File.separatorChar).replace('\\', File.separatorChar);
                File imageFile = new File(applicationRootPath, normalizedRelativePath);

                boolean isImageInvalid = !imageFile.exists() || !imageFile.isFile();

                if (isImageInvalid){
                    Paragraph notFoundMsg = new Paragraph("Arquivo de imagem não encontrado no servidor: " + relativeImagePathFromDB).setFont(fontRegular).setItalic();
                    notFoundMsg.setMarginTop(10);
                    notFoundMsg.setMarginBottom(15);
                    document.add(notFoundMsg);
                }

                if (!isImageInvalid) {
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
                }
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

            String observationsText = registryDAO.getObservationsTextByRegistryId(barrier.getId());

            if(observationsText == null || observationsText.isEmpty()){
                document.add(new Paragraph("Nenhuma observação registrada.").setFont(fontRegular).setItalic());
                return;
            }

            String[] observationsArray = observationsText.split(OBSERVATION_DELIMITER);

            for (String obs : observationsArray) {
                document.add(new Paragraph("- " + obs.trim()).setFont(fontRegular).setMarginLeft(20));
            }

        } catch (IOException ioe) {
            System.out.println("Error: client close connection!");
        }
    }

    public void handleAddObservation(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws SQLException {
        int barrierId = Integer.parseInt(request.getParameter("barrierId"));
        String observationText = request.getParameter("observationText");

        if (observationText == null || observationText.trim().isEmpty()) {
            if (!response.isCommitted()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\":\"O texto da observação não pode ser vazio.\"}");
            }
            return;
        }

        String existingObs = registryDAO.getObservationsTextByRegistryId(barrierId);
        String newObsValue = (existingObs == null || existingObs.isEmpty()) ?
                observationText.trim() :
                existingObs + OBSERVATION_DELIMITER + observationText.trim();
        registryDAO.updateObservationsText(barrierId, newObsValue);
        if (!response.isCommitted()){
            out.print("{\"message\":\"Observação adicionada com sucesso!\"}");
        }
    }

    public void handleChangeStatus(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws SQLException {
        int barrierId = Integer.parseInt(request.getParameter("barrierId"));
        String statusStr = request.getParameter("newStatus");
        BarrierStatus newStatus = BarrierStatus.valueOf(statusStr);

        registryDAO.updateBarrierStatus(barrierId, newStatus);
        if (!response.isCommitted()) {
            out.print("{\"message\":\"Status alterado com sucesso!\"}");
        }
    }

    public int getAmountRegistry(){
        return registryDAO.getRegistryAmount();
    }

    public int getAmountRegistryByStatus(String status){
        return registryDAO.getRegistryAmountByStatus(status);
    }
}
