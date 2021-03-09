package com.goldian.fishingsite.Model.Adapter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.RecyclerView;

import com.goldian.fishingsite.Controller_View.DetailBenangActivity;
import com.goldian.fishingsite.Controller_View.DetailKailActivity;
import com.goldian.fishingsite.Model.Holder.ItemHolder;
import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.R;
import com.goldian.fishingsite.Controller_View.DetailJoranActivity;
import com.goldian.fishingsite.Controller_View.Fragment.SearchFragment;
import com.squareup.picasso.Picasso;

import java.util.List;

public class ItemAdapter extends RecyclerView.Adapter<ItemHolder> {
    private final Context context;
    List<ItemModel> list;
    int size;

    public ItemAdapter(Context context, List<ItemModel> list, int size) {
        this.list = list;
        this.context = context;
        this.size = size;
    }

    @NonNull
    @Override
    public ItemHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int i) {
        View view;
        if(getItemCount() == list.size())
            view = LayoutInflater.from(context).inflate(R.layout.view_horizontal_item,viewGroup,false);
        else{
            if(i <= (size-2))
                view = LayoutInflater.from(context).inflate(R.layout.view_horizontal_item,viewGroup,false);
            else
                view = LayoutInflater.from(context).inflate(R.layout.view_button,viewGroup,false);
        }
        return new ItemHolder(view);
    }

    @Override
    public int getItemViewType(int position) {
        return (position == 5) ? 6 : position;
    }

    @SuppressLint("SetTextI18n")
    @Override
    public void onBindViewHolder(@NonNull final ItemHolder holder, int i) {
        final ItemModel currentData = list.get(i);
        if(getItemCount() == list.size())
            init (holder, currentData);
        else {
            if (i <= (size-2))
                init(holder, currentData);
            else {
                holder.button.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        ((FragmentActivity) view.getContext()).getSupportFragmentManager().beginTransaction()
                                .replace(R.id.fragment_container, new SearchFragment())
                                .commit();
                    }
                });
            }
        }
    }

    @Override
    public int getItemCount() {
        return size;
    }

    //----------------------------------------CODE---------------------------------------------------------------------------------------------

    @SuppressLint("SetTextI18n")
    void init (ItemHolder holder, final ItemModel currentData){
        holder.nama.setText(currentData.getNama().substring(0,20) + "...");
        holder.harga.setText(currentData.getJenis());
        holder.rating.setRating(Float.parseFloat(currentData.getRating()));
        Picasso.get().load(currentData.getImg()).into(holder.imageView);

        holder.cardView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent;
                if(currentData.getJenis().equals("joran"))
                    intent = new Intent(context, DetailJoranActivity.class);
                else if(currentData.getJenis().equals("benang"))
                    intent = new Intent(context, DetailBenangActivity.class);
                else
                    intent = new Intent(context, DetailKailActivity.class);
                intent.putExtra("id_item",currentData.getId_item());
                context.startActivity(intent);
            }
        });
    }
}