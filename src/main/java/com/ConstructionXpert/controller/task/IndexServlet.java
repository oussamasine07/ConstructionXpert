package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.TaskDAO;
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

    public void init () {
        taskDAO = new TaskDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        List<Task> tasks = taskDAO.listProjectTasks(projectId);
        req.setAttribute("tasks", tasks);

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/index.jsp");
        rd.forward(req, res);
    }

}
