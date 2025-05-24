//package br.com.simba.model.dao;
//
//import br.com.simba.model.entities.*;
//import br.com.simba.model.enums.BarrierCriticality;
//import br.com.simba.model.enums.BarrierType;
//import br.com.simba.model.valueobject.*;
//
//import java.sql.Connection;
//import java.time.LocalDate;
//import java.util.List;
//
//public class DAOTests {
//    public static void main(String[] args) {
//        Username username = new Username("ana.moura");
//        DBConnection connection = new PostgresConnection();
//        // Supondo que você já tenha as classes Picture e School implementadas
//        Picture picture = new Picture(); // ou use um construtor adequado
//        School school = new School();    // ou use um construtor adequado
//
//        Registry registry = new Registry(
//                BarrierCriticality.HIGH,           // Criticidade alta
//                picture,                           // Objeto Picture
//                school,                            // Objeto School
//                "Sala 101",                        // Localização
//                "Porta estreita",                  // Especificação da barreira
//                "Trocar a porta por uma mais larga", // Sugestão de resolução
//                BarrierType.PHYSICAL_ACCESS,       // Tipo de barreira: acesso físico
//                LocalDate.of(2024, 5, 19)          // Data de identificação
//        );
//    }
//}
