package com.example.appfood.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appfood.R;
import com.example.lib.model.Comment;

import java.util.List;

public class BinhLuanAdapter extends RecyclerView.Adapter<BinhLuanAdapter.GetViewBinhLuanAdapter>{
    Context context;
    List<Comment.Result> list;

    public BinhLuanAdapter(Context context, List<Comment.Result> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public GetViewBinhLuanAdapter onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_binhluan,parent,false);
      GetViewBinhLuanAdapter binhLuanAdapter = new GetViewBinhLuanAdapter(view);
        return binhLuanAdapter;
    }

    @Override
    public void onBindViewHolder(@NonNull GetViewBinhLuanAdapter holder, int position) {
      Comment.Result binhluan = list.get(position);
      holder.tenkhachhang.setText(binhluan.getTenkhachang());
      holder.noidung.setText(binhluan.getNoidung());
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class GetViewBinhLuanAdapter extends RecyclerView.ViewHolder{
        TextView tenkhachhang,noidung;
        public GetViewBinhLuanAdapter(@NonNull View itemView) {
            super(itemView);
            tenkhachhang = (TextView) itemView.findViewById(R.id.tenkhachhang);
            noidung = (TextView) itemView.findViewById(R.id.noidung);

        }
    }
}
