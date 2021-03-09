package com.goldian.fishingsite.Controller_View;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.goldian.fishingsite.DAO.ApiHelper;
import com.goldian.fishingsite.DAO.ApiInterface;
import com.goldian.fishingsite.Model.KailModel;
import com.goldian.fishingsite.R;
import com.squareup.picasso.Picasso;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class DetailKailActivity extends AppCompatActivity {
    String id_item;
    TextView harga, detail, nama, deskripsi;
    RatingBar strRate;
    Button contact;
    KailModel kailModel;
    ImageView imageView;

    ApiInterface apiInterface = ApiHelper.getClient().create(ApiInterface.class);

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);
        init();
    }

    //----------------------------------------CODE---------------------------------------------------------------------------------------------

    void init(){
        id_item = getIntent().getStringExtra("id_item");

        deskripsi =findViewById(R.id.txtDeskripsi);
        imageView = findViewById(R.id.imageView);
        harga = findViewById(R.id.txtHarga);
        detail = findViewById(R.id.txtDetail);
        nama = findViewById(R.id.txtNama);
        strRate = findViewById(R.id.strRate);
        contact = findViewById(R.id.button);

        getDetail();
    }

    @SuppressLint("SetTextI18n")
    void setDetail(){
        Picasso.get().load(kailModel.getImg()).into(imageView);
        nama.setText(kailModel.getNama());
        harga.setText(kailModel.getHarga());
        strRate.setRating(Float.parseFloat(kailModel.getRating()));
        String set = "jenis \t\t\t\t:" + kailModel.getJenis_item() + "\n" +
                     "ukuran \t\t\t:" + kailModel.getUkuran();
        detail.setText(set);
        deskripsi.setText("deskripsi : \n" + kailModel.getDescription());
    }

    void getDetail(){
        Call<KailModel> call = apiInterface.kail(id_item, "kail");
        call.enqueue(new Callback<KailModel>() {
            @Override
            public void onResponse(Call<KailModel> call, Response<KailModel> response) {
                if(response.isSuccessful()){
                    kailModel = response.body();
                    setDetail();
                    Toast.makeText(DetailKailActivity.this,"gagal" + response.message(),Toast.LENGTH_LONG).show();
                }
                else
                    Toast.makeText(DetailKailActivity.this,"gagal" + response.message(),Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<KailModel> call, Throwable t) {
                Toast.makeText(DetailKailActivity.this,"gagal" + t.getMessage(),Toast.LENGTH_LONG).show();
                call.cancel();
            }
        });
    }
}
