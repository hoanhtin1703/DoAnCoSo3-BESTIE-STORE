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
import com.example.lib.model.DonHang;

import java.text.DecimalFormat;
import java.util.List;

public class DonHangAdapter extends RecyclerView.Adapter<DonHangAdapter.GetDonHangViewHolder> {
    Context context;
    List<DonHang.Result> list;

    public DonHangAdapter(Context context, List<DonHang.Result> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public GetDonHangViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_donhang,parent,false);
        GetDonHangViewHolder donHangViewHolder = new GetDonHangViewHolder(view);
        return donHangViewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull GetDonHangViewHolder holder, int position) {
        DonHang.Result donhang = list.get(position);
        holder.tensp.setText(donhang.getTensanpham());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.giasp.setText(decimalFormat.format(Double.parseDouble(donhang.getGiasanpham()))+" đ");
        holder.soluongdonhang.setText(String.valueOf(donhang.getSoluongsanpham()));
        int thanhtien = Integer.parseInt(donhang.getGiasanpham()) * donhang.getSoluongsanpham();
        int trangthai = donhang.getTrangthai();
        if(trangthai == 0){
            holder.trangthai.setText("Trạng Thái : Đang Vận Chuyển");
        }
        else {
            holder.trangthai.setText("Trạng Thái : Đã Giao");
        }
        holder.tvthanhtien.setText(decimalFormat.format(thanhtien)+" đ");
        Glide.with(context).load(donhang.getHinhanhsanpham())
                .placeholder(R.drawable.img_default)
                .error(R.drawable.img_error)
                .into(holder.hinhanh);
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class GetDonHangViewHolder extends RecyclerView.ViewHolder{
        public ImageView hinhanh;
        public TextView tensp,giasp,soluongdonhang,tvthanhtien,trangthai;
        public GetDonHangViewHolder(@NonNull View itemView) {
            super(itemView);
            hinhanh = (ImageView) itemView.findViewById(R.id.hinhmon_donhang);
            tensp = (TextView)  itemView.findViewById(R.id.tenmon_giohang);
            giasp = (TextView)  itemView.findViewById(R.id.gia_giohang);
            soluongdonhang = (TextView)  itemView.findViewById(R.id.soluong);
            tvthanhtien = (TextView)  itemView.findViewById(R.id.thanhtien_giohang);
            trangthai = (TextView)  itemView.findViewById(R.id.trangthai);
        }
    }
}
