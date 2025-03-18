package com.ConstructionXpert.dto;

import jakarta.validation.constraints.*;

public class ResourceDTO {

    @NotBlank(message = "resouce name is required")
    private String name;

    @NotNull(message = "quantity is required")
    @Min(value = 1, message = "quantity should be at least 1")
    private int quantity;


    @Positive(message = "price should be greater than 0")
    private double unitPrice;

    public ResourceDTO(String name, int quantity, double unitPrice) {
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }
}
