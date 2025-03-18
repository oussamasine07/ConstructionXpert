package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO extends ConnectToDb {

    private static final String LIST_PROJECTS_BY_ADMIN_ID = "select * from projects\n" +
            "where admin_id = ?;";

    public ProjectDAO () {}

    public List<Project> listProjectsByAdminId (int adminId) {
        List<Project> projects = new ArrayList<>();

        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(LIST_PROJECTS_BY_ADMIN_ID);
        ){
            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Project project = new Project();
                Admin admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                project.setName(rs.getString("name"));
                project.setStartDate(rs.getString("startDate"));
                project.setEndDate(rs.getString("endDate"));
                project.setBudget(rs.getDouble("budget"));

                projects.add(project);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return projects;
    }

}
