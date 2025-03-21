package com.ConstructionXpert.controller.task;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/tasks/show")
public class ShowServlet extends HttpServlet {

    public void init () {

    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        //int projectId

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/show.jsp");
        rd.forward(req, res);

    }

}
