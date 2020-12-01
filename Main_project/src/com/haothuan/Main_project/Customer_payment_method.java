package com.haothuan.Main_project;

import java.io.Serializable;

public class Customer_payment_method implements Serializable {
    String customer_payment_method_id;
    String payment_method_name;

    public Customer_payment_method(String customer_payment_method_id, String payment_method_name) {
        this.customer_payment_method_id = customer_payment_method_id;
        this.payment_method_name = payment_method_name;
    }

    public Customer_payment_method() {
        this.customer_payment_method_id="";
        this.payment_method_name="";
    }

    public String getCustomer_payment_method_id() {
        return customer_payment_method_id;
    }

    public void setCustomer_payment_method_id(String customer_payment_method_id) {
        this.customer_payment_method_id = customer_payment_method_id;
    }

    public String getPayment_method_name() {
        return payment_method_name;
    }

    public void setPayment_method_name(String payment_method_name) {
        this.payment_method_name = payment_method_name;
    }
}
