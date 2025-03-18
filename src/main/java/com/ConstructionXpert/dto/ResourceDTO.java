package com.ConstructionXpert.dto;

import jakarta.validation.constraints.*;

public class ResourceDTO {

    @NotBlank(message = "resouce name is required")
    private String name;

    @NotBlank(message = "quantity is required")
    private int quantity;

    @NotBlank(message = "unit price is required")
    private double unitPrice;

    public ResourceDTO(String name, int quantity, double unitPrice) {
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public @NotBlank(message = "resouce name is required") String getName() {
        return name;
    }

    public void setName(@NotBlank(message = "resouce name is required") String name) {
        this.name = name;
    }

    @NotBlank(message = "quantity is required")
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(@NotBlank(message = "quantity is required") int quantity) {
        this.quantity = quantity;
    }

    @NotBlank(message = "unit price is required")
    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(@NotBlank(message = "unit price is required") double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
