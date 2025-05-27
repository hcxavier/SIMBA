package br.com.simba.model.enums;

public enum BarrierCategory {
    ACCESS("Acessos"),
    IE_CIRCULATION("Circulação Interna/Externa"),
    FURNITURE("Mobiliário"),
    RESTROOMS("Sanitários"),
    SIGNAGE("Sinalização"),
    EQUIPMENT("Equipamentos"),
    PARKING("Estacionamentos"),
    COMMUNICATION("Comunicação");

    private final String displayName;

    BarrierCategory(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
