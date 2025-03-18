package com.ConstructionXpert.controller.project;

import com.ConstructionXpert.dao.ProjectDAO;
import com.ConstructionXpert.dto.ProjectDTO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Project;
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

@WebServlet("/project/create")
public class CreateServlet extends HttpServlet {

    private ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private Validator validator = factory.getValidator();

    ProjectDAO projectDAO = null;
    public void init () {
        projectDAO = new ProjectDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {

        RequestDispatcher rd = req.getRequestDispatcher("/views/project/create.jsp");
        rd.forward(req, res);

    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {

        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");

//        String name = req.getParameter("name");
//        String description = req.getParameter("description");
//        String startDate = req.getParameter("startDate");
//        String endDate = req.getParameter("endDate");
//        double budget = Double.parseDouble(req.getParameter("budget"));

        double budget = (req.getParameter("budget") != null && !req.getParameter("budget").isEmpty())
                        ? Double.parseDouble(req.getParameter("budget"))
                        : 0;
        LocalDate startDate = (req.getParameter("startDate") != null && !req.getParameter("startDate").isEmpty())
                            ? LocalDate.parse(req.getParameter("startDate"))
                            : null;
        LocalDate endDate = (req.getParameter("endDate") != null && !req.getParameter("endDate").isEmpty())
                ? LocalDate.parse(req.getParameter("endDate"))
                : null;

        ProjectDTO projectDTO = new ProjectDTO(
                req.getParameter("name"),
                req.getParameter("description"),
                //req.getParameter("startDate"),
                startDate,
                endDate,
                //req.getParameter("endDate"),
                budget
        );

        Set<ConstraintViolation<ProjectDTO>> violations = validator.validate(projectDTO);
        Map<String, String> errors = new HashMap<>();

        if (!violations.isEmpty()) {
            for (ConstraintViolation<ProjectDTO> violation : violations) {
                errors.put(violation.getPropertyPath().toString(), violation.getMessage());
            }

            session.setAttribute("errors", errors);
            session.setAttribute("old", projectDTO);
            res.sendRedirect(req.getContextPath() + "/project/create");
        } else {

            Project project = new Project();
            project.setName(projectDTO.getName());
            project.setDescription(projectDTO.getDescription());
            project.setStartDate(projectDTO.getStartDate());
            project.setEndDate(projectDTO.getEndDate());
            project.setBudget(projectDTO.getBudget());
            project.setAdmin(admin);

            projectDAO.insertProject( project );

            res.sendRedirect(req.getContextPath() + "/project");

        }
    }
}



























