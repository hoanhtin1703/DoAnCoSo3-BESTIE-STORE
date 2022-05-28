package com.example.appfood.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.lib.model.GioHang;

import java.text.DecimalFormat;
import java.util.List;

public class ChiTietGioHangAdapter extends RecyclerView.Adapter<ChiTietGioHangAdapter.GetViewChiTietGioHang> {
    Context context;
    List<GioHang> list;
    DecimalFormat decimalFormat = new DecimalFormat("###,###,###");

    public ChiTietGioHangAdapter(Context context, List<GioHang> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public GetViewChiTietGioHang onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_chitiet_giohang, parent, false);
        GetViewChiTietGioHang getViewGioHang= new GetViewChiTietGioHang(view);
        return getViewGioHang;

    }

    @Override
    public void onBindViewHolder(@NonNull GetViewChiTietGioHang holder, int position) {
        GioHang giohang = list.get(position);

        holder.tensp.setText(giohang.getTenmon());
        holder.soluong.setText(giohang.getSoluong() +" ");
        Glide.with(context).load(giohang.getHinhmon())
                .placeholder(R.drawable.img_default)
                .error(R.drawable.img_error)
                .into(holder.hinhanhsp);

        holder.giasp.setText(decimalFormat.format(giohang.getGia())+" đ");

        long thanhtien = giohang.getGia() * giohang.getSoluong();
        holder.tongtien.setText(decimalFormat.format(thanhtien)+" đ");
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class GetViewChiTietGioHang extends RecyclerView.ViewHolder{
        public TextView tensp,soluong,giasp,tongtien;
        public ImageView hinhanhsp;
        public GetViewChiTietGioHang(@NonNull View itemView) {
            super(itemView);
            hinhanhsp =itemView.findViewById(R.id.hinhmon_giohang);
            tensp = itemView.findViewById(R.id.tenmon_giohang);
            soluong = itemView.findViewById(R.id.soluong);
            giasp = itemView.findViewById(R.id.gia_giohang);
            tongtien = itemView.findViewById(R.id.thanhtien_giohang);
        }
    }
}
