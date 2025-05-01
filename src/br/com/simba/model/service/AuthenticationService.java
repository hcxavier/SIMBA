package br.com.simba.model.service;

import br.com.simba.model.entities.Student;
import br.com.simba.model.entities.Teacher;
import br.com.simba.model.entities.User;
import br.com.simba.model.dao.StudentDAO;
import br.com.simba.model.dao.TeacherDAO;
import br.com.simba.model.valueobject.Username;
import org.mindrot.jbcrypt.BCrypt;

public class AuthenticationService {
    public boolean login (Username username, String password) {
        String usernameEntry = username.toString();
        TeacherDAO teacherDAO = new TeacherDAO();
        StudentDAO studentDAO = new StudentDAO();

        Teacher foundTeacher = teacherDAO.findByUsername(usernameEntry);

        if (foundTeacher != null && BCrypt.checkpw(password, foundTeacher.getPassword())) return true;

        Student foundStudent = studentDAO.findByUsername(usernameEntry);

        if (foundStudent != null && BCrypt.checkpw(password, foundStudent.getPassword())) return true;

        return false;
    }
}
