package com.ConstructionXpert.controller;

import com.ConstructionXpert.dao.ConnectToDb;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/")
public class IndexServlet extends HttpServlet {

    public void init () {}

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        ConnectToDb con = new ConnectToDb();

        con.getConnection();
        res.sendRedirect( req.getContextPath() + "/dashboard");
    }

}
