package com.haothuan.Main_project;

import javax.swing.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Functions  implements Serializable{
    public Functions() {

    }

    public ArrayList<Product> Sort(int choose, ArrayList<Product> arr_data, String CUSTOMER_ID, Connection conn, DefaultListModel model, DefaultListModel model_temp){
        if(choose==0) {
           Collections.sort(arr_data, new ProductCompare());
        }
        else if(choose==1) {
            Collections.sort(arr_data, new ProductCompare_Reduce());
        }
        else if(choose==2) {
            PreparedStatement stmt=null;
            var mysql="SELECT * FROM Customer WHERE customer_id=?";
            try {
                stmt=conn.prepareStatement(mysql);
                stmt.setString(1, CUSTOMER_ID);
                ResultSet rs=stmt.executeQuery();
                if(rs.next()) {
                  var temp_product_id=rs.getString("favorite_product_id");
                    var mysql_2="SELECT * FROM product WHERE product_id=?";
                  PreparedStatement stmt_2=conn.prepareStatement(mysql_2);
                  stmt_2.setString(1, temp_product_id);
                  ResultSet rs_2=stmt_2.executeQuery();
                  if(rs_2.next()) {
                      Product p=new Product();
                      p.setProduct_id(rs_2.getString("product_id"));
                      p.setProduct_type_code(rs_2.getString("product_type_code"));
                      p.setProduct_price(rs_2.getInt("product_price"));
                      arr_data=new ArrayList<>();
                      arr_data.add(p);
                  }
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
        return arr_data;
    }
}
