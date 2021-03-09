package com.goldian.fishingsite.Model.Holder;

import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.goldian.fishingsite.R;

public class ItemHolder extends RecyclerView.ViewHolder {
    public TextView nama, harga;
    public RatingBar rating;
    public CardView cardView;
    public Button button;
    public ImageView imageView;

    public ItemHolder(@NonNull View itemView) {
        super(itemView);
        nama = itemView.findViewById(R.id.txtNama);
        harga = itemView.findViewById(R.id.txtHarga);
        rating = itemView.findViewById(R.id.strRate);
        cardView = itemView.findViewById(R.id.card);
        button = itemView.findViewById(R.id.btnBtn);
        imageView = itemView.findViewById(R.id.imgItem);
    }
}
