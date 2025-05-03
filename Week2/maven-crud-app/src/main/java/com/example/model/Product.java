package com.example.model;

public class Product{
    private int product_id;
    private String product_name;
    private String category;
    private int stock_level;
    private double price;

    public Product(int product_id, String product_name, String category, int stock_level, double price) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.category = category;
        this.stock_level = stock_level;
        this.price = price;
    }

    public int getProductId() {
        return product_id;
    }

    public String getProductName() {
        return product_name;
    }

    public String getCategory() {
        return category;
    }

    public int getStockLevel() {
        return stock_level;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "product_id=" + product_id +
                ", product_name='" + product_name + '\'' +
                ", category='" + category + '\'' +
                ", stock_level=" + stock_level +
                ", price=" + price +
                '}';
    }

}