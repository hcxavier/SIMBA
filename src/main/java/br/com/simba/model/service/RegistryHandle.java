package br.com.simba.model.service;

import br.com.simba.model.dao.RegistryDAO;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.Registry;
import br.com.simba.model.entities.School;
import br.com.simba.model.enums.BarrierCriticality;
import br.com.simba.model.enums.BarrierStatus;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class RegistryHandle {
    private final Connection connection;
    private List<Registry> userRegistries;
    private List<Registry> firstRecentRegistries;
    private List<Registry> firstOldRegistries;
    private RegistryDAO registryDAO;

    public RegistryHandle(Connection connection, String username){
        this.connection = connection;
        registryDAO = new RegistryDAO(connection);
        userRegistries = registryDAO.listAllUserRegistries(username);
        firstOldRegistries = registryDAO.listAllUserRegistriesOrderedByOldestDate(username);
        firstRecentRegistries = registryDAO.listAllUserRegistriesOrderedByRecentDate(username);
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
}
