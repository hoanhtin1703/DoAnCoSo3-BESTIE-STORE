package com.example.lib.model;

import java.io.Serializable;
import java.util.List;

public class Comment implements Serializable {
        public class Result implements  Serializable{
            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public int getId_khachang() {
                return id_khachang;
            }

            public void setId_khachang(int id_khachang) {
                this.id_khachang = id_khachang;
            }

            public int getId_sanpham() {
                return id_sanpham;
            }

            public void setId_sanpham(int id_sanpham) {
                this.id_sanpham = id_sanpham;
            }

            public String getNoidung() {
                return noidung;
            }

            public void setNoidung(String noidung) {
                this.noidung = noidung;
            }

            int id;
            int id_khachang;
            int id_sanpham;
            String noidung;

            public String getTenkhachang() {
                return tenkhachang;
            }

            public void setTenkhachang(String tenkhachang) {
                this.tenkhachang = tenkhachang;
            }

            String tenkhachang;

        }


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

    boolean success;
    String message;
    List<Comment.Result> result;


}
