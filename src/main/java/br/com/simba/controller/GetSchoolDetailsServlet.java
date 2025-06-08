package br.com.simba.controller;

import br.com.simba.model.dao.ManagerDAO;
import br.com.simba.model.dao.HikariCPDataSource;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.Manager;
import br.com.simba.model.entities.School;

import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;
import br.com.simba.model.enums.BarrierCategory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/getSchoolDetailsServlet")
public class GetSchoolDetailsServlet extends HttpServlet {

    private Gson gson;

    private static class LocalDateSerializer implements JsonSerializer<LocalDate> {
        private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE;
        @Override
        public JsonElement serialize(LocalDate src, java.lang.reflect.Type typeOfSrc, JsonSerializationContext context) {
            return (src == null) ? null : new JsonPrimitive(FORMATTER.format(src));
        }
    }

    private static class PatternSerializer implements JsonSerializer<Pattern> {
        @Override
        public JsonElement serialize(Pattern src, java.lang.reflect.Type typeOfSrc, JsonSerializationContext context) {
            return (src == null) ? null : new JsonPrimitive(src.pattern());
        }
    }

    private static class BarrierCriticalitySerializer implements JsonSerializer<BarrierCriticality> {
        @Override
        public JsonElement serialize(BarrierCriticality src, java.lang.reflect.Type typeOfSrc, JsonSerializationContext context) {
            return (src == null) ? null : new JsonPrimitive(src.getDisplayName());
        }
    }

    private static class BarrierStatusSerializer implements JsonSerializer<BarrierStatus> {
        @Override
        public JsonElement serialize(BarrierStatus src, java.lang.reflect.Type typeOfSrc, JsonSerializationContext context) {
            return (src == null) ? null : new JsonPrimitive(src.getDisplayName());
        }
    }

    private static class BarrierTypeSerializer implements JsonSerializer<BarrierCategory> {
        @Override
        public JsonElement serialize(BarrierCategory src, java.lang.reflect.Type typeOfSrc, JsonSerializationContext context) {
            return (src == null) ? null : new JsonPrimitive(src.getDisplayName());
        }
    }


    @Override
    public void init() throws ServletException {
        super.init();
        GsonBuilder gsonBuilder = new GsonBuilder();

        gsonBuilder.registerTypeAdapter(LocalDate.class, new LocalDateSerializer());
        gsonBuilder.registerTypeAdapter(Pattern.class, new PatternSerializer());

        gsonBuilder.registerTypeAdapter(BarrierCriticality.class, new BarrierCriticalitySerializer());
        gsonBuilder.registerTypeAdapter(BarrierStatus.class, new BarrierStatusSerializer());
        gsonBuilder.registerTypeAdapter(BarrierCategory.class, new BarrierTypeSerializer());

        this.gson = gsonBuilder.create();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> responseJson = new HashMap<>();

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseJson.put("error", "O parâmetro 'id' da escola é obrigatório.");
            out.print(this.gson.toJson(responseJson));
            out.flush();
            return;
        }

        int schoolId;
        try {
            schoolId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            responseJson.put("error", "O parâmetro 'id' da escola deve ser um número inteiro válido.");
            out.print(this.gson.toJson(responseJson));
            out.flush();
            return;
        }

        try {
            SchoolDAO schoolDAO = new SchoolDAO();
            ManagerDAO managerDAO = new ManagerDAO();
            RegistryDAO registryDAO = new RegistryDAO();

            School school = schoolDAO.getSchoolById(schoolId);
            Manager manager = null;
            List<Registry> barriers = null;

            if (school != null) {
                try {
                    manager = managerDAO.getManagerBySchoolName(school.getName());
                } catch (Exception e) {

                }
                barriers = registryDAO.listRegistriesBySchoolId(schoolId);
            }

            if (school != null) {
                Map<String, Object> dataForClient = new HashMap<>();
                dataForClient.put("school", school);
                dataForClient.put("managerName", (manager != null) ? manager.getName() : "Não informado");
                dataForClient.put("barriers", barriers);

                out.print(this.gson.toJson(dataForClient));
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                responseJson.put("error", "Escola com ID " + schoolId + " não encontrada.");
                out.print(this.gson.toJson(responseJson));
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            responseJson.put("error", "Ocorreu um erro inesperado no servidor.");
            out.print(this.gson.toJson(responseJson));
        } finally {
            if (out != null) {
                out.flush();
            }
        }
    }
}