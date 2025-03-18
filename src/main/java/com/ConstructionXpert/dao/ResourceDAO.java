package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Resource;
import com.ConstructionXpert.model.Supplier;

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

    private static final String GET_RESOURCE_BY_ID = "select\n" +
            "    resources.id as resource_id,\n" +
            "    resources.name as resource_name,\n" +
            "    resources.quantity,\n" +
            "    resources.unitPrice,\n" +
            "    resources.totalPrice,\n" +
            "    suppliers.id as supplier_id,\n" +
            "    suppliers.name as supplier_name\n" +
            "from resources\n" +
            "inner join suppliers\n" +
            "on suppliers.id = resources.supplier_id\n" +
            "where resources.id = ?;";

    private static final String UPDATE_RESOURCE = "update resources\n" +
            "    set\n" +
            "        admin_id = ?, \n" +
            "        supplier_id = ?, \n" +
            "        name = ?, \n" +
            "        quantity = ?, \n" +
            "        unitPrice = ?\n" +
            "where id = ?;";

    private static final String DELETE_RESOURCE_BY_ID = "delete from resources\n" +
            "where id = ?;";

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

    public Resource getResourceById ( int resourceId ) {
        Resource res = new Resource();

        try (
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement(GET_RESOURCE_BY_ID)
        ){
            stmt.setInt(1, resourceId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Supplier sup = new Supplier();
                sup.setSupplierId(rs.getInt("supplier_id"));
                sup.setName(rs.getString("supplier_name"));

                res.setResourceId(rs.getInt("resource_id"));
                res.setName(rs.getString("resource_name"));
                res.setQuantity(rs.getInt("quantity"));
                res.setUnitPrice(rs.getDouble("unitPrice"));
                res.setTotalPrice(rs.getDouble("totalPrice"));
                res.setSupplier(sup);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
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

    public void updateResource (Resource resource ) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(UPDATE_RESOURCE);
        ){

            stmt.setInt(1, resource.getAdmin().getAdminId());
            stmt.setInt(2, resource.getSupplier().getSupplierId());
            stmt.setString(3, resource.getName());
            stmt.setInt(4, resource.getQuantity());
            stmt.setDouble(5, resource.getUnitPrice());
            stmt.setInt(6, resource.getResourceId());

            System.out.println(stmt.toString());

            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteResourceBytId ( int resourceId ) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(DELETE_RESOURCE_BY_ID);
        ){

            stmt.setInt(1, resourceId);
            stmt.executeUpdate();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
