package com.example.appfood.activity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ViewFlipper;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.appfood.adapter.MonNgauNhienAdapter;
import com.example.appfood.adapter.NavAdapter;
import com.example.lib.InterfaceResponsitory.AppFoodMethods;
import com.example.lib.NavForm;
import com.example.lib.RetrofitClient;
import com.example.lib.common.NetworkConnection;
import com.example.lib.common.Show;
import com.example.lib.common.Url;
import com.example.lib.model.Mon;
import com.example.lib.model.QuangCao;
import com.google.android.material.navigation.NavigationView;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {
    public static int idkhachang;
    Toolbar toolbar_Home;
    ViewFlipper viewFlipper;
    RecyclerView recycleView_MonNgauNhien;
    NavigationView navigationView;
    ListView listView_NavHome;
    DrawerLayout drawerLayout;
    NavAdapter navAdapter;
    SearchView searchView;
    NotificationBadge badge;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    AppFoodMethods appFoodMethods;

    List<Mon.Result> listMonNgauNhienResult;
    MonNgauNhienAdapter monNgauNhienAdapter;
    List<QuangCao.Result> listquangcao;
    boolean isLoading = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getViewId();
        actionToolbar();
        khoitao();
        setNav();

        //check network
        if(NetworkConnection.isConnected(this)) {
            Slider();
            GetMonNgauNhien();
            Show.thayDoiSoLuongGioHangNho(badge);
            ChuyenTrang();
            Timkiemsanpham();
        }else{
            Show.Notify(this,getString(R.string.error_network));
            finish();
        }
    }

    private void setNav() {
        //list tùy chọn nav
        navAdapter = new NavAdapter(MainActivity.this,R.layout.item_list_nav);
        listView_NavHome.setAdapter(navAdapter);

        navAdapter.add(new NavForm(R.drawable.ic_menu_res,getString(R.string.menu)));
        navAdapter.add(new NavForm(R.drawable.ic_info,getString(R.string.introduce)));
        navAdapter.add(new NavForm(R.drawable.ic_contact,getString(R.string.contact)));
        navAdapter.add(new NavForm(R.drawable.ic_info,"Đơn Hàng Đã Đặt"));
        navAdapter.add(new NavForm(R.drawable.ic_contact,"Hồ Sơ"));
        navAdapter.add(new NavForm(R.drawable.ic_baseline_logout_24,"Đăng Xuất"));
    }

    private void ChuyenTrang() {
        listView_NavHome.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                drawerLayout.closeDrawer(GravityCompat.START);
                switch (i) {
                    case 0:
                        Intent danhmuc = new Intent(getApplicationContext(),DanhMucActivity.class);
                        startActivity(danhmuc);
                        break;
                    case 1:
                        Intent gioithieuchung = new Intent(getApplicationContext(), GioiThieuChungActivity.class);
                        startActivity(gioithieuchung);
                        break;
                    case 2:
                        Intent lienhe = new Intent(getApplicationContext(),LienHeActivity.class);
                        startActivity(lienhe);
                        break;
                    case 3:
                        Intent donhang = new Intent(getApplicationContext(),DonHangActivity.class);
                        startActivity(donhang);
                        break;
                    case 4:
                        Intent hoso = new Intent(getApplicationContext(),HoSoNguoiDung.class);
                        startActivity(hoso);
                        break;
                    case 5:
                        Intent dangxuat = new Intent(getApplicationContext(),LoginActivity.class);
                        startActivity(dangxuat);
                        break;
                }
            }
        });
    }
    public void Timkiemsanpham(){
        searchView.clearFocus();
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(final String query) {

                monNgauNhienAdapter.getFilter().filter(query);
                return false;
            }
            @Override
            public boolean onQueryTextChange(String newText) {

                monNgauNhienAdapter.getFilter().filter(newText);
                return false;
            }
        });
    }
//    public boolean onCreateOptionsMenu(Menu menu) {
//        MenuInflater inflater = getMenuInflater();
//        inflater.inflate(R.menu.search_menu, menu);
//
//        SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
//
//        final SearchView searchView = (SearchView) menu.findItem(R.id.search).getActionView();
//
//        searchView.setMaxWidth(Integer.MAX_VALUE);
//        MenuItem searchMenuItem = menu.findItem(R.id.search);
//        searchView.setSearchableInfo(
//                searchManager.getSearchableInfo(getComponentName())
//        );
//
//        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
//            @Override
//            public boolean onQueryTextSubmit(final String query) {
//
//                monNgauNhienAdapter.getFilter().filter(query);
//                return false;
//            }
//            @Override
//            public boolean onQueryTextChange(String newText) {
//
//                monNgauNhienAdapter.getFilter().filter(newText);
//                return false;
//            }
//        });
//        searchMenuItem.getIcon().setVisible(false, false);
//        return true;
//    }
    private void GetMonNgauNhien() {
        compositeDisposable.add(appFoodMethods.GET_MonNgauNhien()
        .subscribeOn(Schedulers.io())
        .observeOn(AndroidSchedulers.mainThread())
        .subscribe(
                mon -> {
                    if(mon.isSuccess()) {
                        listMonNgauNhienResult = mon.getResult();
                        monNgauNhienAdapter = new MonNgauNhienAdapter(this,listMonNgauNhienResult);
                        recycleView_MonNgauNhien.setAdapter(monNgauNhienAdapter);
                    }
                },
                throwable -> {
                    Show.Notify(this,"Không thể kết nối với Server!");
                }
        ));
    }

    private void Slider() {
        compositeDisposable.add(appFoodMethods.GetQuangCao()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        quangCao -> {
                            if(quangCao.isSuccess()) {
                                listquangcao = quangCao.getResult();
                                Log.e("list", String.valueOf(listquangcao.size()));
                                for (int i = 0; i< listquangcao.size();i++) {
                                    ImageView imageView = new ImageView(getApplicationContext());
                                    Glide.with(getApplicationContext()).load(listquangcao.get(i).getHinhanh()).into(imageView);
                                    //fix imageView vào ViewFlipper
                                    imageView.setScaleType(ImageView.ScaleType.FIT_XY);
                                    viewFlipper.addView(imageView);
                                }

                                viewFlipper.setFlipInterval(5000);
                                viewFlipper.setAutoStart(true);
                                System.out.println(viewFlipper.isAutoStart());

                                Animation animation_slide_step_1 = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slider_step_1);
                                Animation animation_slide_step_2 = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slider_step_2);
                                viewFlipper.setInAnimation(animation_slide_step_1);
                                viewFlipper.setOutAnimation(animation_slide_step_2);
                            }
                        },
                        throwable -> {
                            Show.Notify(this,getString(R.string.error_server));
                        }
                ));

    }

    private void actionToolbar() {
        setSupportActionBar(toolbar_Home);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        toolbar_Home.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    private void getViewId() {
        searchView = findViewById(R.id.search_view);
        toolbar_Home = findViewById(R.id.toolbar_Home);
        viewFlipper = findViewById(R.id.viewFlipper);
        recycleView_MonNgauNhien = findViewById(R.id.recycleView_MonNgauNhien);
        navigationView = findViewById(R.id.navigationView);
        listView_NavHome = findViewById(R.id.listView_NavHome);
        drawerLayout = findViewById(R.id.drawerLayout);
        badge = findViewById(R.id.thongbao_soluong);

    }

    private void khoitao() {
        listquangcao = new ArrayList<>();
        idkhachang = getIntent().getIntExtra("idkhachhang",0);
        listMonNgauNhienResult = new ArrayList<>();
        appFoodMethods = RetrofitClient.getRetrofit(Url.AppFood_Url).create(AppFoodMethods.class);

        //set layout 2 cột
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this,2);
        recycleView_MonNgauNhien.setLayoutManager(layoutManager);
        recycleView_MonNgauNhien.setHasFixedSize(true);

        //giỏ hàng
        if(Show.listGiohang == null) {
            Show.listGiohang = new ArrayList<>();
        }
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
    protected void onStart() {
        super.onStart();
        idkhachang = getIntent().getIntExtra("idkhachhang",0);
        Show.thayDoiSoLuongGioHangNho(badge);
    }

    @Override
    protected void onResume() {
        super.onResume();
        idkhachang = getIntent().getIntExtra("idkhachhang",0);
         Show.thayDoiSoLuongGioHangNho(badge);
    }


    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}