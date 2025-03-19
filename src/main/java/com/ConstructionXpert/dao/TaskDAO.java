package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Project;
import com.ConstructionXpert.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO extends ConnectToDb {

    private static final String LIST_TASKS_BY_PROJECT_ID = "select * from tasks\n" +
            "where project_id = ?;";

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
                task.setStartDate(rs.getString("startDate"));
                task.setEndDate(rs.getString("endDate"));
                task.setProject(project);

                tasks.add(task);

            }

        }
        catch (SQLException e) {

        }

        return tasks;
    }

}
