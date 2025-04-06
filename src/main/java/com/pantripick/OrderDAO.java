package com.pantripick;

import java.sql.*;
import java.util.*;

public class OrderDAO {
    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT o.id, o.recipient_name, o.total_cost, " +
                         "(SELECT SUM(quantity) FROM order_items WHERE order_id = o.id) AS total_items " +
                         "FROM orders o";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String recipient = rs.getString("recipient_name");
                double totalCost = rs.getDouble("total_cost");
                int totalItems = rs.getInt("total_items");
                orders.add(new Order(id, recipient, totalCost, totalItems));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}
