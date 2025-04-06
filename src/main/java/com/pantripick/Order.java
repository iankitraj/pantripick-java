package com.pantripick;

public class Order {
    private int orderId;
    private String recipient;
    private double totalCost;
    private int totalItems;

    // Constructor
    public Order(int orderId, String recipient, double totalCost, int totalItems) {
        this.orderId = orderId;
        this.recipient = recipient;
        this.totalCost = totalCost;
        this.totalItems = totalItems;
    }

    // Getters
    public int getOrderId() {
        return orderId;
    }

    public String getRecipient() {
        return recipient;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public int getTotalItems() {
        return totalItems;
    }
}
