package com.ConstructionXpert.controller.project;

import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/project")
public class IndexServlet extends HttpServlet {

    ProjectDAO projectDAO = null;
    public void init () {
        projectDAO = new ProjectDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {

        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");

        List<Project> projects = projectDAO.listProjectsByAdminId(admin.getAdminId());

        req.setAttribute("projects", projects);

        RequestDispatcher rd = req.getRequestDispatcher("/views/project/index.jsp");
        rd.forward(req, res);

    }

}
































