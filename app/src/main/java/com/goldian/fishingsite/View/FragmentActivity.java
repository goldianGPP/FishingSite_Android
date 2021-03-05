package com.goldian.fishingsite.View;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.goldian.fishingsite.R;
import com.goldian.fishingsite.View.Fragment.HomeFragment;
import com.google.android.material.bottomnavigation.BottomNavigationView;

public class FragmentActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fragment);
        init();
    }

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
                            break;
                        case R.id.nav_test1 :
                            select = new HomeFragment();
                            break;
                        case R.id.nav_test2 :
                            select = new HomeFragment();
                            break;
                        case R.id.nav_profile :
                            select = new HomeFragment();
                            break;
                        default:
                            select = new HomeFragment();
                            break;
                    }

                    getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, select).commit();

                    return true;
                }
            };
}
