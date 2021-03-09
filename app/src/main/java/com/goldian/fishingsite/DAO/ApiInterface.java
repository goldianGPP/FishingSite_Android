package com.goldian.fishingsite.DAO;

import com.goldian.fishingsite.Model.BenangModel;
import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.Model.JoranModel;
import com.goldian.fishingsite.Model.KailModel;
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

    @GET("CtrlRecomender/itemrec")
    Call<List<ItemModel>> cucitest();

    @POST("item/detail")
    @FormUrlEncoded
    Call<JoranModel> joran(@Field("id_item") String id_item,
                           @Field("jenis") String jenis);

    @POST("item/detail")
    @FormUrlEncoded
    Call<KailModel> kail(@Field("id_item") String id_item,
                         @Field("jenis") String jenis);

    @POST("item/detail")
    @FormUrlEncoded
    Call<BenangModel> benang(@Field("id_item") String id_item,
                             @Field("jenis") String jenis);


}

