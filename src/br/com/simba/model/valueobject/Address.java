package br.com.simba.model.valueobject;

import br.com.simba.config.exceptions.InvalidAddressException;

import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Address {
    private String street;
    private int number;
    private String neighborhood;
    private String city;
    private String stateAbbr;
    private String cep;

    private static final Pattern STREET_PATTERN = Pattern.compile("^[\\p{L}\\s\\d-]*$");
    private static final Pattern NEIGHBORHOOD_PATTERN = Pattern.compile("^[\\p{L}\\s\\d-]*$");
    private static final Pattern CITY_PATTERN = Pattern.compile("^[\\p{L}\\s-]*$");
    private static final Pattern STATE_PATTERN = Pattern.compile("^[\\p{L}\\s]*$");
    private static final Pattern CEP_PATTERN = Pattern.compile("^[\\d]{5}-[\\d]{3}$");

    public Address(String street, int number, String neighborhood, String city, String stateAbbr, String cep) {
        verifyAddress(street, number, neighborhood, city, stateAbbr, cep);

        this.street = street;
        this.number = number;
        this.neighborhood = neighborhood;
        this.city = city;
        this.stateAbbr = stateAbbr;
        this.cep = cep;
    }

    private void verifyAddress(String street, int number, String neighborhood, String city, String stateAbbr, String cep) throws InvalidAddressException {
        verifyStreet(street);
        verifyNumber(number);
        verifyNeighborhood(neighborhood);
        verifyCity(city);
        verifystateAbbr(stateAbbr);
        verifyCep(cep);
    }

    private void verifyStreet(String street) throws InvalidAddressException {
        if (street == null) throw new InvalidAddressException("Invalid street!");

        if (street.isEmpty()) throw new InvalidAddressException("Invalid street! Street cannot be empty.");

        Matcher matcherStreet = STREET_PATTERN.matcher(street);

        if (!matcherStreet.matches()) throw new InvalidAddressException("Invalid Street!");
    }

    private void verifyNumber(int number) throws InvalidAddressException {
        if (number <= 0) throw new InvalidAddressException("Invalid Number! The number must be a positive integer or not zero!");
    }

    private void verifyNeighborhood(String neighborhood) throws InvalidAddressException {
        if (neighborhood == null || neighborhood.isEmpty()) throw new InvalidAddressException("Invalid Neighborhood!");

        Matcher matcherNeighborhood = NEIGHBORHOOD_PATTERN.matcher(neighborhood);

        if (!matcherNeighborhood.matches()) throw new InvalidAddressException("Invalid Neighborhood!");
    }

    private void verifyCity(String city) throws InvalidAddressException {
        if (city == null || city.isEmpty()) throw new InvalidAddressException("Invalid City!");

        Matcher matcherCity = CITY_PATTERN.matcher(city);

        if (!matcherCity.matches()) throw new InvalidAddressException("Invalid City!");
    }

    private void verifystateAbbr(String stateAbbr) throws InvalidAddressException {
        if (stateAbbr == null) throw new InvalidAddressException("Invalid stateAbbr!");

        if (stateAbbr.isEmpty()) throw new InvalidAddressException("Invalid stateAbbr! The stateAbbr cannot be empty.");

        Matcher matcherStateAbbr = STATE_PATTERN.matcher(stateAbbr);

        if (!matcherStateAbbr.matches()) throw new InvalidAddressException("Invalid stateAbbr!");
    }

    private void verifyCep(String cep) throws InvalidAddressException {
        if (cep == null) throw new InvalidAddressException("Invalid CEP!");

        if (cep.isEmpty()) throw new InvalidAddressException("Invalid CEP! CEP cannot be empty.");

        Matcher matcherCep = CEP_PATTERN.matcher(cep);

        if (!matcherCep.matches()) throw new InvalidAddressException("Invalid CEP! The format must be XXXXX-XXX.");
    }

    @Override
    public String toString() {
        return String.format("%s, %s, %s, %s - %s, %s", street, number, neighborhood, city, stateAbbr, cep);
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null) return false;
        if (getClass() != object.getClass()) return false;

        Address other = (Address) object;

        return other.street.equals(this.street) && other.number == this.number
                && other.city.equals(this.city) && other.stateAbbr.equals(this.stateAbbr)
                && other.cep.equals(this.cep) && other.neighborhood.equals(this.neighborhood);
    }

    @Override
    public int hashCode() {
        return Objects.hash(street, number, neighborhood, city, stateAbbr, cep);
    }
}
