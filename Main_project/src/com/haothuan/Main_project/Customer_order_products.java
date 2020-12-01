package com.haothuan.Main_project;

import java.io.Serializable;

public class Customer_order_products implements Serializable {
    String order_id;
    String product_id;
    int quantity;
    String comment;

    public Customer_order_products(String order_id, String product_id, int quantity, String comment) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.comment = comment;
    }

    public Customer_order_products() {
        this.order_id="";
        this.product_id="";
        this.quantity=0;
        this.comment="";
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
