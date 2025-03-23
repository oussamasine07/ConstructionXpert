package com.ConstructionXpert.controller.admin;

import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.dao.ResourceDAO;
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

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    ProjectDAO projectDAO = null;
    ConsumedResourceDAO consumedResourceDAO = null;
    ResourceDAO resourceDAO = null;

    public void init () {
        projectDAO = new ProjectDAO();
        consumedResourceDAO = new ConsumedResourceDAO();
        resourceDAO = new ResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");

        int countProjects = projectDAO.countTotalProjects(admin.getAdminId());
        req.setAttribute("countProjects", countProjects);

        double totalSpent = consumedResourceDAO.getTotalSpent( admin.getAdminId() );
        req.setAttribute("totalSpent", totalSpent);

        int coutResources = resourceDAO.getTotalResources(admin.getAdminId());
        req.setAttribute("coutResources", coutResources);

        List<Project> projects = projectDAO.getLastProjectsByLimit( admin.getAdminId(), 3);
        req.setAttribute("projects", projects);

        RequestDispatcher rd = req.getRequestDispatcher("/views/user/dashboard.jsp");
        rd.forward(req, res);
    }

}
