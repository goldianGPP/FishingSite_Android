package com.goldian.fishingsite.Model.Content;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;

public class SharedPreferencesClass {
    SharedPreferences sharedPref;
    SharedPreferences.Editor editor;
    Activity activity;
    String name;

    public SharedPreferencesClass(Activity activity, String name) {
        this.activity = activity;
        this.name = name;
    }

    public void writePreferences(String key, String value){
        sharedPref = activity.getSharedPreferences(name, Context.MODE_PRIVATE);
        editor = sharedPref.edit();
        editor.putString(key,value);
        editor.apply();
    }

    public String  readPreferences(String key, String defaultValue){
        sharedPref = activity.getSharedPreferences(name, Context.MODE_PRIVATE);
        return sharedPref.getString(key, defaultValue);
    }
}
