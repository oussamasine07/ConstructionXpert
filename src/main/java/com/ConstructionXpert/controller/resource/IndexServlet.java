package com.ConstructionXpert.controller.resource;

import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/resource")
public class IndexServlet extends HttpServlet {

    ResourceDAO resourceDAO = null;
    public void init () {
        resourceDAO = new ResourceDAO();
    }

    public void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        // get the admin
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        System.out.println(admin);
        List<Resource> resources = resourceDAO.listResourcesById(admin.getAdminId());

        req.setAttribute("resources", resources);

        RequestDispatcher rd = req.getRequestDispatcher("/views/resource/index.jsp");
        rd.forward(req, res);
    }

}
