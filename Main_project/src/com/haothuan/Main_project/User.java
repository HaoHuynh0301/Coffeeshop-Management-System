package com.haothuan.Main_project;

import java.io.Serializable;
import java.io.SerializablePermission;

public class User implements Serializable {
    String id;
    String email;
    String password;

    public User(String id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    public User() {
        this.id="";
        this.email="";
        this.password="";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
