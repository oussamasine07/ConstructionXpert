package com.ConstructionXpert.dto;

import com.ConstructionXpert.model.Admin;
import jakarta.validation.constraints.*;

import java.time.LocalDate;

public class ProjectDTO {

    @NotBlank(message = "name field is required")
    private String name;

    @NotBlank(message = "description is required")
    private String description;

    @NotNull(message = "start date is required")
    @FutureOrPresent(message = "date should from present to future")
    LocalDate startDate;

    @NotNull(message = "end date is required")
    @FutureOrPresent(message = "date should from present to future")
    private LocalDate endDate;

    @Positive(message = "budget should be greater than 0")
    private double budget;

    public ProjectDTO(String name, String description, LocalDate startDate, LocalDate endDate, double budget) {
        this.name = name;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
        this.budget = budget;
    }

    public String getName() {
        return name;
    }

    public void setName( String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription( String description) {
        this.description = description;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }
}
