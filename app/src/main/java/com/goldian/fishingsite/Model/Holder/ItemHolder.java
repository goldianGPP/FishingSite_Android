package com.goldian.fishingsite.Model.Holder;

import android.view.View;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.goldian.fishingsite.R;

public class ItemHolder extends RecyclerView.ViewHolder {
    public String id_item, description, sumrating, sumrater;
    public TextView nama, harga;
    public RatingBar rating;
    public CardView cardView;

    public ItemHolder(@NonNull View itemView) {
        super(itemView);
        nama = itemView.findViewById(R.id.txtNama);
        harga = itemView.findViewById(R.id.txtHarga);
        rating = itemView.findViewById(R.id.strRate);
        cardView = itemView.findViewById(R.id.card);
    }
}
