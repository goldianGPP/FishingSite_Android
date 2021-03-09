package com.goldian.fishingsite.Controller_View;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.goldian.fishingsite.R;
import com.goldian.fishingsite.Controller_View.Fragment.HomeFragment;
import com.goldian.fishingsite.Controller_View.Fragment.SearchFragment;
import com.google.android.material.bottomnavigation.BottomNavigationView;

public class FragmentActivity extends AppCompatActivity {
    int check = 0, test = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fragment);
        getSupportActionBar().hide();
        init();
    }

    //----------------------------------------CODE---------------------------------------------------------------------------------------------

    private void init(){
        BottomNavigationView nav = findViewById(R.id.btm_nav);
//      nav variable : memberikan aksi terhadap tombol navigasi
        nav.setOnNavigationItemSelectedListener(navListener);
//      nav variable : deklarasi default view fragment
        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, new HomeFragment()).commit();
    }

    private BottomNavigationView.OnNavigationItemSelectedListener navListener =
            new BottomNavigationView.OnNavigationItemSelectedListener() {
                @Override
                public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                    Fragment select = null;

                    switch (item.getItemId()){
                        case R.id.nav_home :
                            select = new HomeFragment();
                            check = 0;
                            break;
                        case R.id.nav_search :
                            select = new SearchFragment();
                            check = 1;
                            break;
                        case R.id.nav_test2 :
                            select = new HomeFragment();
                            check = 2;
                            break;
                        case R.id.nav_profile :
                            select = new HomeFragment();
                            check = 3;
                            break;
                        default:
                            select = new HomeFragment();
                            check = 0;
                            break;
                    }
                    if(check != test) {
                        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, select).commit();
                        test = check;
                    }

                    return true;
                }
            };
}
