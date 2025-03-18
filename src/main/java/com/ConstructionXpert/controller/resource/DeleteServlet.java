package com.ConstructionXpert.controller.resource;

import com.ConstructionXpert.dao.ResourceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/resource/delete")
public class DeleteServlet extends HttpServlet {

    ResourceDAO resourceDAO = null;
    public void init () {
        resourceDAO = new ResourceDAO();
    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        int resourceId = Integer.parseInt(req.getParameter("id"));

        resourceDAO.deleteResourceBytId(resourceId);

        res.sendRedirect(req.getContextPath() + "/resource");
    }

}
















