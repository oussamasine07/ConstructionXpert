package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.TaskDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/tasks/delete")
public class DeleteServlet extends HttpServlet {

    TaskDAO taskDAO = null;
    public void init () {
        taskDAO = new TaskDAO();
    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));

        taskDAO.deleteTaskById( taskId );

        res.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId);
    }

}












