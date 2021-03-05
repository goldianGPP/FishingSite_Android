package com.goldian.fishingsite.View.Fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.goldian.fishingsite.DAO.ApiHelper;
import com.goldian.fishingsite.DAO.ApiInterface;
import com.goldian.fishingsite.Model.ItemModel;
import com.goldian.fishingsite.R;
import com.goldian.fishingsite.View.Adapter.ItemAdapter;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class HomeFragment extends Fragment {

    RecyclerView recyclerView;
    ItemAdapter itemAdapter;
    List<ItemModel> itemModels;
    ApiInterface apiInterface = ApiHelper.getClient().create(ApiInterface.class);

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        final View v = inflater.inflate(R.layout.fragment_home, container, false);
        init(v);

        getRecommendation();
        return v;
    }

    private void getRecommendation(){
        Call<List<ItemModel>> call = apiInterface.cucitest();
        call.enqueue(new Callback<List<ItemModel>>() {
            @Override
            public void onResponse(Call<List<ItemModel>> call, Response<List<ItemModel>> response) {
                if(response.isSuccessful()){
                    itemModels = response.body();
                    itemAdapter = new ItemAdapter(getContext(), itemModels);
                    recyclerView.setAdapter(itemAdapter);
                }
                else{
                    Toast.makeText(getContext().getApplicationContext(),"gagal" + response.message(),Toast.LENGTH_LONG).show();
                }
            }
            @Override
            public void onFailure(Call<List<ItemModel>> call, Throwable t) {
                Toast.makeText(getContext().getApplicationContext(),"gagal" + t.getMessage(),Toast.LENGTH_LONG).show();
                call.cancel();
            }
        });
    }

    private void init(View v){
        //List to RecyclerAdapter
        itemModels = new ArrayList<>();
        recyclerView = v.findViewById(R.id.recyclerView);
        recyclerView.setHasFixedSize(true);
        recyclerView.setLayoutManager(new LinearLayoutManager(getContext(), LinearLayoutManager.HORIZONTAL, false));
    }


}
