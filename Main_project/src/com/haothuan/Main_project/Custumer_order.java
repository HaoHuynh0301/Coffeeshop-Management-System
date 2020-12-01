package com.haothuan.Main_project;

import java.io.Serializable;
import java.util.Date;

public class Custumer_order implements Serializable {
    String order_id;
    String customer_id;
    String customer_payment_method_id;
    String date_order_place;

    public Custumer_order(String order_id, String customer_id, String customer_payment_method_id, String date_order_place) {
        this.order_id = order_id;
        this.customer_id = customer_id;
        this.customer_payment_method_id = customer_payment_method_id;
        this.date_order_place = date_order_place;
    }

    public Custumer_order() {
        this.order_id="";
        this.customer_id="";
        this.customer_payment_method_id="";
        this.date_order_place="";
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_payment_method_id() {
        return customer_payment_method_id;
    }

    public void setCustomer_payment_method_id(String customer_payment_method_id) {
        this.customer_payment_method_id = customer_payment_method_id;
    }

    public String getDate_order_place() {
        return date_order_place;
    }

    public void setDate_order_place(String date_order_place) {
        this.date_order_place = date_order_place;
    }
}
