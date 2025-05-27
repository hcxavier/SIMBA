package br.com.simba.model.enums;

public enum BarrierStatus {
    UNDER_ANALYSIS("Em Análise"),
    CORRECTING("Corrigindo"),
    RESOLVED("Resolvido");

    private final String displayName;

    BarrierStatus(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}



