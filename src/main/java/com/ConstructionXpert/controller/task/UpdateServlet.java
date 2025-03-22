package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.ConsumedResource;
import com.ConstructionXpert.model.Resource;
import com.ConstructionXpert.model.Task;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/tasks/update")
public class UpdateServlet extends HttpServlet {

    TaskDAO taskDAO = null;
    ConsumedResourceDAO consumedResourceDAO = null;
    ResourceDAO resourceDAO = null;

    public void init () {
        taskDAO = new TaskDAO();
        consumedResourceDAO = new ConsumedResourceDAO();
        resourceDAO = new ResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        Admin admin = (Admin) req.getSession().getAttribute("admin");

        int projectId = Integer.parseInt(req.getParameter("projectId"));
        int taskId = Integer.parseInt(req.getParameter("taskId"));

        Task task = taskDAO.getTaskById(taskId);
        req.setAttribute("task", task);

        List<ConsumedResource> consumedResources = consumedResourceDAO.getConsumedResourcesByTaskId( taskId );
        List<Map<String, Object>> mapedresources = new ArrayList<>();

        for (int i = 0; consumedResources.size() > i; i ++) {
            Map<String, Object> mapResource = new HashMap<>();
            mapResource.put("id", i + 1);
            mapResource.put("resourceId", consumedResources.get(i).getResource().getResourceId());
            mapResource.put("resourceName", consumedResources.get(i).getResource().getName());
            mapResource.put("currentQuantity", consumedResources.get(i).getResource().getQuantity());
            mapResource.put("quantity", consumedResources.get(i).getQuantity());
            mapResource.put("unitPrice", consumedResources.get(i).getUnitPrice());
            mapedresources.add(mapResource);
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String jsonMapedResources = objectMapper.writeValueAsString(mapedresources);
        req.setAttribute("jsonMapedResources", jsonMapedResources);

        List<Resource> resources = resourceDAO.listResourcesById(admin.getAdminId());
        req.setAttribute("resources", resources);

        RequestDispatcher rd = req.getRequestDispatcher("/views/task/edit.jsp");
        rd.forward(req, res);
    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {

    }

}
