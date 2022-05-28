package com.example.lib.model;

import com.google.gson.annotations.SerializedName;

public class Account {
    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
    @SerializedName("id")
    public int id;
    @SerializedName("email")
    public String email;
    @SerializedName("password")
    public String password;
    @SerializedName("level")
    public int level;
    @SerializedName("value")
    public String value;
@SerializedName("result")
public String result;

}
