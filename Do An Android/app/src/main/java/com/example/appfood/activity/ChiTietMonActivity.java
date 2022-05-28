package com.example.appfood.activity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.appfood.adapter.BinhLuanAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Comment;
import com.example.lib.model.GioHang;
import com.example.lib.model.Mon;
import com.nex3z.notificationbadge.NotificationBadge;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class ChiTietMonActivity extends AppCompatActivity {
    RecyclerView recycleView_binhluan;
    Toolbar toolbar_Chitietmon;
    ImageView hinhmon_chitiet;
    TextView tenmon_chitiet,gia_chitiet,mota_chitiet;
    EditText noidung;
    Button btn_mua;
    Spinner spinner_soluong;
   ImageView btnTru, btnCong,ThemBinhLuan;
//    NotificationBadge thongbao_soluong;
    TextView thongbao_soluong, btnValue;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;
    BinhLuanAdapter binhLuanAdapter;
    Mon.Result monResult;
  List<Comment.Result> listbinhluan;
    NotificationBadge badge;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet_mon);

        getViewId();
        actionToolbar();
        XuLySoLuong();
        getBinhLuan();
        //check network
        if(NetworkConnection.isConnected(this)) {
            getChiTietMon();

            Show.thayDoiSoLuongGioHangNho(badge);
            actionBuy();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void actionBuy() {
        btn_mua.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                themGioHang();
            }
        });
    }

    private void themGioHang() {
        if(Show.listGiohang.size() > 0) {
            boolean isExist = false;
            int soluong = Integer.parseInt(btnValue.getText().toString());
            for(int i = 0;i < Show.listGiohang.size(); i++ ) {
                if(Show.listGiohang.get(i).getMamon() == monResult.getId()) {
                    isExist = true;
                    //cộng dồn
                    int checkSoluong = soluong + Show.listGiohang.get(i).getSoluong();
                    Show.listGiohang.get(i).setSoluong(checkSoluong > 200 ? 200 : checkSoluong);
//                    long thanhtien = Long.parseLong(monResult.getGia()) * Show.listGiohang.get(i).getSoluong();
                }
            }
            if(!isExist) {
//                long thanhtien = Long.parseLong(monResult.getGia()) * soluong;
                GioHang giohang = new GioHang();
                giohang.setGia(Long.parseLong(monResult.getGiasanpham()));
                giohang.setMamon(monResult.getId());
                giohang.setTenmon(monResult.getTensanpham());
                giohang.setHinhmon(monResult.getHinhanhsanpham());
                giohang.setMota(monResult.getMotasanpham());
                giohang.setSoluong(soluong);
                //Thêm vào giỏ
                Show.listGiohang.add(giohang);
            }
        }else{
            int soluong = Integer.parseInt(btnValue.getText().toString());
//            long thanhtien = Long.parseLong(monResult.getGia()) * soluong;
            GioHang giohang = new GioHang();
            giohang.setGia(Long.parseLong(monResult.getGiasanpham()));
            giohang.setMamon(monResult.getId());
            giohang.setTenmon(monResult.getTensanpham());
            giohang.setHinhmon(monResult.getHinhanhsanpham());
            giohang.setMota(monResult.getMotasanpham());
            giohang.setSoluong(soluong);
            //Thêm vào giỏ
            Show.listGiohang.add(giohang);
        }
        // thongbao_soluong.setText(String.valueOf(Show.listGiohang.size())); // đếm theo loại
        Intent intent = new Intent(getApplicationContext(), GioHangActivity.class);
        startActivity(intent);
        badge.setText(String.valueOf(Show.listGiohang.size()));
//        Show.thayDoiSoLuongGioHangNho(badge.setText(String.valueOf(Show.listGiohang.size())));
    }

    private void getChiTietMon() {
        monResult = (Mon.Result) getIntent().getSerializableExtra("chitietmon");
        tenmon_chitiet.setText(monResult.getTensanpham());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        gia_chitiet.setText(decimalFormat.format(Double.parseDouble(monResult.getGiasanpham()))+" đ");
        mota_chitiet.setText(monResult.getMotasanpham());
        Glide.with(getApplicationContext()).load(monResult.getHinhanhsanpham())
                .placeholder(R.drawable.img_default)
                .error(R.drawable.img_error)
                .into(hinhmon_chitiet);


    }
    public void XuLySoLuong(){
        btnTru = (ImageView) findViewById(R.id.tru_giohang);
        btnValue = (TextView) findViewById(R.id.soluong_mon);
        btnCong = (ImageView) findViewById(R.id.cong_giohang);
        btnValue.setText("1");
        btnTru.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int slmoinhat  = Integer.parseInt(btnValue.getText().toString()) - 1;
                btnValue.setText(String.valueOf(slmoinhat));
                if(slmoinhat<0){
                    btnTru.setVisibility(View.INVISIBLE);
                    btnValue.setText(String.valueOf(slmoinhat));
                }
            }
        });
        btnCong.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int slmoinhat  = Integer.parseInt(btnValue.getText().toString()) +1;
                btnValue.setText(String.valueOf(slmoinhat));
            }
        });

    }
private void getBinhLuan(){
    monResult = (Mon.Result) getIntent().getSerializableExtra("chitietmon");
    int id_sanpham = monResult.getId();
    compositeDisposable.add(appFoodMethods.POST_GetBinhLuan(id_sanpham)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                    binhluan -> {
                        if (binhluan.isSuccess()) {
                           listbinhluan = binhluan.getResult();

                            binhLuanAdapter = new BinhLuanAdapter(this, listbinhluan);
                            recycleView_binhluan.setAdapter(binhLuanAdapter);
//
                        }
                    },
                    throwable -> {
                        Show.Notify(this,getString(R.string.error_server));
                    }
            ));
}
private void ThemBinhLuan() {
    final ProgressDialog progressDialog = new ProgressDialog(this);
    progressDialog.setMessage("Đang Tai...");
    progressDialog.show();
                monResult = (Mon.Result) getIntent().getSerializableExtra("chitietmon");
    int id_sanpham = monResult.getId();
    String noidungbinhluan = noidung.getText().toString().trim();
    compositeDisposable.add(appFoodMethods.POST_BinhLuan(id_sanpham,MainActivity.idkhachang,noidungbinhluan)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe(
                    binhluan -> {
                        if (binhluan.isSuccess()) {
                            listbinhluan = binhluan.getResult();
                            binhLuanAdapter = new BinhLuanAdapter(this, listbinhluan);
                            recycleView_binhluan.setAdapter(binhLuanAdapter);
                            new Handler().postDelayed(new Runnable() {
                                @Override
                                public void run() {
                                    progressDialog.dismiss();
                                    noidung.setText("");

                                }
                            }, 2000);

//p
                        }
                    },
                    throwable -> {
                        Show.Notify(this,getString(R.string.error_server));
                    }
            ));

}
    private void actionToolbar() {
        setSupportActionBar(toolbar_Chitietmon);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Chitietmon.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }
    private void getViewId() {
        listbinhluan = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        //set layout 2 cột
        recycleView_binhluan = findViewById(R.id.rcv_comment);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recycleView_binhluan.setLayoutManager(layoutManager);
        recycleView_binhluan.setHasFixedSize(true);
        toolbar_Chitietmon = findViewById(R.id.toolbar_Chitietmon);
        hinhmon_chitiet = findViewById(R.id.hinhmon_chitiet);
        tenmon_chitiet = findViewById(R.id.tenmon_chitiet);
        gia_chitiet = findViewById(R.id.gia_chitiet);
        mota_chitiet = findViewById(R.id.mota_chitiet);
        badge = findViewById(R.id.thongbao_soluong);
        btn_mua = findViewById(R.id.btn_mua);
        noidung = findViewById(R.id.noidung_binhluan);
        ThemBinhLuan = findViewById(R.id.binhluan);
        ThemBinhLuan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ThemBinhLuan();
            }
        });

    }


    public void openCart(View view) {
        Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
        startActivity(giohang);
    }

    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        startActivity(trangchu);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Show.thayDoiSoLuongGioHangNho(badge);
    }

    @Override
    protected void onStart() {
        super.onStart();
        Show.thayDoiSoLuongGioHangNho(badge);
    }
}