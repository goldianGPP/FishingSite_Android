-- ============================================================
--   Database name:  MODEL_1                                   
--   DBMS name:      ORACLE Version 7.0                        
--   Created on:     2/21/2021  6:20 PM                        
-- ============================================================

-- ============================================================
--   Table: KATEGORI                                           
-- ============================================================
create table KATEGORI
(
    ID_KATEGORI                     CHAR(10)               not null,
    KATEGORI_PRODUK                 CHAR(10)               null    ,
    constraint PK_KATEGORI primary key (ID_KATEGORI)
);

-- ============================================================
--   Table: CABANG                                             
-- ============================================================
create table CABANG
(
    ID_CABANG                       CHAR(10)               not null,
    NAMA_CABANG                     CHAR(10)               null    ,
    ALAMAT_CABANG                   CHAR(10)               null    ,
    NO_TELP_CABANG                  CHAR(10)               null    ,
    constraint PK_CABANG primary key (ID_CABANG)
);

-- ============================================================
--   Table: CUSTOMER                                           
-- ============================================================
create table CUSTOMER
(
    ID_CUSTOMER                     CHAR(10)               not null,
    NAMA_CUSTOMER                   CHAR(10)               null    ,
    NO_KTP_CUSTOMER                 CHAR(10)               null    ,
    NO_TELP_CUSTOMER                CHAR(10)               null    ,
    ALAMAT_CUSTOMER                 CHAR(10)               null    ,
    constraint PK_CUSTOMER primary key (ID_CUSTOMER)
);

-- ============================================================
--   Table: PRODUK                                             
-- ============================================================
create table PRODUK
(
    ID_PRODUK                       CHAR(10)               not null,
    NAMA_PRODUK                     CHAR(10)               null    ,
    JUMLAH_PRODUK                   CHAR(10)               null    ,
    HARGA_PRODUK                    CHAR(10)               null    ,
    FOTO_PRODUK                     CHAR(10)               null    ,
    ID_KATEGORI                     CHAR(10)               not null,
    constraint PK_PRODUK primary key (ID_PRODUK)
);

-- ============================================================
--   Index: RELATION_3_FK                                      
-- ============================================================
create index RELATION_3_FK on PRODUK (ID_KATEGORI asc);

-- ============================================================
--   Table: ADMIN                                              
-- ============================================================
create table ADMIN
(
    ID_ADMIN                        INTEGER                not null AUTO_INCREMENT,
    NAMA_USER                       CHAR(10)               null    ,
    NO_KTP_ADMIN                    CHAR(10)               null    ,
    NO_TELP_ADMIN                   CHAR(10)               null    ,
    ALAMAT_ADMIN                    CHAR(10)               null    ,
    ROLE_ADMIN                      CHAR(10)               null    ,
    ID_CABANG                       CHAR(10)               not null,
    constraint PK_ADMIN primary key (ID_ADMIN)
);

-- ============================================================
--   Index: RELATION_341_FK                                    
-- ============================================================
create index RELATION_341_FK on ADMIN (ID_CABANG asc);

-- ============================================================
--   Table: TRANSAKSI                                          
-- ============================================================
create table TRANSAKSI
(
    ID_TRANSAKSI                    CHAR(10)               not null,
    ID_DISKON                       CHAR(10)               not null,
    ID_CUSTOMER                     CHAR(10)               not null,
    TOTAL                           CHAR(10)               null    ,
    JLH_TRANSAKSI                   CHAR(10)               null    ,
    SUBTOTAL                        CHAR(10)               null    ,
    TOTAL_BAYAR                     CHAR(10)               null    ,
    ID_ADMIN                        INTEGER                not null,
    constraint PK_TRANSAKSI primary key (ID_TRANSAKSI)
);

-- ============================================================
--   Index: RELATION_150_FK                                    
-- ============================================================
create index RELATION_150_FK on TRANSAKSI (ID_DISKON asc);

-- ============================================================
--   Index: RELATION_213_FK                                    
-- ============================================================
create index RELATION_213_FK on TRANSAKSI (ID_CUSTOMER asc);

-- ============================================================
--   Index: RELATION_281_FK                                    
-- ============================================================
create index RELATION_281_FK on TRANSAKSI (ID_ADMIN asc);

-- ============================================================
--   Table: INVENTORY                                          
-- ============================================================
create table INVENTORY
(
    ID_INVENTORY                    CHAR(10)               not null,
    JENIS_INVENTORY                 CHAR(10)               null    ,
    JUMLAH_INVENTORY                CHAR(10)               null    ,
    ID_ADMIN                        INTEGER                not null,
    constraint PK_INVENTORY primary key (ID_INVENTORY)
);

-- ============================================================
--   Index: RELATION_340_FK                                    
-- ============================================================
create index RELATION_340_FK on INVENTORY (ID_ADMIN asc);

-- ============================================================
--   Table: DISKON                                             
-- ============================================================
create table DISKON
(
    ID_DISKON                       CHAR(10)               not null,
    NAMA_DISKON                     CHAR(10)               null    ,
    NOMINAL_DISKON                  CHAR(10)               null    ,
    MINIMAL_PEMBELIAN               CHAR(10)               null    ,
    MAKSIMAL_DISKON                 CHAR(10)               null    ,
    ID_ADMIN                        INTEGER                not null,
    constraint PK_DISKON primary key (ID_DISKON)
);

-- ============================================================
--   Index: RELATION_385_FK                                    
-- ============================================================
create index RELATION_385_FK on DISKON (ID_ADMIN asc);

-- ============================================================
--   Table: DETAIL_TRANSAKSI                                   
-- ============================================================
create table DETAIL_TRANSAKSI
(
    ID_DETAIL_TRANSAKSI             INTEGER                not null AUTO_INCREMENT,
    ID_TRANSAKSI                    CHAR(10)               null    ,
    ID_PRODUK                       CHAR(10)               not null,
    REFUND                          INTEGER                null    ,
    TGL_UPDATE                      DATE                   null    ,
    JUMLAH_ITEM                     INTEGER                null    ,
    SUBTOTAL_PRODUK                 INTEGER                null    ,
    constraint PK_DETAIL_TRANSAKSI primary key (ID_DETAIL_TRANSAKSI)
);

-- ============================================================
--   Index: RELATION_13_FK                                     
-- ============================================================
create index RELATION_13_FK on DETAIL_TRANSAKSI (ID_TRANSAKSI asc);

-- ============================================================
--   Index: RELATION_134_FK                                    
-- ============================================================
create index RELATION_134_FK on DETAIL_TRANSAKSI (ID_PRODUK asc);

-- ============================================================
--   Table: DETAIL_INVENTORY                                   
-- ============================================================
create table DETAIL_INVENTORY
(
    ID_DETAIL_INVENTORY             CHAR(10)               not null,
    TGL_MASUK                       DATE                   null    ,
    TGL_UPDATE                      DATE                   null    ,
    ID_INVENTORY                    CHAR(10)               not null,
    constraint PK_DETAIL_INVENTORY primary key (ID_DETAIL_INVENTORY)
);

-- ============================================================
--   Index: RELATION_433_FK                                    
-- ============================================================
create index RELATION_433_FK on DETAIL_INVENTORY (ID_INVENTORY asc);

alter table PRODUK
    add constraint FK_RELATION_3 foreign key  (ID_KATEGORI)
       references KATEGORI (ID_KATEGORI);

alter table ADMIN
    add constraint FK_RELATION_341 foreign key  (ID_CABANG)
       references CABANG (ID_CABANG);

alter table TRANSAKSI
    add constraint FK_RELATION_150 foreign key  (ID_DISKON)
       references DISKON (ID_DISKON);

alter table TRANSAKSI
    add constraint FK_RELATION_213 foreign key  (ID_CUSTOMER)
       references CUSTOMER (ID_CUSTOMER);

alter table TRANSAKSI
    add constraint FK_RELATION_281 foreign key  (ID_ADMIN)
       references ADMIN (ID_ADMIN);

alter table INVENTORY
    add constraint FK_RELATION_340 foreign key  (ID_ADMIN)
       references ADMIN (ID_ADMIN);

alter table DISKON
    add constraint FK_RELATION_385 foreign key  (ID_ADMIN)
       references ADMIN (ID_ADMIN);

alter table DETAIL_TRANSAKSI
    add constraint FK_RELATION_13 foreign key  (ID_TRANSAKSI)
       references TRANSAKSI (ID_TRANSAKSI);

alter table DETAIL_TRANSAKSI
    add constraint FK_RELATION_134 foreign key  (ID_PRODUK)
       references PRODUK (ID_PRODUK);

alter table DETAIL_INVENTORY
    add constraint FK_RELATION_433 foreign key  (ID_INVENTORY)
       references INVENTORY (ID_INVENTORY);

