package br.com.simba.model.enums;

public enum BarrierCriticality {
    HIGH("Alta"),
    MODERATE("Moderada"),
    LOW("Baixa");

    private final String displayName;

    BarrierCriticality(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
