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
import com.goldian.fishingsite.Model.BenangModel;
import com.goldian.fishingsite.R;
import com.squareup.picasso.Picasso;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class DetailBenangActivity extends AppCompatActivity {
    String id_item;
    TextView harga, detail, nama, deskripsi;
    RatingBar strRate;
    Button contact;
    BenangModel benangModel;
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
        Picasso.get().load(benangModel.getImg()).into(imageView);
        nama.setText(benangModel.getNama());
        harga.setText(benangModel.getHarga());
        strRate.setRating(Float.parseFloat(benangModel.getRating()));
        String set = "jenis \t\t\t\t:" + benangModel.getJenis_item() + "\n" +
                     "ketahanan \t:" + benangModel.getKetahanan();
        detail.setText(set);
        deskripsi.setText("deskripsi : \n" + benangModel.getDescription());
    }

    void getDetail(){
        Call<BenangModel> call = apiInterface.benang(id_item, "benang");
        call.enqueue(new Callback<BenangModel>() {
            @Override
            public void onResponse(Call<BenangModel> call, Response<BenangModel> response) {
                if(response.isSuccessful()){
                    benangModel = response.body();
                    setDetail();
                    Toast.makeText(DetailBenangActivity.this,"success : " + response.message(),Toast.LENGTH_LONG).show();
                }
                else
                    Toast.makeText(DetailBenangActivity.this,"failed : " + response.message(),Toast.LENGTH_LONG).show();
            }

            @Override
            public void onFailure(Call<BenangModel> call, Throwable t) {
                Toast.makeText(DetailBenangActivity.this,"failed 2 : " + t.getMessage(),Toast.LENGTH_LONG).show();
                call.cancel();
            }
        });
    }
}
