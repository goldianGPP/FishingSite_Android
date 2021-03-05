package com.goldian.fishingsite.DAO;

import com.goldian.fishingsite.Model.ItemModel;

import java.util.List;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ApiHelper {
    List<ItemModel> itemModels;

    public static final String BASE_URL="http://192.168.100.27:8082/CodeIgniter/fishingsite/api/CtrlRecomender/";
    public static Retrofit retrofit = null;
    public static Retrofit getClient(){
        if(retrofit == null)
        {
            retrofit = new Retrofit.Builder()
                    .baseUrl(BASE_URL)
                    .addConverterFactory(GsonConverterFactory.create())
                    .build();
        }
        return retrofit;
    }

    public static ApiInterface apiInterface(){
        return getClient().create(ApiInterface.class);
    }
}
