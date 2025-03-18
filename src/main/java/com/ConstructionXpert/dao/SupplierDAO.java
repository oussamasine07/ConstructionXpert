package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Supplier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class SupplierDAO extends ConnectToDb {

    private static final String GET_SUPPLERS_BY_ADMIN_ID = "select * from suppliers\n" +
            "where admin_id = ?;";

    public SupplierDAO () {}

    public List<Supplier> getSuppliersByAdminId ( int adminId ) {
        List<Supplier> suppliers = new ArrayList<>();

        try (
                Connection con = getConnection();
                PreparedStatement stmt = con.prepareStatement(GET_SUPPLERS_BY_ADMIN_ID);
        ){

            stmt.setInt(1, adminId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Supplier sup = new Supplier();
                sup.setSupplierId(rs.getInt("id"));
                sup.setName(rs.getString("name"));
                sup.setEmail(rs.getString("email"));
                sup.setAddress(rs.getString("address"));
                sup.setPhone(rs.getString("phone"));

                suppliers.add(sup);
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }

}
