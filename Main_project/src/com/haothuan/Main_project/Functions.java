package com.haothuan.Main_project;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Functions  implements Serializable{
    public Functions() {

    }

    public ArrayList<Product> Sort(int choose, ArrayList<Product> arr_data) {
        if(choose==0) {
           Collections.sort(arr_data, new ProductCompare());
        }
        else if(choose==1) {
            Collections.sort(arr_data, new ProductCompare_Reduce());
        }
        return arr_data;
    }
}
