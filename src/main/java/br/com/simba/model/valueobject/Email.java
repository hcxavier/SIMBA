package br.com.simba.model.valueobject;

import br.com.simba.exceptions.InvalidEmailException;

import java.util.Objects;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Email {
    private String email;
    private static final String GMAIL = "gmail.com";
    private static final String HOTMAIL = "hotmail.com";
    private static final String OUTLOOK = "outlook.com";
    private static final String YAHOO = "yahoo.com";
    private static final String ICLOUD = "icloud.com";
    private static final String AOL = "aol.com";
    private static final String MAIL = "mail.com";
    private static final String MSN = "msn.com";
    private static final String PROTONMAIL = "protonmail.com";
    private static final String ZOHO = "zoho.com";
    private static final String GMX = "gmx.com";
    private static final String YANDEX = "yandex.com";
    private static final String FASTMAIL = "fastmail.com";
    private static final String ME = "me.com";
    private static final String UOL = "uol.com.br";
    private static final String BOL = "bol.com.br";
    private static final String TERRA = "terra.com.br";
    private static final String R7 = "r7.com";


    public Email (String email){
        verifyEmail(email);
        this.email = email;
    }

    private void verifyEmail (String email) throws InvalidEmailException {
        verifyDomain(email);

        String regexEmail = "^[a-zA-Z\\d]+[\\w+\\.?][^@\\.\\W]+@[a-z0-9]+\\.[a-z]+[\\.]*[a-z]*$";
        Pattern pattern = Pattern.compile(regexEmail);
        Matcher matcher = pattern.matcher(email);

        if (!matcher.matches()) throw new InvalidEmailException("Invalid email!");
    }

    private void verifyDomain(String email) throws InvalidEmailException {
        int afterAt = email.indexOf("@") + 1;
        String domainAnalyzed = email.substring(afterAt);

        if (!domainAnalyzed.equals(GMAIL) && !domainAnalyzed.equals(HOTMAIL) && !domainAnalyzed.equals(OUTLOOK) && !domainAnalyzed.equals(YAHOO) && !domainAnalyzed.equals(ICLOUD) && !domainAnalyzed.equals(AOL) && !domainAnalyzed.equals(MAIL) && !domainAnalyzed.equals(MSN) && !domainAnalyzed.equals(PROTONMAIL) && !domainAnalyzed.equals(ZOHO) && !domainAnalyzed.equals(GMX) && !domainAnalyzed.equals(YANDEX) && !domainAnalyzed.equals(FASTMAIL) && !domainAnalyzed.equals(ME) && !domainAnalyzed.equals(UOL) && !domainAnalyzed.equals(BOL) && !domainAnalyzed.equals(TERRA) && !domainAnalyzed.equals(R7))
            throw new InvalidEmailException("Invalid Domain!");
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        Email outsideEmail = (Email) object;
        return Objects.equals(email, outsideEmail.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email);
    }

    @Override
    public String toString(){
        return email;
    }
}
