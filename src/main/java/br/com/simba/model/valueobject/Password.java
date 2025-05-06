package br.com.simba.model.valueobject;
import br.com.simba.config.exceptions.InvalidPasswordException;
import org.mindrot.jbcrypt.BCrypt;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Password {
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#_\\-]).{6,128}$");
    private String hash;

    public Password (String passwd) throws InvalidPasswordException{
        verifyPassword(passwd);
        hash = BCrypt.hashpw(passwd, BCrypt.gensalt(12));
    }


    private void verifyPassword(String passwd){
        Matcher matcher = PASSWORD_PATTERN.matcher(passwd);

        if (!matcher.matches()) throw new InvalidPasswordException("Password must include at least 1 of this characters: letter(lowercase, uppercase), numbers(0-9), symbols(@-_#) and length must be 6 and 128 characters");
    }

    public static Password fromHash(String hash){
        Password password = new Password();
        password.hash = hash;
        return password;
    }

    private Password(){}

    public String getHash(){
        return hash;
    }

    public boolean isCorrect(String plainPasswd){
        return BCrypt.checkpw(plainPasswd, hash);
    }
}
