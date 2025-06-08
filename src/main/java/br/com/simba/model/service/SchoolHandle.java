package br.com.simba.model.service;

import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.School;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SchoolHandle {
    private List<School> schools;
    private SchoolDAO schoolDAO;

    public SchoolHandle(){
        schoolDAO = new SchoolDAO();
        try {
            schools = schoolDAO.listAllSchools();
        } catch (Exception e) {
            schools = null;
        }
    }

    public List<School> getSchoolsByName(String name){
        List<School> foundSchools = new ArrayList<>();
        if (name == null || schools == null) return foundSchools;

        for (int i = 0; i < schools.size() && foundSchools.size() < 4; i++){
            if(schools.get(i).getName().toLowerCase().contains(name.toLowerCase())) foundSchools.add(schools.get(i));
        }

        return foundSchools;
    }

    public List<School> getSchoolsByCityAndName(String city, String name){
        List<School> foundSchools = new ArrayList<>();
        if (schools == null) return foundSchools;

        for (int i = 0; i < schools.size(); i++){
            if (schools.get(i).getCity().toLowerCase().contains(city.toLowerCase())){
                if (name != null && schools.get(i).getName().toLowerCase().contains(name.toLowerCase())) {
                    foundSchools.add(schools.get(i));
                    continue;
                }

                if (name == null) foundSchools.add(schools.get(i));
            }
        }

        return foundSchools;
    }

    public int getAmountSchools(){
        return schools != null ? schools.size() : 0;
    }

}
