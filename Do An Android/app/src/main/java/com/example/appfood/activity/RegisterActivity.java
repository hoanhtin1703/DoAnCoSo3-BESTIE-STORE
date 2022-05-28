package com.example.appfood.activity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

import com.example.appfood.R;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.common.Validate;
import com.example.lib.model.Account;

import retrofit2.Call;
import retrofit2.Callback;

public class RegisterActivity extends AppCompatActivity {
    CoordinatorLayout layout;
    AppFoodMethods appFoodMethods;
    private EditText user_name,password,email,phone,address;
    private String muser_name,mpassword,memail,mphone,maddress;
    private TextView tvEmail;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // Khởi tạo các View
//        getSupportActionBar().setTitle("Đăng ký tài khoản " );

        setContentView(R.layout.activity_register);
        tvEmail = findViewById(R.id.tvEmail1);
        user_name = findViewById(R.id.edt_user_name);
        password = findViewById(R.id.edt_password);
        email = findViewById(R.id.edt_email);
        phone = findViewById(R.id.edt_phone);
        address = findViewById(R.id.edt_address);
//
        Button btn_register = findViewById(R.id.btn_register);
//
        TextView click_here = findViewById(R.id.tv_click_here);

        click_here.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(RegisterActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        });
        btn_register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (TextUtils.isEmpty(user_name.getText().toString()) ||
                        TextUtils.isEmpty(password.getText().toString()) ||
                        TextUtils.isEmpty(email.getText().toString()) || TextUtils.isEmpty(phone.getText().toString()) || TextUtils.isEmpty(address.getText().toString())
                ) {
                    AlertDialog.Builder alertDialog = new AlertDialog.Builder(RegisterActivity.this);
                    alertDialog.setMessage("Xin Mời Điền Đầy Đủ Hết Thông Tin!");
                    alertDialog.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
                    alertDialog.show();
                } else {
                    muser_name = user_name.getText().toString().trim();
                    mpassword = password.getText().toString().trim();
                    memail = email.getText().toString().trim();
                    mphone = phone.getText().toString().trim();
                    maddress = address.getText().toString().trim();
                    if (Validate.isValidEmail(memail, tvEmail)) {
                       
                        DangKy(muser_name, memail, mpassword, mphone, maddress);
                    } else {
                        Show.Notify(getApplicationContext(), "Lỗi Đăng Nhập");
                    }

                }
            }
            public  void DangKy(String user_name,String email, String password,String phone,String address){
                appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
                Call <Account> call = appFoodMethods.dangky(user_name,email,password,phone,address);
                call.enqueue(new Callback<Account>() {
                    @RequiresApi(api = Build.VERSION_CODES.P)
                    @Override
                    public void onResponse(Call<Account> call, retrofit2.Response<Account> response) {
                        Log.i(RegisterActivity.class.getSimpleName(), response.toString());
                     String value = response.body().getValue();
                     String result = response.body().getResult();
                        System.out.println(value);
                        if(value.equals("1") && result.equals("1")){
                            layout = findViewById(R.id.layout_id);

                            Show.Notify(getApplicationContext(),"Đăng ký thành công");

                            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    Intent i = new Intent(RegisterActivity.this, LoginActivity.class);
                    startActivity(i);
                }
            },2000);
                        }
                        else {
                            Show.Notify(getApplicationContext(),"Địa Chỉ Email nãy đã có rồi");

                        }
                    }

                    @Override
                    public void onFailure(Call<Account> call, Throwable t) {
                        Show.Notify(getApplicationContext(),"Lỗi Đăng Ký");
                    }
                });
            }
        });

    }


}



