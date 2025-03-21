package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.ConsumedResource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConsumedResourceDAO extends ConnectToDb {

    public ConsumedResourceDAO () {}

    private static final String INSERT_CONSUMED_RESOURCE = "insert into consumed_resources\n" +
            "    (task_id, resource_id, quantity, unitPrice)\n" +
            "values\n" +
            "    (?, ?, ?, ?);";

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

}
