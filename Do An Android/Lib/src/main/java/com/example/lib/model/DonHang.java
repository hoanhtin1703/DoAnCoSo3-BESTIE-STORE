package com.example.lib.model;

import java.io.Serializable;
import java.util.List;

public class DonHang implements Serializable {
    public class Result implements Serializable{
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getIddonhang() {
            return iddonhang;
        }

        public void setIddonhang(int iddonhang) {
            this.iddonhang = iddonhang;
        }

        public String getMadonhang() {
            return madonhang;
        }

        public void setMadonhang(String madonhang) {
            this.madonhang = madonhang;
        }

        public String getTensanpham() {
            return tensanpham;
        }

        public void setTensanpham(String tensanpham) {
            this.tensanpham = tensanpham;
        }

        public String getGiasanpham() {
            return giasanpham;
        }

        public void setGiasanpham(String giasanpham) {
            this.giasanpham = giasanpham;
        }

        public int getSoluongsanpham() {
            return soluongsanpham;
        }

        public void setSoluongsanpham(int soluongsanpham) {
            this.soluongsanpham = soluongsanpham;
        }

        public int getTrangthai() {
            return trangthai;
        }

        public void setTrangthai(int trangthai) {
            this.trangthai = trangthai;
        }

        public String getHinhanhsanpham() {
            return hinhanhsanpham;
        }

        public void setHinhanhsanpham(String hinhanhsanpham) {
            this.hinhanhsanpham = hinhanhsanpham;
        }

        int id;
        int iddonhang;
        String madonhang;
        String tensanpham;
        String giasanpham;
        int soluongsanpham;
        int trangthai;
        String hinhanhsanpham;

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
    List<DonHang.Result> result;
}
