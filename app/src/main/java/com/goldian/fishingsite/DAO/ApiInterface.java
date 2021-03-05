package com.goldian.fishingsite.DAO;

import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.Model.UserModel;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface ApiInterface {

    @POST("user")
    @FormUrlEncoded
    Call<UserModel> loginUser(@Field("username") String username,
                                  @Field("password") String password);

    @GET("user")
    Call<List<UserModel>> profileUser();

    @GET("itemrec")
    Call<List<ItemModel>> cucitest();


}

