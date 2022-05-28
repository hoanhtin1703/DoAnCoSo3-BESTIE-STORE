package com.example.lib.model;

import java.io.Serializable;
import java.util.List;

public class Mon implements Serializable {
    public class Result implements Serializable {
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getMadanhmuc() {
            return madanhmuc;
        }

        public void setMadanhmuc(int madanhmuc) {
            this.madanhmuc = madanhmuc;
        }

        public String getTensanpham() {
            return tensanpham;
        }

        public void setTensanpham(String tensanpham) {
            this.tensanpham = tensanpham;
        }

        public String getMotasanpham() {
            return motasanpham;
        }

        public void setMotasanpham(String motasanpham) {
            this.motasanpham = motasanpham;
        }

        public String getHinhanhsanpham() {
            return hinhanhsanpham;
        }

        public void setHinhanhsanpham(String hinhanhsanpham) {
            this.hinhanhsanpham = hinhanhsanpham;
        }

        public String getSoluong() {
            return soluong;
        }

        public void setSoluong(String soluong) {
            this.soluong = soluong;
        }

        public String getGiasanpham() {
            return giasanpham;
        }

        public void setGiasanpham(String giasanpham) {
            this.giasanpham = giasanpham;
        }

        private int id;
        private int madanhmuc;
        private String tensanpham;
        private String motasanpham;
        private String hinhanhsanpham;
        private String soluong;
        private String giasanpham;


    }
    boolean success;
    String message;
    List<Mon.Result> result;

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
