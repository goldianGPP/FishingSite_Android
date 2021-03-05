package com.goldian.fishingsite.View.Adapter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.goldian.fishingsite.Model.Holder.ItemHolder;
import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.R;
import com.goldian.fishingsite.View.DetailActivity;

import java.util.List;

public class ItemAdapter extends RecyclerView.Adapter<ItemHolder> {
    private Context context;
    List<ItemModel> list;

    public ItemAdapter(Context context, List<ItemModel> list) {
        this.list = list;
        this.context = context;
    }

    @NonNull
    @Override
    public ItemHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {

        View view = LayoutInflater.from(context).inflate(R.layout.view_horizontal_item,viewGroup,false);
        return new ItemHolder(view);
    }

    @SuppressLint("SetTextI18n")
    @Override
    public void onBindViewHolder(@NonNull final ItemHolder holder, int i) {
        final ItemModel currentData = list.get(i);
        holder.nama.setText(currentData.getNama().substring(0,26) + "...");
        holder.harga.setText(currentData.getHarga());
        holder.rating.setRating(Float.parseFloat(currentData.getRating()));

        holder.cardView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(context, DetailActivity.class);
                context.startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return 5;
    }
}