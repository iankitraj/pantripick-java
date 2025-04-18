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
            String sql = "SELECT os.order_id, os.recipient_name, os.address, os.phone, os.email, o.total_cost, o.timestamp, " +
                         "(SELECT SUM(quantity) FROM order_items WHERE order_id = o.id) AS total_items " +
                         "FROM order_summary os JOIN orders o ON os.order_id = o.id ORDER BY o.timestamp DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("order_id");
                String recipient = rs.getString("recipient_name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                double totalCost = rs.getDouble("total_cost");
                int totalItems = rs.getInt("total_items");
                Timestamp timestamp = rs.getTimestamp("timestamp");

                Order order = new Order(id, recipient, address, phone, email, totalCost, totalItems, timestamp);
                order.setItems(getOrderItems(id));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    private List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        try {
            String itemSql = "SELECT p.name, oi.quantity, oi.price FROM order_items oi JOIN products p ON oi.product_id = p.id WHERE oi.order_id = ?";
            PreparedStatement ps = conn.prepareStatement(itemSql);
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                items.add(new OrderItem(
                        rs.getString("name"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }
}
