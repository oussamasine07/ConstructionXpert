package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAO extends ConnectToDb {

    private static final String INSERT_RESOURCE = "INSERT INTO resources\n" +
            "    (admin_id, supplier_id, name, quantity, unitPrice)\n" +
            "VALUES\n" +
            "    (?, ?, ?, ?, ?);";
    private static  final String LIST_RESOURCES_BY_ADMIN_ID = "select * from resources \n" +
            "where admin_id = ?;";

    public ResourceDAO () {}

    public List<Resource> listResourcesById (int adminId) {
        List<Resource> resources = new ArrayList<>();

        try (
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement(LIST_RESOURCES_BY_ADMIN_ID)
        ){
            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Resource res = new Resource();
                res.setResourceId(rs.getInt("id"));
                res.setName(rs.getString("name"));
                res.setQuantity(rs.getInt("quantity"));
                res.setUnitPrice(rs.getDouble("unitPrice"));
                res.setTotalPrice(rs.getDouble("totalPrice"));

                resources.add(res);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
        }

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
