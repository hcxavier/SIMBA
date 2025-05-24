package br.com.simba.model.valueobject;

import br.com.simba.exceptions.InvalidUsernameException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Username {
    private final String username;

    private final Pattern USERNAME_PATTERN = Pattern.compile("^[a-zA-Z\\d][\\w.]+[a-zA-Z\\d]$");
    private final String ADMIN = "admin";
    private final String USER = "user";
    private final String SUPPORT = "support";

    public Username(String username) {
        verifyUsername(username);
        this.username = username;
    }

    private void verifyUsername(String username) throws InvalidUsernameException {
        if (username == null) throw new InvalidUsernameException("Invalid Username!");
        if (username.isEmpty()) throw new InvalidUsernameException("Invalid Username! Username cannot be empty!");

        verifyReservedWords(username);

        Matcher matcher = USERNAME_PATTERN.matcher(username);

        if (!matcher.matches()) throw new InvalidUsernameException("Invalid Username! Username may only contain letters, numbers, underscores, dots and 3 characters or more.");
    }

    private void verifyReservedWords(String username) throws InvalidUsernameException {
        if (username.equals(ADMIN) || username.equals(SUPPORT) || username.equals(USER))
            throw new InvalidUsernameException("Invalid Username! Username cannot be reserved words: admin, user, support.");
    }

    public boolean isEmpty(){
        return username.isEmpty();
    }

    @Override
    public String toString(){
        return username;
    }

    @Override
    public boolean equals(Object object) {
        if (object == null) return false;
        if (object == this) return true;
        if (!(object instanceof Username)) return false;

        Username outsideUsername = (Username) object;

        return username.equals(outsideUsername.username);
    }

    @Override
    public int hashCode() {
        return username.hashCode();
    }
}
