package com.ConstructionXpert.controller;

import com.ConstructionXpert.dao.ConnectToDb;
import com.ConstructionXpert.model.Admin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/")
public class IndexServlet extends HttpServlet {

    public void init () {}

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        Admin admin = new Admin("sine@gmail.com", "oussama", 1);

        HttpSession session = req.getSession();
        session.setAttribute("admin", admin);

        res.sendRedirect( req.getContextPath() + "/dashboard");
    }

}
