package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.ConsumedResource;
import com.ConstructionXpert.model.Resource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ConsumedResourceDAO extends ConnectToDb {

    public ConsumedResourceDAO () {}

    private static final String INSERT_CONSUMED_RESOURCE = "insert into consumed_resources\n" +
            "    (task_id, resource_id, quantity, unitPrice)\n" +
            "values\n" +
            "    (?, ?, ?, ?);";

    private static final String SELECT_RESOURCE_BY_ID = "select * from resources\n" +
            "where id = ?;";

    private static final String GET_CONSUMED_RESOURCES_BY_ID = "select\n" +
            "    resources.id,\n" +
            "    resources.name,\n" +
            "    resources.quantity as resource_quantity,\n" +
            "    consumed_resources.quantity as consumed_quantity,\n" +
            "    consumed_resources.unitPrice,\n" +
            "    consumed_resources.totalPrice\n" +
            "from resources\n" +
            "inner join consumed_resources\n" +
            "on resources.id = consumed_resources.resource_id\n" +
            "inner join tasks\n" +
            "on tasks.id = consumed_resources.task_id\n" +
            "where consumed_resources.task_id = ?;";

    public void insertConsumedResource ( ConsumedResource consumedResource ) {
        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(INSERT_CONSUMED_RESOURCE);
        ){
            stmt.setInt(1, consumedResource.getTask().getTaskId());
            stmt.setInt(2, consumedResource.getResource().getResourceId());
            stmt.setInt(3, consumedResource.getQuantity());
            stmt.setDouble(4, consumedResource.getUnitPrice());

            System.out.println(stmt.toString());

            stmt.executeUpdate();

        }
        catch ( SQLException e ){
            e.printStackTrace();
        }
    }

    public boolean isValidQty ( int rsQty, int resourceId ) {
        boolean isGreater = false;
        try (
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement(SELECT_RESOURCE_BY_ID);
        ) {
            stmt.setInt(1, resourceId);
            ResultSet rs = stmt.executeQuery();

            int qty = rs.getInt("quantity");
            isGreater = rsQty > qty;
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return isGreater;
    }

    public List<ConsumedResource> getConsumedResourcesByTaskId ( int taskId ) {
        List<ConsumedResource> consumedResources = new ArrayList<>();
        try (
             Connection con = getConnection();
             PreparedStatement stmt = con.prepareStatement(GET_CONSUMED_RESOURCES_BY_ID);
        ){
            stmt.setInt( 1, taskId );
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("id"));
                resource.setName(rs.getString("name"));
                resource.setQuantity(rs.getInt("resource_quantity"));
                ConsumedResource consumedResource = new ConsumedResource();
                consumedResource.setResource(resource);
                consumedResource.setQuantity(rs.getInt("consumed_quantity"));
                consumedResource.setUnitPrice(rs.getDouble("unitPrice"));
                consumedResource.setTotalPrice(rs.getDouble("totalPrice"));

                consumedResources.add(consumedResource);
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return consumedResources;
    }

}












