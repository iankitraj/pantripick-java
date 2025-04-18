package com.pantripick;

import java.sql.Timestamp;
import java.util.List;

public class Order {
    private int orderId;
    private String recipient;
    private String address;
    private String phone;
    private String email;
    private double totalCost;
    private int totalItems;
    private Timestamp timestamp;
    private List<OrderItem> items;

    // Constructor with all fields
    public Order(int orderId, String recipient, String address, String phone, String email, double totalCost, int totalItems, Timestamp timestamp) {
        this.orderId = orderId;
        this.recipient = recipient;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.totalCost = totalCost;
        this.totalItems = totalItems;
        this.timestamp = timestamp;
    }

    // Getters
    public int getOrderId() {
        return orderId;
    }

    public String getRecipient() {
        return recipient;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public int getTotalItems() {
        return totalItems;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    // Setter for items
    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}