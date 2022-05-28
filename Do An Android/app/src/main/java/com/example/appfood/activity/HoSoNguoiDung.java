package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.example.appfood.R;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Account;
import com.example.lib.model.KhachHang;

import retrofit2.Call;
import retrofit2.Callback;

public class HoSoNguoiDung extends AppCompatActivity {
    Toolbar toolbarThanhToan;
    public  EditText user_name;
    public EditText user_email;
    public EditText user_password;
    public EditText user_phone;
    public EditText user_address;
    public  String muser_name,muser_email,muser_password,muser_phone,muser_address;
    int id=0;
    Button btn_chinhsua,btn_luu;
    AppFoodMethods appFoodMethods;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ho_so_nguoi_dung);
        getViewId();
        actionToolbar();
        if(NetworkConnection.isConnected(this)) {
            Getinfomation();
//            Readmode();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }
        private void Getinfomation(){
            appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);

            Call<KhachHang> call = appFoodMethods.laythongtin(MainActivity.idkhachang);
            call.enqueue(new Callback<KhachHang>() {
                @Override
                public void onResponse(Call<KhachHang> call, retrofit2.Response<KhachHang> response) {

                    id = response.body().getId();
                    String tenkhachang = response.body().getTenkhachang();
                    String sodienthoai = response.body().getSodienthoai();
                    String email = response.body().getEmail();
                    String diachi = response.body().getDiachi();
                    String password = response.body().getPassword();
                    user_name.setText(tenkhachang);
                    user_email.setText(email);
                    user_phone.setText(sodienthoai);
                    user_address.setText(diachi);
                    user_password.setText(password);
                }

                @Override
                public void onFailure(Call<KhachHang> call, Throwable t) {

                }
            });
        }
        private void getViewId() {
            toolbarThanhToan = findViewById(R.id.toolbarThanhToan);
            btn_chinhsua = findViewById(R.id.btn_chinhsua);
            btn_luu = findViewById(R.id.btn_luuthongtin);
            user_name = findViewById(R.id.user_name);
            user_email = findViewById(R.id.user_email);
            user_phone = findViewById(R.id.user_phone);
            user_address= findViewById(R.id.user_address);
            user_password = findViewById(R.id.edt_password);
            user_address= findViewById(R.id.user_address);
            btn_chinhsua.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Editmode();
                }
            });
            btn_luu.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    muser_name = user_name.getText().toString().trim();
                    muser_email = user_email.getText().toString().trim();
                    muser_address = user_address.getText().toString().trim();
                    muser_password = user_password.getText().toString().trim();
                    muser_phone = user_phone.getText().toString().trim();
                    Capnhatthongtin(MainActivity.idkhachang,muser_name,muser_email,muser_password,muser_phone,muser_address);
                }
            });
        }

    private void Capnhatthongtin(final int id,final String user_name,final String email,final String password,final String phone,final String address) {
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        Call<Account> call = appFoodMethods.capnhatthongtin(id,user_name,email,password,phone,address);
        call.enqueue(new Callback<Account>() {
            @Override
            public void onResponse(Call<Account> call, retrofit2.Response<Account> response) {
                String value = response.body().getValue();
                if (value.equals("1")){
                    Show.Notify(getApplicationContext(),"Cập Nhật Thông Tin Thành Công");
                    Getinfomation();
                    Readmode();
                }
            }

            @Override
            public void onFailure(Call<Account> call, Throwable t) {
            }
        });
    }

    private void actionToolbar() {
            setSupportActionBar(toolbarThanhToan);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            toolbarThanhToan.setNavigationOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    finish();
                }
            });
        }
        public void Editmode(){
            btn_chinhsua.setVisibility(View.GONE);
            btn_luu.setVisibility(View.VISIBLE);
            user_name.setFocusable(true);
            user_email.setFocusable(true);
            user_phone.setFocusable(true);
            user_address.setFocusable(true);
            user_password.setFocusable(true);

        }
    public void Readmode(){
        btn_chinhsua.setVisibility(View.VISIBLE);
        btn_luu.setVisibility(View.GONE);
        user_name.setFocusable(false);
        user_email.setFocusable(false);
        user_phone.setFocusable(false);
        user_address.setFocusable(false);
        user_password.setFocusable(false);

    }
        public void ToHome(View view) {
            Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
            startActivity(trangchu);
        }

        @Override
        protected void onResume() {
            super.onResume();
//            Getinfomation();
        }

        @Override
        protected void onStart() {
            super.onStart();
          Getinfomation();
        }

}