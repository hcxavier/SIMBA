package br.com.simba.model.valueobject;

import java.util.Objects;

public class CNPJ {
    private final String cnpj;

    public CNPJ(String cnpjInput) {
        if (cnpjInput == null) throw new IllegalArgumentException("CNPJ cannot be null!");
        String cleanedCnpj = cnpjInput.replaceAll("[^0-9]", "");

        if (!isValid(cleanedCnpj)) throw new IllegalArgumentException("Invalid CNPJ: " + cnpjInput);
        this.cnpj = cleanedCnpj;
    }

    private boolean isValid(String cnpj) {
        if (cnpj == null || cnpj.length() != 14 || !cnpj.matches("\\d{14}")) return false;

        if (cnpj.matches("(\\d)\\1{13}")) return false;

        int digitOne = calculateFirstDigit(cnpj.substring(0, 12));
        int digitTwo = calculateSecondDigit(cnpj.substring(0, 12) + digitOne);

        return cnpj.endsWith("" + digitOne + digitTwo);
    }

    private int calculateFirstDigit(String str) {
        int[] multipliers = {5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        return calculateDigit(str, multipliers);
    }

    private int calculateSecondDigit(String str) {
        int[] multipliers = {6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2};
        return calculateDigit(str, multipliers);
    }

    private int calculateDigit(String str, int[] multipliers) {
        int sum = 0;
        for (int i = 0; i < str.length(); i++) {
            sum += Integer.parseInt(str.substring(i, i + 1)) * multipliers[i];
        }
        int remainder = sum % 11;
        return (remainder < 2) ? 0 : 11 - remainder;
    }

    public String getFormatted() {
        return cnpj.replaceFirst("(\\d{2})(\\d{3})(\\d{3})(\\d{4})(\\d{2})", "$1.$2.$3/$4-$5");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CNPJ)) return false;
        CNPJ other = (CNPJ) o;
        return Objects.equals(this.cnpj, other.cnpj);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cnpj);
    }

    @Override
    public String toString() {
        return cnpj;
    }
}