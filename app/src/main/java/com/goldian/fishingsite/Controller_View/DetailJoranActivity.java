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
import com.goldian.fishingsite.Model.JoranModel;
import com.goldian.fishingsite.R;
import com.squareup.picasso.Picasso;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class DetailJoranActivity extends AppCompatActivity {
    String id_item;
    TextView harga, detail, nama, deskripsi;
    RatingBar strRate;
    Button contact;
    JoranModel joranModel;
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
        Picasso.get().load(joranModel.getImg()).into(imageView);
        nama.setText(joranModel.getNama());
        harga.setText(joranModel.getHarga());
        strRate.setRating(Float.parseFloat(joranModel.getRating()));
        String set = "jenis \t\t\t\t:" + joranModel.getJenis_item() + "\n" +
                     "Berat \t\t\t\t:" + joranModel.getBerat() + "\n" +
                     "Panjang \t\t:" + joranModel.getPanjang();
        detail.setText(set);
        deskripsi.setText("deskripsi : \n" + joranModel.getDescription());
    }

    void getDetail(){
        Call<JoranModel> call = apiInterface.joran(id_item, "joran");
        call.enqueue(new Callback<JoranModel>() {
            @Override
            public void onResponse(Call<JoranModel> call, Response<JoranModel> response) {
                if(response.isSuccessful()){
                    joranModel = response.body();
                    setDetail();
                    Toast.makeText(DetailJoranActivity.this,"gagal" + response.message(),Toast.LENGTH_LONG).show();
                }
                else
                    Toast.makeText(DetailJoranActivity.this,"gagal" + response.message(),Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<JoranModel> call, Throwable t) {
                Toast.makeText(DetailJoranActivity.this,"gagal" + t.getMessage(),Toast.LENGTH_LONG).show();
                call.cancel();
            }
        });
    }
}
