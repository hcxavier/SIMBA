package br.com.simba.model.valueobject;

import br.com.simba.exceptions.InvalidPhoneException;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Phone {
    private final String number;

    private final static Pattern PHONE_PATTERN = Pattern.compile("^\\d{11}$");

    public Phone (String number){
        String cleanedNumber = number.replaceAll("\\D", "");
        verifyNumber(cleanedNumber);
        this.number = number.replaceAll("\\D", "");
    }

    public String getNumberWithoutAreaCode(){
        if (this.number == null) return null;

        return number.substring(2, 11);
    }

    public String getFirstFiveNumbers(){
        if (this.number == null) return null;

        return number.substring(2, 8);
    }

    public String getLastFourNumbers(){
        if (this.number == null) return null;

        return number.substring(7, 11);
    }

    public String getFormattedPhone(){
        if (this.number == null) return null;

        return String.format("(%s) %s-%s", getAreaCode(), getFirstFiveNumbers(), getLastFourNumbers());
    }


    public String getAreaCode(){
        if (this.number == null) return null;

        return number.substring(0, 2);
    }

    private void verifyNumber(String number) throws InvalidPhoneException {
        if (number == null) throw new InvalidPhoneException("Invalid phone number!");
        if (number.isEmpty()) throw new InvalidPhoneException("Phone number cannot be empty!");

        Matcher matcher = PHONE_PATTERN.matcher(number);

        if (!matcher.matches()) throw new InvalidPhoneException("Invalid phone number! The number must be 11 digits.");
    }

    @Override
    public String toString() {
        return number;
    }

    @Override
    public boolean equals(Object object) {
        if (object == null || getClass() != object.getClass()) return false;
        if (object == this) return true;

        Phone outsideNumber = (Phone) object;

        return number.equals(outsideNumber.number);
    }

    @Override
    public int hashCode() {
        return Objects.hash(number);
    }
}
