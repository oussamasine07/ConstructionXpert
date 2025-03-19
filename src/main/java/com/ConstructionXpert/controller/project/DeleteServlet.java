package com.ConstructionXpert.controller.project;

import com.ConstructionXpert.dao.ProjectDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/project/delete")
public class DeleteServlet extends HttpServlet {

    ProjectDAO projectDAO = null;
    public void init () {
        projectDAO = new ProjectDAO();
    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        int projectId = Integer.parseInt(req.getParameter("id"));
        projectDAO.deleteProjectById(projectId);
        res.sendRedirect(req.getContextPath() + "/project");
    }
}
