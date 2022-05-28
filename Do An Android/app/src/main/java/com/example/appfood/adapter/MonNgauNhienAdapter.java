package com.example.appfood.adapter;


import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appfood.R;
import com.example.appfood.activity.ChiTietMonActivity;
import com.example.lib.InterfaceResponsitory.ItemClickOptions;
import com.example.lib.model.Mon;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


public class MonNgauNhienAdapter extends RecyclerView.Adapter<MonNgauNhienAdapter.GetViewMonNgauNhien> implements Filterable {
    Context context;
    List<Mon.Result> list,filterlist;


    public MonNgauNhienAdapter(Context context, List<Mon.Result> list) {
        this.context = context;
        this.list = list;
        this.filterlist = list;
    }

    @NonNull
    @Override
    public GetViewMonNgauNhien onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view =  LayoutInflater.from(parent.getContext()).inflate(R.layout.item_grid_mon_ngau_nhien,parent,false);
        GetViewMonNgauNhien getViewMonNgauNhien = new GetViewMonNgauNhien(view);
        return getViewMonNgauNhien;
    }

    @Override
    public void onBindViewHolder(@NonNull GetViewMonNgauNhien holder, int position) {
        Mon.Result monResult = list.get(position);
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.gia.setText(decimalFormat.format(Double.parseDouble(monResult.getGiasanpham()))+" đ");
        holder.tenmon.setText(monResult.getTensanpham());
        holder.mota.setText(monResult.getMotasanpham());
        Glide.with(context).load(monResult.getHinhanhsanpham())
                .placeholder(R.drawable.img_default)
                .error(R.drawable.img_error)
                .into(holder.hinhmon);
        holder.setItemClickOptions(new ItemClickOptions() {
            @Override
            public void onClickOptions(View view, int pos, int value) {
                    Intent intent = new Intent(context, ChiTietMonActivity.class);
                    intent.putExtra("chitietmon",monResult);
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    @Override
    public Filter getFilter() {
        return new Filter() {
            @Override
            protected FilterResults performFiltering(CharSequence charSequence) {
                FilterResults results = new FilterResults();
                if(charSequence != null && charSequence.length() > 0)
                {
                    //CHANGE TO UPPER
                    charSequence=charSequence.toString().toUpperCase();
                    //STORE OUR FILTERED PLAYERS
                    List<Mon.Result> filteredPets=new ArrayList<>();
                    for (int i=0;i<filterlist.size();i++)
                    {
                        //CHECK
                        if(filterlist.get(i).getTensanpham().toUpperCase().contains(charSequence))
                        {
                            //ADD PLAYER TO FILTERED PLAYERS
                            filteredPets.add(filterlist.get(i));
                        }
                    }
                    results.count=filteredPets.size();
                    results.values=filteredPets;
                }else
                {
                    results.count=filterlist.size();
                    results.values=filterlist;
                }
                return results;
            }

            @Override
            protected void publishResults(CharSequence charSequence, FilterResults filterResults) {
                list= (List<Mon.Result>) filterResults.values;
//                //REFRESH
               notifyDataSetChanged();
            }
        };
    }

    public class GetViewMonNgauNhien extends  RecyclerView.ViewHolder implements View.OnClickListener {
        TextView gia,tenmon,mota;
        ImageView hinhmon;
        private ItemClickOptions itemClickOptions;
        public GetViewMonNgauNhien(@NonNull View itemView) {
            super(itemView);
            gia = itemView.findViewById(R.id.gia);
            tenmon = itemView.findViewById(R.id.tenmon);
            mota = itemView.findViewById(R.id.mota);
            hinhmon = itemView.findViewById(R.id.hinhmon);
            itemView.setOnClickListener(this);
        }

        public void setItemClickOptions(ItemClickOptions itemClickOptions) {
            this.itemClickOptions = itemClickOptions;
        }


        @Override
        public void onClick(View view) {
            itemClickOptions.onClickOptions(view, getAbsoluteAdapterPosition(),0);
        }
    }
}