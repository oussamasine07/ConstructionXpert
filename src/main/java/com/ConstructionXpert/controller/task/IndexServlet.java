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

@WebServlet("/task")
public class IndexServlet extends HttpServlet {

    TaskDAO taskDAO = null;

    public void init () {
        taskDAO = new TaskDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        List<Task> tasks = taskDAO.listAllTasks(1);
        req.setAttribute("tasks", tasks);

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/index.jsp");
        rd.forward(req, res);
    }

}
