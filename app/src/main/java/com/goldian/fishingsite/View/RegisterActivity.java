package com.goldian.fishingsite.View;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.goldian.fishingsite.R;

public class RegisterActivity extends AppCompatActivity {

    EditText username, password, email, phone;
    Button register;
    TextView login;
    Intent intent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        init();

        register.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent = new Intent(RegisterActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        });

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                intent = new Intent(RegisterActivity.this, LoginActivity.class);
                startActivity(intent);
            }
        });
    }

    void init(){
        username = findViewById(R.id.txtUsername);
        password = findViewById(R.id.txtPassword);
        email = findViewById(R.id.txtEmail);
        phone = findViewById(R.id.txtPhone);
        register = findViewById(R.id.btnRegister);
        login = findViewById(R.id.txtLink);
    }
}