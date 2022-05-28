package com.example.lib.InterfaceResponsitory;

import com.example.lib.model.Account;
import com.example.lib.model.Comment;
import com.example.lib.model.DanhMuc;
import com.example.lib.model.DonHang;
import com.example.lib.model.KhachHang;
import com.example.lib.model.Mon;
import com.example.lib.model.QuangCao;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface AppFoodMethods {
    @GET("getTenLoaiSP.php")
    Observable<DanhMuc> GET_DanhMuc();

    @GET("getSanPham.php")
    Observable<Mon> GET_MonNgauNhien();

    @POST("chitietdanhmuc.php")
    @FormUrlEncoded
    Observable<Mon> POST_MonTheoDanhMuc(
//            @Field("page") int page,
//            @Field("select") int select,
            @Field("madanhmuc") int madanhmuc
    );
    @POST("getchitietdonhang.php")
    @FormUrlEncoded
    Observable<DonHang> POST_GetDonHang
            (
//
            @Field("id_khachhang") int id_khachhang
    );
    @FormUrlEncoded
    @POST("DangNhap.php")
    Call<Account> dangnhap(
            @Field("email") String email,
            @Field("password") String password

    );
    @FormUrlEncoded
    @POST("Dangky.php")
    Call<Account> dangky(
            @Field("tennguoidung") String tennguoidung,
            @Field("email") String email,
            @Field("password") String password,
            @Field("phone") String phone,
            @Field("address") String address

    );
    @FormUrlEncoded
    @POST("CapNhatThongTinKhachHang.php")
    Call<Account> capnhatthongtin(
            @Field("id") int id,
            @Field("tennguoidung") String tennguoidung,
            @Field("email") String email,
            @Field("password") String password,
            @Field("phone") String phone,
            @Field("address") String address

    );
    @FormUrlEncoded
    @POST("LayThongTin.php")
    Call<KhachHang> laythongtin(
            @Field("id") int id
    );
    @POST("getbinhluansanpham.php")
    @FormUrlEncoded
    Observable<Comment> POST_GetBinhLuan
            (
                      @Field("id_sanpham") int id_sanpham
            );

    @POST("binhluansanpham.php")
    @FormUrlEncoded
    Observable<Comment> POST_BinhLuan
            (
                    @Field("id_sanpham") int id_sanpham,
                    @Field("id_khachhang") int id_khachhang,
                    @Field("noidung") String noidung
            );
    @GET("getquangcao.php")
    Observable<QuangCao> GetQuangCao();
}
