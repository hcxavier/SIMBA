package br.com.simba.model.valueobject;

import br.com.simba.exceptions.InvalidCPFException;

import java.util.Objects;

public class CPF {
    private final String value;

    public CPF(String cpf) {
        this.value = verifyAndCleanCPF(cpf);
    }

    private String verifyAndCleanCPF(String cpf) throws InvalidCPFException {
        if (cpf == null) {
            throw new InvalidCPFException("CPF não pode ser nulo.");
        }

        String cleanedCpf = cpf.replaceAll("[^0-9]", "");

        if (cleanedCpf.length() != 11) throw new InvalidCPFException("CPF deve conter 11 dígitos numéricos. Fornecido: " + cpf);

        if (cleanedCpf.matches("(\\d)\\1{10}")) throw new InvalidCPFException("CPF inválido (sequência de dígitos repetidos).");

        int sum = 0;

        for (int i = 0; i < 9; i++) {
            sum += (cleanedCpf.charAt(i) - '0') * (10 - i);
        }

        int remainder1 = sum % 11;

        int dv1Calculated = (remainder1 < 2) ? 0 : (11 - remainder1);
        int dv1Provided = cleanedCpf.charAt(9) - '0';

        if (dv1Calculated != dv1Provided) {
            throw new InvalidCPFException("Primeiro dígito verificador inválido.");
        }

        sum = 0;
        for (int i = 0; i < 10; i++) {
            sum += (cleanedCpf.charAt(i) - '0') * (11 - i);
        }
        int remainder2 = sum % 11;
        int dv2Calculated = (remainder2 < 2) ? 0 : (11 - remainder2);
        int dv2Provided = cleanedCpf.charAt(10) - '0';

        if (dv2Calculated != dv2Provided) {
            throw new InvalidCPFException("Segundo dígito verificador inválido.");
        }

        return cleanedCpf;
    }

    public String getValue() {
        return value;
    }

    public String getFormattedValue() {
        if (value == null || value.length() != 11) {
            return value;
        }
        return String.format("%s.%s.%s-%s",
                value.substring(0, 3),
                value.substring(3, 6),
                value.substring(6, 9),
                value.substring(9, 11));
    }

    @Override
    public String toString() {
        return getFormattedValue();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CPF cpf = (CPF) o;
        return Objects.equals(value, cpf.value);
    }

    @Override
    public int hashCode() {
        return Objects.hash(value);
    }
}