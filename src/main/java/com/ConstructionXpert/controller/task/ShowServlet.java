package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.model.ConsumedResource;
import com.ConstructionXpert.model.Task;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/tasks/show")
public class ShowServlet extends HttpServlet {

    TaskDAO taskDAO = null;
    ConsumedResourceDAO consumedResourceDAO = null;

    public void init () {
        taskDAO = new TaskDAO();
        consumedResourceDAO = new ConsumedResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        int projectId = Integer.parseInt(req.getParameter("projectId"));
        int taskId = Integer.parseInt(req.getParameter("taskId"));

        Task task = taskDAO.getTaskById(taskId);
        req.setAttribute("task", task);

        List<ConsumedResource> consumedResources = consumedResourceDAO.getConsumedResourcesByTaskId( taskId );
        req.setAttribute("consumedResources", consumedResources);

        double cumulativeTotal = consumedResources.stream()
                                .mapToDouble(ConsumedResource::getTotalPrice)
                                .sum();

        req.setAttribute("cumulativeTotal", cumulativeTotal);

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/show.jsp");
        rd.forward(req, res);

    }

}
