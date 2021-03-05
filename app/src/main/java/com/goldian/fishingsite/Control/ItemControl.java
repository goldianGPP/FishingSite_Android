package com.goldian.fishingsite.Control;

import android.content.Context;

import com.goldian.fishingsite.Model.ItemModel;

import java.util.List;

public class ItemControl {
    List<ItemModel> itemModels;
    public List<ItemModel> getRecomentation(final Context context){
        new Thread(new Runnable() {
            public void run() {
            }
        }).start();
        return itemModels;
    };
}
