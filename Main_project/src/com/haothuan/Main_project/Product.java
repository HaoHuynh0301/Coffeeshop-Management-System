package com.haothuan.Main_project;

import javax.swing.*;
import java.io.Serializable;

public class Product implements Serializable {
    String product_id;
    String product_type_code;
    int product_price;

    public Product(String product_id, String product_type_code, int product_price) {
        this.product_id = product_id;
        this.product_type_code = product_type_code;
        this.product_price = product_price;
    }

    public Product() {
        this.product_id="";
        this.product_type_code="";
        this.product_price=0;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_type_code() {
        return product_type_code;
    }

    public void setProduct_type_code(String product_type_code) {
        this.product_type_code = product_type_code;
    }

    public int getProduct_price() {
        return product_price;
    }

    public void setProduct_price(int product_price) {
        this.product_price = product_price;
    }
}
