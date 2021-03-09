package com.goldian.fishingsite.Model;

public class BenangModel extends ItemModel {
    private String id_benang, jenis_item, ketahanan;

    public BenangModel(String id_item, String id_pengguna, String nama, String description, String harga, String jumlah, String img, String rating, String sumrater, String jenis, UserModel userModel, String id_benang, String jenis_item, String ketahanan) {
        super(id_item, id_pengguna, nama, description, harga, jumlah, img, rating, sumrater, jenis, userModel);
        this.id_benang = id_benang;
        this.jenis_item = jenis_item;
        this.ketahanan = ketahanan;
    }

    public String getId_benang() {
        return id_benang;
    }

    public void setId_benang(String id_benang) {
        this.id_benang = id_benang;
    }

    public String getJenis_item() {
        return jenis_item;
    }

    public void setJenis_item(String jenis_item) {
        this.jenis_item = jenis_item;
    }

    public String getKetahanan() {
        return ketahanan;
    }

    public void setKetahanan(String ketahanan) {
        this.ketahanan = ketahanan;
    }
}
