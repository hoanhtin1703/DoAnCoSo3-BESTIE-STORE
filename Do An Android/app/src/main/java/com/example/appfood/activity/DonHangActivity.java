package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.appfood.adapter.DonHangAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.DonHang;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class DonHangActivity extends AppCompatActivity {
    Toolbar toolbar_Danhmuc;

    NotificationBadge badge;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;
    List<DonHang.Result> listdonhang;
    DonHangAdapter donHangAdapter;
    //    NotificationBadge badge;
    TextView thongbao_soluong;
    RecyclerView recycleView_donhang;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_don_hang_da_dat);

        getViewId();
        actionToolbar();
        khoitao();

        if(NetworkConnection.isConnected(this)) {

            getDonHang();
            Show.thayDoiSoLuongGioHangNho(badge);
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_Danhmuc);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar_Danhmuc.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
//                startActivity(trangchu);
                finish();
            }
        });
    }

    private void khoitao() {
        badge = findViewById(R.id.thongbao_soluong);
        listdonhang = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);
        //set layout 2 cột
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recycleView_donhang.setLayoutManager(layoutManager);
        recycleView_donhang.setHasFixedSize(true);
    }

    private void getDonHang() {

        compositeDisposable.add(appFoodMethods.POST_GetDonHang(MainActivity.idkhachang)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        donhang -> {
                            if (donhang.isSuccess()) {
                                listdonhang = donhang.getResult();
                                donHangAdapter = new DonHangAdapter(this, listdonhang);
                                recycleView_donhang.setAdapter(donHangAdapter);
//                                toolbar_Chitietdanhmuc.setTitle(danhmucResult.getTenloaisanpham());
                            }
                        },
                        throwable -> {
                            Show.Notify(this,getString(R.string.error_server));
                        }
                ));
    }

    public void ToHome(View view) {
        Intent trangchu = new Intent(getApplicationContext(),MainActivity.class);
        Show.thayDoiSoLuongGioHangNho(badge);
        startActivity(trangchu);
    }

    public void openCart(View view) {
        Intent giohang = new Intent(getApplicationContext(),GioHangActivity.class);
        startActivity(giohang);
    }

    private void getViewId() {

        toolbar_Danhmuc = findViewById(R.id.toolbar_Danhmuc);
        recycleView_donhang = findViewById(R.id.recycleView_donhang);

    }

    @Override
    protected void onStart() {
        super.onStart();
        Show.thayDoiSoLuongGioHangNho(badge);
//        badge.setText(String.valueOf(Show.listGiohang.size()));
        System.out.println("size"+"."+Show.listGiohang.size());
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