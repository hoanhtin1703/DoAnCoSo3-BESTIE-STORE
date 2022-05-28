package com.example.lib.model;

import java.io.Serializable;
import java.util.List;

public class DanhMuc implements Serializable  {
    public class Result implements Serializable
    {
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getTenloaisanpham() {
            return tenloaisanpham;
        }

        public void setTenloaisanpham(String tenloaisanpham) {
            this.tenloaisanpham = tenloaisanpham;
        }

        public String getHinhanh() {
            return hinhanh;
        }

        public void setHinhanh(String hinhanh) {
            this.hinhanh = hinhanh;
        }

        private int id;
        private String tenloaisanpham;
        private String hinhanh;


    }
    boolean success;
    String message;
    List<Result> result;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Result> getResult() {
        return result;
    }

    public void setResult(List<Result> result) {
        this.result = result;
    }
}

