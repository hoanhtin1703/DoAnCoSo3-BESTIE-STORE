package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.appfood.adapter.ChiTietDanhMucAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.DanhMuc;
import com.example.lib.model.Mon;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class ChiTietDanhMucActivity extends AppCompatActivity {
    Toolbar toolbar_Chitietdanhmuc;
    RecyclerView recycleView_ChiTietDanhMuc;

    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;

    List<Mon.Result> listMonTheoDanhMuc;
    ChiTietDanhMucAdapter chiTietDanhMucAdapter;
    NotificationBadge badge;
    TextView btn_tieptucmua;
    FrameLayout frame_trangtrong;
//    LinearLayoutManager linearLayoutManager;
//    Handler handler = new Handler();
//    boolean isLoading = false;

//    int page = 1;
//    int select = 5;
    int madanhmuc;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet_danh_muc);

        getViewId();
        actionToolbar();
        khoitao();

        //check network
        if(NetworkConnection.isConnected(this)) {
//            getTrangTrong();
                getChiTietDanhMuc();

//                actionLoading();
            Show.thayDoiSoLuongGioHangNho(badge);
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void khoitao() {
        listMonTheoDanhMuc = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        badge = findViewById(R.id.thongbao_soluong);
        frame_trangtrong = findViewById(R.id.frame_giohangtrong);
        btn_tieptucmua = findViewById(R.id.btn_tieptucmua);
        //set kiểu layout
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this,2);
//        linearLayoutManager = new LinearLayoutManager(this,LinearLayoutManager.VERTICAL,false);
        recycleView_ChiTietDanhMuc.setLayoutManager(layoutManager);
        recycleView_ChiTietDanhMuc.setHasFixedSize(true);
    }

    private void getChiTietDanhMuc() {
        DanhMuc.Result danhmucResult = (DanhMuc.Result) getIntent().getSerializableExtra("chitietdanhmuc");
        madanhmuc = danhmucResult.getId();
        compositeDisposable.add(appFoodMethods.POST_MonTheoDanhMuc(madanhmuc)
          .subscribeOn(Schedulers.io())
          .observeOn(AndroidSchedulers.mainThread())
          .subscribe(
                  mon -> {
                      if (mon.isSuccess()) {
                          listMonTheoDanhMuc = mon.getResult();
                          chiTietDanhMucAdapter = new ChiTietDanhMucAdapter(this, listMonTheoDanhMuc);
                          recycleView_ChiTietDanhMuc.setAdapter(chiTietDanhMucAdapter);
                          toolbar_Chitietdanhmuc.setTitle("Danh Mục :"+danhmucResult.getTenloaisanpham());
                          System.out.println(listMonTheoDanhMuc.size());
                      }
                  },
                  throwable -> {
                      Show.Notify(this,getString(R.string.error_server));
                  }
          ));
    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_Chitietdanhmuc);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Chitietdanhmuc.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });
    }

    private void getViewId() {
        toolbar_Chitietdanhmuc = findViewById(R.id.toolbar_Chitietdanhmuc);
        recycleView_ChiTietDanhMuc = findViewById(R.id.recycleView_ChiTietDanhMuc);
        badge = findViewById(R.id.thongbao_soluong);

    }
    private void getTrangTrong() {
        if(listMonTheoDanhMuc ==null) {
            frame_trangtrong.setVisibility(View.VISIBLE);
            btn_tieptucmua.setText("Mua Sắm Ngay Nào");
        }else{
            frame_trangtrong.setVisibility(View.INVISIBLE);
            chiTietDanhMucAdapter = new ChiTietDanhMucAdapter(this, listMonTheoDanhMuc);
            recycleView_ChiTietDanhMuc.setAdapter(chiTietDanhMucAdapter);
        }
    }
    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        startActivity(trangchu);
    }

    public void openCart(View view) {
        Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
        startActivity(giohang);
    }

    public void muasam(View view) {
        Intent muasam = new Intent(getApplicationContext(),DanhMucActivity.class);
        startActivity(muasam);
    }
    @Override
    protected void onStart() {
        super.onStart();
        Show.thayDoiSoLuongGioHangNho(badge);
    }

    @Override
    protected void onResume() {
        super.onResume();
        Show.thayDoiSoLuongGioHangNho(badge);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}