package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO extends ConnectToDb {

    private static final String LIST_PROJECTS_BY_ADMIN_ID = "select * from projects\n" +
            "where admin_id = ?;";
    private static final String GET_PROJECT_BY_ID = "select * from projects\n" +
            "where id = ?;";
    private static final String INSERT_PROJECT = "insert into projects\n" +
            "    (admin_id, name, description, startDate, endDate, budget)\n" +
            "values\n" +
            "    (?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_PROJECT = "update projects\n" +
            "    set\n" +
            "        name = ?,\n" +
            "        description = ?,\n" +
            "        startDate = ?,\n" +
            "        endDate = ?,\n" +
            "        budget  = ?\n" +
            "where id = ?;";
    private static final String DELETE_PROJECT = "delete from projects\n" +
            "where id = ?;";

    private static final String COUNT_PROJECTS = "select\n" +
            "    count(*) as count_projects\n" +
            "from projects\n" +
            "where projects.admin_id = ?;";

    private static final String GET_LAST_THREE_PROJECTS = "select * from projects\n" +
            "where admin_id = ?\n" +
            "order by id desc\n" +
            "limit ?;";

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
                project.setProjectId(rs.getInt("id"));
                project.setName(rs.getString("name"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(LocalDate.parse(rs.getString("startDate")));
                project.setEndDate(LocalDate.parse(rs.getString("endDate")));
                project.setBudget(rs.getDouble("budget"));

                projects.add(project);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

        return projects;
    }

    public Project getProjectById ( int projectId ) {
        Project project = new Project();

        try (
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement(GET_PROJECT_BY_ID);
        ){
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                project.setProjectId(rs.getInt("id"));
                project.setName(rs.getString("name"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(LocalDate.parse(rs.getString("startDate")));
                project.setEndDate(LocalDate.parse(rs.getString("endDate")));
                project.setBudget(rs.getDouble("budget"));
            }

        }
        catch (SQLException e){

        }

        return project;

    }

    public void insertProject (Project project) {

        try (
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement(INSERT_PROJECT);
        ){
            stmt.setInt(1, project.getAdmin().getAdminId());
            stmt.setString(2, project.getName());
            stmt.setString(3, project.getDescription());
            stmt.setString(4, project.getStartDate().toString());
            stmt.setString(5, project.getEndDate().toString());
            stmt.setDouble(6, project.getBudget());

            System.out.println(stmt.toString());
            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void updateProject (Project project) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(UPDATE_PROJECT);
        ){
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setString(3, project.getStartDate().toString());
            stmt.setString(4, project.getEndDate().toString());
            stmt.setDouble(5, project.getBudget());
            stmt.setInt(6, project.getProjectId());

            System.out.println(stmt.toString());
            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProjectById (int projectId) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(DELETE_PROJECT);
        ){
            stmt.setInt(1, projectId);

            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int countTotalProjects (int adminId ) {
        int count = 0;
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(COUNT_PROJECTS)
        ){
            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();
            while ( rs.next() ) {
                count = rs.getInt("count_projects");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Project> getLastProjectsByLimit (int adminId, int limit) {
        List<Project> projects = new ArrayList<>();
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(GET_LAST_THREE_PROJECTS);
        ){
            stmt.setInt(1, adminId);
            stmt.setInt(2, limit);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()){
                Project project = new Project();
                Admin admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                project.setProjectId(rs.getInt("id"));
                project.setName(rs.getString("name"));
                project.setDescription(rs.getString("description"));
                project.setStartDate(LocalDate.parse(rs.getString("startDate")));
                project.setEndDate(LocalDate.parse(rs.getString("endDate")));
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






















