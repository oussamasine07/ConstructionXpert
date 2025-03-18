package com.ConstructionXpert.controller.project;

import com.ConstructionXpert.model.Admin;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/project/create")
public class CreateServlet extends HttpServlet {
    public void init () {

    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {

        RequestDispatcher rd = req.getRequestDispatcher("/views/project/create.jsp");
        rd.forward(req, res);

    }

    protected void doPost (HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {

    }
}
