package com.ConstructionXpert.model;

public class Admin {

    private int adminId;
    private String name;
    private String email;
    private String password;

    public Admin () {}

    public Admin(String email, String name, int adminId) {
        this.email = email;
        this.name = name;
        this.adminId = adminId;
    }

    public int getAdminId() {
        return adminId;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
