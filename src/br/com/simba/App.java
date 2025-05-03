package br.com.simba;

import br.com.simba.model.dao.StudentDAO;
import br.com.simba.model.dao.TeacherDAO;
import br.com.simba.model.dao.UserDAO;
import br.com.simba.model.dao.SchoolDAO;
import br.com.simba.model.entities.Student;
import br.com.simba.model.entities.*;
import br.com.simba.model.valueobject.*;

public class App{
    public static void main(String[] args){
        UserDAO userDAO = new UserDAO();
        StudentDAO studentDAO = new StudentDAO();
        TeacherDAO teacherDao = new TeacherDAO();
        SchoolDAO s = new SchoolDAO();
        Username username = new Username("maiko_sousa");
        Email email = new Email("maiko@gmail.com");
        User user = new User(1, "maiko_sousa", "", "Rua do Cidadeú", 123, "Centro", "São Paulo", "SP",  "maiko@gmail.com", "1A2#34567ujn");
        //userDAO.createNewUser(user);
        //User user2 = new User("maiko_sousa", "Maiko André A. de Sousa", "Rua do Cidadeú", 123, "Centro", "São Paulo", "SP",  "maiko@gmail.com", "1A2#34567ujn");

        //System.out.println(userDAO.findByUsername("maiko_sousa").getName());
        Student student = new Student(1, "maiko_sousa", "", "Rua do Cidadeú", 123, "Centro", "São Paulo", "SP",  "maiko@gmail.com", "1A2#34567ujn", 1234);
        //studentDAO.insertNewStudent(student);

        Teacher teacher = new Teacher(
                1,                             // ID
                "prof_juliana",               // Username
                "Juliana Oliveira",                           // (Talvez nome completo ou sobrenome vazio por enquanto)
                "almeiras",         // Endereço
                456,                          // Número
                "Jardim Botânico",           // Bairro
                "Rio de Janeiro",            // Cidade
                "RJ",                         // Estado
                "juliana@gmail.com",        // Email
                "Senh@F0rte!",               // Senha
                "9876543"                          // Código, matrícula, etc.
        );
        teacherDao.createNewTeacher(teacher);
        //System.out.println(teacherDao.findById(1).getName());

        School school = new School("Virginio Cruz", "Aristides José Tolentino", 79, "Alto São João", "Espinosa", "MG", "99999999999");
        s.createNewSchool(school);
        s.select("Virginio Cruz");
        System.out.println(s.select("Virginio Cruz").getName());
        //studentDAO.updatePassword("2A2#34567ujn", student);


        //System.out.println(studentDAO.findById(1).getName())

        ;
    }


}