package com.ConstructionXpert.controller.task;


import com.ConstructionXpert.dao.ConsumedResourceDAO;
import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.dto.TaskDTO;
import com.ConstructionXpert.model.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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

@WebServlet("/tasks/create")
public class CreateServlet extends HttpServlet {

    private ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private Validator validator = factory.getValidator();

    TaskDAO taskDAO = null;
    ProjectDAO projectDAO = null;
    ResourceDAO resourceDAO = null;
    ConsumedResourceDAO consumedResourceDAO = null;

    public void init () {
        taskDAO = new TaskDAO();
        projectDAO = new ProjectDAO();
        resourceDAO = new ResourceDAO();
        consumedResourceDAO = new ConsumedResourceDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        Admin admin = (Admin) req.getSession().getAttribute("admin");

        List<Resource> resources = resourceDAO.listResourcesById(admin.getAdminId());
        req.setAttribute("resources", resources);


        RequestDispatcher rd = req.getRequestDispatcher("/views/task/create.jsp");
        rd.forward(req, res);
    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");

        int projectId = Integer.parseInt(req.getParameter("projectId"));

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
                qtyErrors.add(Integer.parseInt(src.get("id").toString()));
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
            session.setAttribute("qtyErrors", qtyErrors);
            res.sendRedirect(req.getContextPath() + "/tasks/create?projectId=" + projectId);
        } else {

            Task task = new Task();
            Project project = projectDAO.getProjectById( projectId );
            task.setName(taskDTO.getName());
            task.setDescription(taskDTO.getDescription());
            task.setStartDate(taskDTO.getStartDate());
            task.setEndDate(taskDTO.getEndDate());
            task.setProject( project );

            Task insertedTask = taskDAO.insertTask( task );

            for ( ConsumedResource consumedResource : consumedResources ) {

                consumedResource.setTask( insertedTask );
                consumedResourceDAO.insertConsumedResource( consumedResource );

            }
            res.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId );

        }
    }

}





























