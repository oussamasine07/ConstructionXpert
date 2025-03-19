package com.ConstructionXpert.controller.task;


import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.dao.TaskDAO;
import com.ConstructionXpert.dto.TaskDTO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Project;
import com.ConstructionXpert.model.Task;
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
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/tasks/create")
public class CreateServlet extends HttpServlet {

    private ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private Validator validator = factory.getValidator();

    TaskDAO taskDAO = null;
    ProjectDAO projectDAO = null;

    public void init () {
        taskDAO = new TaskDAO();
        projectDAO = new ProjectDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {
        //int projectId = Integer.parseInt(req.getParameter("projectId"));

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

        Set<ConstraintViolation<TaskDTO>> violations = validator.validate(taskDTO);
        Map<String, String> errors = new HashMap<>();

        if (!violations.isEmpty()) {
            for (ConstraintViolation<TaskDTO> violation : violations) {
                errors.put(violation.getPropertyPath().toString(), violation.getMessage());
            }

            session.setAttribute("errors", errors);
            session.setAttribute("old", taskDTO);
            res.sendRedirect(req.getContextPath() + "/task/create");
        } else {

            Task task = new Task();
            Project project = projectDAO.getProjectById( projectId );
            task.setName(taskDTO.getName());
            task.setDescription(taskDTO.getDescription());
            task.setStartDate(taskDTO.getStartDate());
            task.setEndDate(taskDTO.getEndDate());
            task.setProject( project );

            taskDAO.insertTask( task );

            res.sendRedirect(req.getContextPath() + "/tasks?projectId=" + projectId );

        }
    }

}





























