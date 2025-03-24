package com.ConstructionXpert.controller.task;

import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.dto.TaskDTO;
import com.ConstructionXpert.model.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@WebServlet("/tasks/update")
public class UpdateServlet extends HttpServlet {

    ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    Validator validator = factory.getValidator();

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
        int taskId = Integer.parseInt(req.getParameter("taskId"));
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        HttpSession session = req.getSession();

        // update the task
        LocalDate startDate = (req.getParameter("startDate") != null && !req.getParameter("startDate").isEmpty())
                ? LocalDate.parse(req.getParameter("startDate"))
                : null;
        LocalDate endDate = (req.getParameter("endDate") != null && !req.getParameter("endDate").isEmpty())
                ? LocalDate.parse(req.getParameter("endDate"))
                : null;

        TaskDTO taskDTO = new TaskDTO(
                req.getParameter("name"),
                req.getParameter("description"),
                startDate,
                endDate
        );

        String resourcesJson = req.getParameter("resources");
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String, Object>> resourcesList = objectMapper.readValue(resourcesJson, new TypeReference<List>() {});

        List<Integer> qtyErrors = new ArrayList<>();

        List<ConsumedResource> consumedResources = new ArrayList<>();

        for (Map<String, Object> src : resourcesList ) {

            if ( Integer.parseInt(src.get("quantity").toString()) > Integer.parseInt(src.get("currentQuantity").toString()) ) {
                qtyErrors.add(Integer.parseInt(src.get("quantity").toString()));
            }

            ConsumedResource consRs = new ConsumedResource();
            consRs.setQuantity(Integer.parseInt(src.get("quantity").toString()));
            consRs.setUnitPrice(Double.parseDouble(src.get("unitPrice").toString()));

            Resource  resource = new Resource();
            resource.setResourceId(Integer.parseInt(src.get("resourceId").toString()));
            consRs.setResource(resource);

            consumedResources.add( consRs );

        }

        Set<ConstraintViolation<TaskDTO>> violations = validator.validate(taskDTO);
        Map<String, String> errors = new HashMap<>();

        if (!violations.isEmpty() || !qtyErrors.isEmpty()) {
            for (ConstraintViolation<TaskDTO> violation : violations) {
                errors.put(violation.getPropertyPath().toString(), violation.getMessage());
            }

            session.setAttribute("errors", errors);
            session.setAttribute("old", taskDTO);
            session.setAttribute("oldResources", resourcesJson);
            res.sendRedirect(req.getContextPath() + "/tasks/update?projectId=" + projectId + "&taskId=" + taskId);
        } else {

            Task task = new Task();
            task.setTaskId( taskId );
            task.setName(taskDTO.getName());
            task.setDescription(taskDTO.getDescription());
            task.setStartDate(taskDTO.getStartDate());
            task.setEndDate(taskDTO.getEndDate());

            taskDAO.updateTaskById( task );

            consumedResourceDAO.deleteConsumedResroucesByTaskId(taskId);

            for ( ConsumedResource consumedResource : consumedResources ) {
                consumedResource.setTask( task );
                consumedResourceDAO.insertConsumedResource( consumedResource );
            }
            res.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId );

        }
    }

}
