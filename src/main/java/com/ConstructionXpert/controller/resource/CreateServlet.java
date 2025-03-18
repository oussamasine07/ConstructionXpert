package com.ConstructionXpert.controller.resource;

import com.ConstructionXpert.dao.ResourceDAO;
import com.ConstructionXpert.dao.SupplierDAO;
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

import java.io.IOException;
import java.util.List;

@WebServlet("/resource/create")
public class CreateServlet extends HttpServlet {

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

        Supplier supplier = new Supplier();
        supplier.setSupplierId(Integer.parseInt(req.getParameter("supplier")));

        Resource resource = new Resource();

        resource.setAdmin(admin);
        resource.setSupplier(supplier);

        resource.setName(req.getParameter("name"));
        resource.setQuantity(Integer.parseInt(req.getParameter("quantity")));
        resource.setUnitPrice(Double.parseDouble(req.getParameter("unitPrice")));

        resourceDAO.insertResource( resource );

        res.sendRedirect(req.getContextPath() + "/resource");




    }

}


















