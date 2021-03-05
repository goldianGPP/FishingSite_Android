package com.goldian.fishingsite.View;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.goldian.fishingsite.R;

public class LoginActivity extends AppCompatActivity {

    EditText username, password;
    Button login;
    TextView forgot, register;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        init();

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent = new Intent(LoginActivity.this, FragmentActivity.class);
                startActivity(intent);
            }
        });

        forgot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent = new Intent(LoginActivity.this, RegisterActivity.class);
                startActivity(intent);
            }
        });
    }

    void init(){
        username = findViewById(R.id.txtUsername);
        password = findViewById(R.id.txtPassword);
        login = findViewById(R.id.btnLogin);
        forgot = findViewById(R.id.txtForgotPassword);
        register = findViewById(R.id.txtLink);
    }
}
