package com.example.appfood.activity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.appfood.R;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.common.Validate;
import com.example.lib.model.Account;

import retrofit2.Call;
import retrofit2.Callback;

public class LoginActivity extends AppCompatActivity {

    AppFoodMethods appFoodMethods;
    private EditText user_name,password;

    private String muser_name,mpassword;
    private TextView tvEmail;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        // Khởi tạo các View'
        tvEmail = findViewById(R.id.tvEmail);
        user_name = findViewById(R.id.edt_user_name);
        password = findViewById(R.id.edt_password);
        TextView click_to_register = findViewById(R.id.click_to_register);
        click_to_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(LoginActivity.this,RegisterActivity.class);
                startActivity(intent);
            }
        });
        Button btn_login = findViewById(R.id.btn_login);
        btn_login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                muser_name = user_name.getText().toString().trim();
                mpassword = password.getText().toString().trim();

                if(Validate.isValidEmail(muser_name,tvEmail) && mpassword!=null){
                    login(muser_name,mpassword);
                }
                else {
                    Show.Notify(getApplicationContext(),"Lỗi Đăng Nhập");
                }

            }
            public  void login(final String email,String password){
                final ProgressDialog progressDialog = new ProgressDialog(LoginActivity.this);
                progressDialog.setMessage("Đang Đăng Nhập...");
                progressDialog.show();
                appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
                Call<Account> call = appFoodMethods.dangnhap(email,password);
                call.enqueue(new Callback<Account>() {
                    @Override
                    public void onResponse(Call<Account> call, retrofit2.Response<Account> response) {
                        String value = response.body().getValue();
                        int id = response.body().getId();
//                        int id_khachhang = response.body().getId();
                        int level = response.body().getLevel();
                        if(value.equals("0")){
                            progressDialog.dismiss();
                            Show.Notify(getApplicationContext(),"loi");
                        }else {
                            if (level == 0) {
                                new Handler().postDelayed(new Runnable() {
                                    @Override
                                    public void run() {
                                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                                        startActivity(i);
                                    }
                                }, 2000);
                            } else {
                                new Handler().postDelayed(new Runnable() {
                                    @Override
                                    public void run() {
                                        Intent i = new Intent(getApplicationContext(), MainActivity.class);
                                        i.putExtra("idkhachhang",id);
                                        startActivity(i);
                                    }
                                }, 2000);
                            }
                        }
                    }

                    @Override
                    public void onFailure(Call<Account> call, Throwable t) {
            progressDialog.dismiss();
                        Show.Notify(getApplicationContext(),"Sai thong tin");
                    }
                });
            }

        });
    }
}