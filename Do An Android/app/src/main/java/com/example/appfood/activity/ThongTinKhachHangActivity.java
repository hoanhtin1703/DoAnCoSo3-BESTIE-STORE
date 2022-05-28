package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.appfood.R;
import com.example.appfood.adapter.ChiTietGioHangAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.common.Validate;
import com.example.lib.model.KhachHang;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import retrofit2.Call;
import retrofit2.Callback;

public class ThongTinKhachHangActivity extends AppCompatActivity {
    Toolbar toolbarThanhToan;
    static Button btn_xacnhanthanhtoan;
    public static EditText user_name;
    static EditText user_email;
    static EditText user_phone;
    static EditText user_address;
    TextView textview_tongtien;
    ChiTietGioHangAdapter chitietgiohang;
    static int id =0;
    RecyclerView recyclerView;
    static TextView message_name;
    static TextView message_email;
    static TextView message_phone;
    AppFoodMethods appFoodMethods;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thong_tin_khach_hang);
        getViewId();
        actionToolbar();
        GetChitietGioHang();
        if(NetworkConnection.isConnected(this)) {
            tinhTongTienGioHang();
            xacnhanthanhtoan();
            Getinfomation();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }
    private void GetChitietGioHang(){
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setHasFixedSize(true);
        chitietgiohang = new ChiTietGioHangAdapter(this,Show.listGiohang);
        recyclerView.setAdapter(chitietgiohang);
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
                user_name.setText(tenkhachang);
                user_email.setText(email);
                user_phone.setText(sodienthoai);
                user_address.setText(diachi);
            }

            @Override
            public void onFailure(Call<KhachHang> call, Throwable t) {

            }
        });
    }
    public void xacnhanthanhtoan() {
        btn_xacnhanthanhtoan.setOnClickListener(new View.OnClickListener() {
            @Override
            //TaoDonHang
            public void onClick(View view) {
                final String name = user_name.getText().toString();
                final String email = user_email.getText().toString();
                final String phone = user_phone.getText().toString();
//                final String totalPrice = String.valueOf(Show.tinhTongTien());;
//                final String address = user_address.getText().toString();

                if(Validate.isValidName(name,message_name)
                        && Validate.isValidEmail(email,message_email)
                        && Validate.isValidPhone(phone,10,message_phone)) {
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest request = new StringRequest(Request.Method.POST, Url.postBillDetail, new Response.Listener<String>() {
                        @Override
                        public void onResponse(String response) {
                            Show.Notify(getApplicationContext(),getString(R.string.order_send_success));
                            new Handler().postDelayed(new Runnable() {
                                @Override
                                public void run() {

                                    Show.Notify(getApplicationContext(),getString(R.string.order_send_success));
                                    //trở về home
                                    Intent thanhcong = new Intent(getApplicationContext(),SuccessCheckoutActivity.class);
                                    startActivity(thanhcong);
                                }
                            }, 2000);
                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {

                        }
                    }) {

                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            JSONArray jsonArray = new JSONArray();
                            for (int i = 0 ; i < Show.listGiohang.size() ; i++){
                                JSONObject jsonObject = new JSONObject();
                                try {
//
                                    jsonObject.put("id_sanpham",String.valueOf(Show.listGiohang.get(i).getMamon()));
                                    jsonObject.put("id_khachhang", String.valueOf(MainActivity.idkhachang));
                                    jsonObject.put("tensanpham", Show.listGiohang.get(i).getTenmon());
                                    jsonObject.put("giasp",Show.listGiohang.get(i).getGia());
                                    jsonObject.put("soluongsanpham", String.valueOf(Show.listGiohang.get(i).getSoluong()));
                                    System.out.println("gia san pham" + Show.listGiohang.get(i).getGia());
//

                                } catch ( JSONException e) {
                                    e.printStackTrace();
                                }
                                jsonArray.put(jsonObject);
                            }
                            HashMap<String, String> hashMap = new HashMap<String, String>();
                            hashMap.put("json", jsonArray.toString());
                            hashMap.put("id",String.valueOf(MainActivity.idkhachang));
                            return hashMap;
                        }
                    };
                    requestQueue.add(request);
                }else{
                    Validate.isValidName(name,message_name);
                    Validate.isValidEmail(email,message_email);
                    Validate.isValidPhone(phone,10,message_phone);
                }
            }
        });
    }
//
    private void getViewId() {
        recyclerView = findViewById(R.id.rcv_chitietgiohang);
        toolbarThanhToan = findViewById(R.id.toolbarThanhToan);
        btn_xacnhanthanhtoan = findViewById(R.id.btn_xacnhanthanhtoan);
        user_name = findViewById(R.id.user_name);
        user_email = findViewById(R.id.user_email);
        user_phone = findViewById(R.id.user_phone);
        user_address= findViewById(R.id.user_address);
        textview_tongtien= findViewById(R.id.textview_tongtien);
        message_name= findViewById(R.id.message_name);
        message_email= findViewById(R.id.message_email);
        message_phone= findViewById(R.id.message_phone);
        user_address= findViewById(R.id.user_address);
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

    private void tinhTongTienGioHang() {
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        textview_tongtien.setText(decimalFormat.format(Show.tinhTongTien())+" đ");
    }

    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        startActivity(trangchu);
    }

    @Override
    protected void onResume() {
        super.onResume();
        tinhTongTienGioHang();
    }

    @Override
    protected void onStart() {
        super.onStart();
        tinhTongTienGioHang();
    }
}