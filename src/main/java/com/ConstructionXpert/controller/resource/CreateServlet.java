package com.ConstructionXpert.controller.resource;

import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.model.Admin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/resource/create")
public class CreateServlet extends HttpServlet {

    ResourceDAO resourceDAO = null;
    public void init() {
        resourceDAO = new ResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        RequestDispatcher rd = req.getRequestDispatcher("/views/resource/create.jsp");
        rd.forward(req, res);

    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        /*
        * supplier informations (name, email, phone, address)
        * resource informations (name, quantity, unit price)
        * */

        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");

        String supplierName = req.getParameter("supplierName");
        String supplierEmail = req.getParameter("supplierEmail");
        String supplierPhone = req.getParameter("supplierPhone");
        String supplierAddress = req.getParameter("supplierAddress");

        String productName = req.getParameter("productName");
        int productQuantity = Integer.parseInt(req.getParameter("productQuantity"));
        double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));




    }

}


















