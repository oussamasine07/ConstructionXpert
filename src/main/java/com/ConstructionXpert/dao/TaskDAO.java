package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Project;
import com.ConstructionXpert.model.Task;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO extends ConnectToDb {

    private static final String LIST_TASKS_BY_PROJECT_ID = "select * from tasks\n" +
            "where project_id = ?;";

    private static final String INSERT_TASK = "insert into tasks\n" +
            "    (project_id, name, description, startDate, endDate)\n" +
            "values\n" +
            "    (?, ?, ?, ?, ?);";

    public TaskDAO () {}
    private ProjectDAO projectDAO = new ProjectDAO();

    public List<Task> listProjectTasks (int projectId) {
        List<Task> tasks = new ArrayList<>();

        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(LIST_TASKS_BY_PROJECT_ID);
        ){
            stmt.setInt(1, projectId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Project project = projectDAO.getProjectById(rs.getInt("project_id"));

                Task task = new Task();
                task.setTaskId(rs.getInt("id"));
                task.setName(rs.getString("name"));
                task.setDescription(rs.getString("description"));
                task.setStartDate(LocalDate.parse(rs.getString("startDate")));
                task.setEndDate(LocalDate.parse(rs.getString("endDate")));
                task.setProject(project);

                tasks.add(task);

            }

        }
        catch (SQLException e) {

        }

        return tasks;
    }

    public Task insertTask ( Task task ) {
        Task insertedTask = new Task();
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(INSERT_TASK, Statement.RETURN_GENERATED_KEYS);
        ){
            stmt.setInt(1, task.getProject().getProjectId());
            stmt.setString(2, task.getName());
            stmt.setString(3, task.getDescription());
            stmt.setString(4, task.getStartDate().toString());
            stmt.setString(5, task.getEndDate().toString());

            System.out.println(stmt.toString());
            stmt.executeUpdate();

            ResultSet rs = stmt.getGeneratedKeys();

            insertedTask.setTaskId(rs.getInt(1));
            insertedTask.setName(rs.getString(3));
            insertedTask.setDescription(rs.getString(4));

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return insertedTask;
    }

}
