package com.goldian.fishingsite.Model;

public class JoranModel extends ItemModel{
    private String id_joran, jenis_item, panjang, berat;

    public JoranModel(String id_item, String id_pengguna, String nama, String description, String harga, String jumlah, String img, String rating, String sumrater, String jenis, UserModel userModel, String id_joran, String jenis_item, String panjang, String berat) {
        super(id_item, id_pengguna, nama, description, harga, jumlah, img, rating, sumrater, jenis, userModel);
        this.id_joran = id_joran;
        this.jenis_item = jenis_item;
        this.panjang = panjang;
        this.berat = berat;
    }

    public String getId_joran() {
        return id_joran;
    }

    public void setId_joran(String id_joran) {
        this.id_joran = id_joran;
    }

    public String getJenis_item() {
        return jenis_item;
    }

    public void setJenis_item(String jenis_item) {
        this.jenis_item = jenis_item;
    }

    public String getPanjang() {
        return panjang;
    }

    public void setPanjang(String panjang) {
        this.panjang = panjang;
    }

    public String getBerat() {
        return berat;
    }

    public void setBerat(String berat) {
        this.berat = berat;
    }
}
