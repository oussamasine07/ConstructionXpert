package com.ConstructionXpert.controller.resource;

import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.dao.SupplierDAO;
import com.ConstructionXpert.dto.ResourceDTO;
import com.ConstructionXpert.model.Admin;
import com.ConstructionXpert.model.Resource;
import com.ConstructionXpert.model.Supplier;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet("/resource/create")
public class CreateServlet extends HttpServlet {

    private final ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
    private final Validator validator = factory.getValidator();

    ResourceDAO resourceDAO = null;
    SupplierDAO supplierDAO = null;


    public void init() {
        supplierDAO = new SupplierDAO();
        resourceDAO = new ResourceDAO();
    }

    protected void doGet (HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
    {

        HttpSession session = req.getSession();

        Admin admin = (Admin) session.getAttribute("admin");

        List<Supplier> suppliers = supplierDAO.getSuppliersByAdminId(admin.getAdminId());

        req.setAttribute("suppliers", suppliers);
        RequestDispatcher rd = req.getRequestDispatcher("/views/resource/create.jsp");
        rd.forward(req, res);

    }

    protected void doPost (HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
//        System.out.println(req.getParameter("quantity").getClass().getName());
//        res.sendRedirect(req.getContextPath() + "/resource");

        Integer quantity = (req.getParameter("quantity") != null && !req.getParameter("quantity").isEmpty())
                ? Integer.parseInt(req.getParameter("quantity"))
                : 0;

        Double unitPrice = (req.getParameter("unitPrice") != null && !req.getParameter("unitPrice").isEmpty())
                ? Double.parseDouble(req.getParameter("unitPrice"))
                : 0;

        ResourceDTO resourceDTO = new ResourceDTO(
                req.getParameter("name"),
                quantity,
                unitPrice
        );

        Set<ConstraintViolation<ResourceDTO>> violations = validator.validate(resourceDTO);
        Map<String, String> errors = new HashMap<>();

        if (!violations.isEmpty()) {
            for (ConstraintViolation<ResourceDTO> violation : violations) {
                errors.put(violation.getPropertyPath().toString(), violation.getMessage());
            }

            session.setAttribute("errors", errors);
            session.setAttribute("old", resourceDTO);

            res.sendRedirect(req.getContextPath() + "/resource/create");

        } else {
            Supplier supplier = new Supplier();
            supplier.setSupplierId(Integer.parseInt(req.getParameter("supplier")));

            Resource resource = new Resource();

            resource.setAdmin(admin);
            resource.setSupplier(supplier);

            resource.setName(resourceDTO.getName());
            resource.setQuantity(resourceDTO.getQuantity());
            resource.setUnitPrice(resourceDTO.getUnitPrice());

            resourceDAO.insertResource( resource );

            res.sendRedirect(req.getContextPath() + "/resource");

        }
    }

}


















