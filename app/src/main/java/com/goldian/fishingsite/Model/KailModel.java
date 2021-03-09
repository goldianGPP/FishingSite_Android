package com.goldian.fishingsite.Model;

public class KailModel extends ItemModel{
    private String id_kail, jenis_item, ukuran;

    public KailModel(String id_item, String id_pengguna, String nama, String description, String harga, String jumlah, String img, String rating, String sumrater, String jenis, UserModel userModel, String id_kail, String jenis_item, String ukuran) {
        super(id_item, id_pengguna, nama, description, harga, jumlah, img, rating, sumrater, jenis, userModel);
        this.id_kail = id_kail;
        this.jenis_item = jenis_item;
        this.ukuran = ukuran;
    }

    public String getId_kail() {
        return id_kail;
    }

    public void setId_kail(String id_kail) {
        this.id_kail = id_kail;
    }

    public String getJenis_item() {
        return jenis_item;
    }

    public void setJenis_item(String jenis_item) {
        this.jenis_item = jenis_item;
    }

    public String getUkuran() {
        return ukuran;
    }

    public void setUkuran(String ukuran) {
        this.ukuran = ukuran;
    }
}
