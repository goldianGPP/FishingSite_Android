package com.goldian.fishingsite.Control;

import com.goldian.fishingsite.DAO.ApiHelper;
import com.goldian.fishingsite.DAO.ApiInterface;
import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.Model.UserModel;

import java.util.List;

public class UserControl {
    ApiInterface apiInterface = ApiHelper.getClient().create(ApiInterface.class);
    List<UserModel> userModels = null;

    List<ItemModel> itemModels = null;

    public void Login(UserModel userModel){
        apiInterface.loginUser(userModel.getUsername(), userModel.getPassword());
    }



}
