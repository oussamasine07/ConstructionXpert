package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAO extends ConnectToDb {

    private static final String INSERT_RESOURCE = "INSERT INTO resources\n" +
            "    (admin_id, supplier_id, name, quantity, unitPrice)\n" +
            "VALUES\n" +
            "    (?, ?, ?, ?, ?);";

    public ResourceDAO () {}

    public List<Resource> listResources (int adminId) {
        List<Resource> resources = new ArrayList<>();

        return resources;
    }

    public void insertResource ( Resource resource ) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(INSERT_RESOURCE);
        ){

            stmt.setInt(1, resource.getAdmin().getAdminId());
            stmt.setInt(2, resource.getSupplier().getSupplierId());
            stmt.setString(3, resource.getName());
            stmt.setInt(4, resource.getQuantity());
            stmt.setDouble(5, resource.getUnitPrice());
            System.out.println(stmt.toString());
            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
