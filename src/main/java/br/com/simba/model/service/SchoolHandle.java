package br.com.simba.model.service;

import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.School;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class SchoolHandle {
    private final Connection connection;
    private List<School> schools;
    private SchoolDAO schoolDAO;

    public SchoolHandle(Connection connection){
        this.connection = connection;
        schoolDAO = new SchoolDAO(connection);
        schools = schoolDAO.listAllSchools();
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
}
