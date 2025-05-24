package br.com.simba.model.valueobject;

import br.com.simba.exceptions.InvalidSiapeException;

public class Siape {
    private String siape;

    public Siape(String siape) {
        int length = siape.length();
        String treatedSiape = siape.replaceAll("\\D", "");

        verifySiape(treatedSiape, length);
        String formatSpecifier = "%" + 7 + "s";

        this.siape = String.format(formatSpecifier, treatedSiape).replaceAll(" ", "0");
    }

    private void verifySiape(String siape, int length) throws InvalidSiapeException {
        if (length > 7) throw new InvalidSiapeException("Invalid Siape! Siape is too long!");
    }

    @Override
    public String toString() {
        return siape;
    }

    @Override
    public boolean equals(Object object) {
        if (object == null) return false;
        if (object == this) return true;
        if (!(object instanceof Siape)) return false;

        Siape outsideSiape = (Siape) object;

        return siape.equals(outsideSiape.siape);
    }

    @Override
    public int hashCode() {
        return siape.hashCode();
    }
}
