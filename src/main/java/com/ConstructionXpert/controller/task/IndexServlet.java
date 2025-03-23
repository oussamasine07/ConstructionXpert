package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.model.Project;
import com.ConstructionXpert.model.Task;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/tasks")
public class IndexServlet extends HttpServlet {

    TaskDAO taskDAO = null;
    ProjectDAO projectDAO = null;
    ConsumedResourceDAO consumedResourceDAO = null;
    public void init () {
        projectDAO = new ProjectDAO();
        taskDAO = new TaskDAO();
        consumedResourceDAO = new ConsumedResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        /*
        * show these details
        * name
        * budget, spent amount, rest of budge, count tasks
        * descption
        * and list of all tasks
        * */

        Project project = projectDAO.getProjectById( projectId );
        req.setAttribute("project", project);

        List<Task> tasks = taskDAO.listProjectTasks(projectId);
        req.setAttribute("tasks", tasks);

        double totalSpent = consumedResourceDAO.getProjectTotalSpent( projectId );
        req.setAttribute("totalSpent", totalSpent);

        int totalTasks = taskDAO.countTasks( projectId );
        req.setAttribute("totalTasks", totalTasks);

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/index.jsp");
        rd.forward(req, res);
    }

}
