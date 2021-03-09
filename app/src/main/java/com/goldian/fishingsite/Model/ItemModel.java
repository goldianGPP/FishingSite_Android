package com.goldian.fishingsite.Model;

public class ItemModel {
    protected String id_item, id_pengguna, nama, description, harga, jumlah, img, rating, sumrater, jenis;
    protected UserModel userModel = new UserModel();

    public ItemModel(String id_item, String id_pengguna, String nama, String description, String harga, String jumlah, String img, String rating, String sumrater, String jenis, UserModel userModel) {
        this.id_item = id_item;
        this.id_pengguna = id_pengguna;
        this.nama = nama;
        this.description = description;
        this.harga = harga;
        this.jumlah = jumlah;
        this.img = img;
        this.rating = rating;
        this.sumrater = sumrater;
        this.jenis = jenis;
        this.userModel = userModel;
    }

    public String getId_item() {
        return id_item;
    }

    public void setId_item(String id_item) {
        this.id_item = id_item;
    }

    public String getId_pengguna() {
        return id_pengguna;
    }

    public void setId_pengguna(String id_pengguna) {
        this.id_pengguna = id_pengguna;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHarga() {
        return harga;
    }

    public void setHarga(String harga) {
        this.harga = harga;
    }

    public String getJumlah() {
        return jumlah;
    }

    public void setJumlah(String jumlah) {
        this.jumlah = jumlah;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getSumrater() {
        return sumrater;
    }

    public void setSumrater(String sumrater) {
        this.sumrater = sumrater;
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }
}
