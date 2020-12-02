package com.haothuan.Main_project;

import java.util.Comparator;

public class ProductCompare_Reduce implements Comparator<Product> {
    @Override
    public int compare(Product a, Product b) {
        int price_a=a.getProduct_price();
        int price_b=b.getProduct_price();
        if(price_a<price_b) {
            return 1;
        }
        else if(price_a==price_b) {
            return 0;
        }
        else {
            return -1;
        }
    }
}
