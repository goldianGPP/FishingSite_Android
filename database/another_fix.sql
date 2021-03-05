-- ============================================================
--   Database name:  MODEL_5                                   
--   DBMS name:      ORACLE Version 7.0                        
--   Created on:     2/19/2021  10:29 PM                       
-- ============================================================

-- ============================================================
--   Table: PENGGUNA                                           
-- ============================================================
create table PENGGUNA
(
    ID_PENGGUNA                     INTEGER                not null AUTO_INCREMENT,
    USERNAME                        CHAR(16)               null    ,
    EMAIL                           CHAR(50)               null    ,
    PHONE                           CHAR(16)               null    ,
    PASSWORD                        CHAR(16)               null    ,
    constraint PK_PENGGUNA primary key (ID_PENGGUNA)
);

-- ============================================================
--   Table: LOKASI                                             
-- ============================================================
create table LOKASI
(
    ID_LOKASI                       INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    ALAMAT                          CHAR(50)               null    ,
    constraint PK_LOKASI primary key (ID_LOKASI)
);

-- ============================================================
--   Table: TIPE_LOKASI                                        
-- ============================================================
create table TIPE_LOKASI
(
    ID_TIPE_LOKASI                  INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    JENIS                           CHAR(50)               null    ,
    constraint PK_TIPE_LOKASI primary key (ID_TIPE_LOKASI)
);

-- ============================================================
--   Table: JENIS_KAIL                                         
-- ============================================================
create table JENIS_KAIL
(
    ID_JENIS_KAIL                   INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    constraint PK_JENIS_KAIL primary key (ID_JENIS_KAIL)
);

-- ============================================================
--   Table: JENIS_JORAN                                        
-- ============================================================
create table JENIS_JORAN
(
    ID_JENIS_JORAN                  INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    constraint PK_JENIS_JORAN primary key (ID_JENIS_JORAN)
);

-- ============================================================
--   Table: JENIS_BENANG                                       
-- ============================================================
create table JENIS_BENANG
(
    ID_JENIS_BENANG                 INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    constraint PK_JENIS_BENANG primary key (ID_JENIS_BENANG)
);

-- ============================================================
--   Table: ITEM                                               
-- ============================================================
create table ITEM
(
    ID_ITEM                         INTEGER               not null AUTO_INCREMENT,
    ID_PENGGUNA                     INTEGER                not null,
    NAMA                            CHAR(50)               null    ,
    DESCRIPTION                     CHAR(255)              null    ,
    HARGA                           CHAR(50)               null    ,
    JUMLAH                          INTEGER                null    ,
    IMG                             CHAR(255)              null    ,
    SUBRATING                       FLOAT(8)               null    ,
    SUMRATER                        INTEGER                null    ,
    constraint PK_ITEM primary key (ID_ITEM)
);

-- ============================================================
--   Index: RELATION_99_FK                                     
-- ============================================================
create index RELATION_99_FK on ITEM (ID_PENGGUNA asc);

-- ============================================================
--   Table: LOKASI_RATING                                      
-- ============================================================
create table LOKASI_RATING
(
    ID_RATING_LOKASI                INTEGER                not null AUTO_INCREMENT,
    ID_LOKASI                       INTEGER                not null,
    ID_PENGGUNA                     INTEGER                not null,
    RATING                          FLOAT(8)               null    ,
    constraint PK_LOKASI_RATING primary key (ID_RATING_LOKASI)
);

-- ============================================================
--   Index: RELATION_105_FK                                    
-- ============================================================
create index RELATION_105_FK on LOKASI_RATING (ID_LOKASI asc);

-- ============================================================
--   Index: RELATION_104_FK                                    
-- ============================================================
create index RELATION_104_FK on LOKASI_RATING (ID_PENGGUNA asc);

-- ============================================================
--   Table: HISTORI_PENGGUNA                                   
-- ============================================================
create table HISTORI_PENGGUNA
(
    ID_HISTORI_PENGGUNA             INTEGER                not null AUTO_INCREMENT,
    ID_PENGGUNA                     INTEGER                not null,
    STATUS                          CHAR(10)               null    ,
    DATE_CREATE                     DATE                   null    ,
    DATE_UPDATE                     DATE                   null    ,
    constraint PK_HISTORI_PENGGUNA primary key (ID_HISTORI_PENGGUNA)
);

-- ============================================================
--   Index: RELATION_62_FK                                     
-- ============================================================
create index RELATION_62_FK on HISTORI_PENGGUNA (ID_PENGGUNA asc);

-- ============================================================
--   Table: ITEM_HISTORY                                       
-- ============================================================
create table ITEM_HISTORY
(
    ID_ITEM_HISTORY                 INTEGER                not null AUTO_INCREMENT,
    ID_ITEM                         INTEGER                null    ,
    STATUS                          CHAR(10)               null    ,
    DATE_CREATE                     DATE                   null    ,
    DATE_UPDATE                     DATE                   null    ,
    constraint PK_ITEM_HISTORY primary key (ID_ITEM_HISTORY)
);

-- ============================================================
--   Index: RELATION_60_FK                                     
-- ============================================================
create index RELATION_60_FK on ITEM_HISTORY (ID_ITEM asc);

-- ============================================================
--   Table: ITEM_RATING                                        
-- ============================================================
create table ITEM_RATING
(
    ID_ITEM_RATING                  INTEGER                not null AUTO_INCREMENT,
    ID_PENGGUNA                     INTEGER                not null,
    ID_ITEM                         INTEGER                not null,
    RATING                          FLOAT(8)               null    ,
    constraint PK_ITEM_RATING primary key (ID_ITEM_RATING)
);

-- ============================================================
--   Index: RELATION_101_FK                                    
-- ============================================================
create index RELATION_101_FK on ITEM_RATING (ID_PENGGUNA asc);

-- ============================================================
--   Index: RELATION_255_FK                                    
-- ============================================================
create index RELATION_255_FK on ITEM_RATING (ID_ITEM asc);

-- ============================================================
--   Table: REVIEW                                             
-- ============================================================
create table REVIEW
(
    ID_REVIEW                       INTEGER                not null AUTO_INCREMENT,
    ID_RATING_LOKASI                INTEGER                not null,
    REVIEW                          CHAR(50)               null    ,
    constraint PK_REVIEW primary key (ID_REVIEW)
);

-- ============================================================
--   Index: RELATION_116_FK                                    
-- ============================================================
create index RELATION_116_FK on REVIEW (ID_RATING_LOKASI asc);

-- ============================================================
--   Table: JORAN                                              
-- ============================================================
create table JORAN
(
    ID_JORAN                        INTEGER                not null AUTO_INCREMENT,
    ID_ITEM                         INTEGER                not null,
    TIPE                            CHAR(50)               null    ,
    PANJANG                         CHAR(50)               null    ,
    BERAT                           CHAR(50)               null    ,
    ID_JENIS_JORAN                  INTEGER                null    ,
    constraint PK_JORAN primary key (ID_JORAN)
);

-- ============================================================
--   Index: RELATION_167_FK                                    
-- ============================================================
create index RELATION_167_FK on JORAN (ID_ITEM asc);

-- ============================================================
--   Index: RELATION_183_FK                                    
-- ============================================================
create index RELATION_183_FK on JORAN (ID_JENIS_JORAN asc);

-- ============================================================
--   Table: KAIL                                               
-- ============================================================
create table KAIL
(
    ID_KAIL                         INTEGER                not null AUTO_INCREMENT,
    ID_ITEM                         INTEGER                not null,
    TIPE                            CHAR(50)               null    ,
    UKURAN                          CHAR(50)               null    ,
    ID_JENIS_KAIL                   INTEGER                null    ,
    constraint PK_KAIL primary key (ID_KAIL)
);

-- ============================================================
--   Index: RELATION_168_FK                                    
-- ============================================================
create index RELATION_168_FK on KAIL (ID_ITEM asc);

-- ============================================================
--   Index: RELATION_191_FK                                    
-- ============================================================
create index RELATION_191_FK on KAIL (ID_JENIS_KAIL asc);

-- ============================================================
--   Table: BENANG                                             
-- ============================================================
create table BENANG
(
    ID_BENANG                       INTEGER                not null AUTO_INCREMENT,
    ID_ITEM                         INTEGER                not null,
    TIPE                            CHAR(50)               null    ,
    KETAHANAN                       CHAR(50)               null    ,
    ID_JENIS_BENANG                 INTEGER                null    ,
    constraint PK_BENANG primary key (ID_BENANG)
);

-- ============================================================
--   Index: RELATION_169_FK                                    
-- ============================================================
create index RELATION_169_FK on BENANG (ID_ITEM asc);

-- ============================================================
--   Index: RELATION_192_FK                                    
-- ============================================================
create index RELATION_192_FK on BENANG (ID_JENIS_BENANG asc);

-- ============================================================
--   Table: DETAIL_LOKASI                                      
-- ============================================================
create table DETAIL_LOKASI
(
    ID_DETAIL_LOKASI                INTEGER                not null AUTO_INCREMENT,
    ID_LOKASI                       INTEGER                null    ,
    ID_JENIS_JORAN                  INTEGER                null    ,
    ID_TIPE_LOKASI                  INTEGER                null    ,
    constraint PK_DETAIL_LOKASI primary key (ID_DETAIL_LOKASI)
);

-- ============================================================
--   Index: RELATION_197_FK                                    
-- ============================================================
create index RELATION_197_FK on DETAIL_LOKASI (ID_LOKASI asc);

-- ============================================================
--   Index: RELATION_198_FK                                    
-- ============================================================
create index RELATION_198_FK on DETAIL_LOKASI (ID_JENIS_JORAN asc);

-- ============================================================
--   Index: RELATION_199_FK                                    
-- ============================================================
create index RELATION_199_FK on DETAIL_LOKASI (ID_TIPE_LOKASI asc);

alter table ITEM
    add constraint FK_RELATION_99 foreign key  (ID_PENGGUNA)
       references PENGGUNA (ID_PENGGUNA);

alter table LOKASI_RATING
    add constraint FK_RELATION_105 foreign key  (ID_LOKASI)
       references LOKASI (ID_LOKASI);

alter table LOKASI_RATING
    add constraint FK_RELATION_104 foreign key  (ID_PENGGUNA)
       references PENGGUNA (ID_PENGGUNA);

alter table HISTORI_PENGGUNA
    add constraint FK_RELATION_62 foreign key  (ID_PENGGUNA)
       references PENGGUNA (ID_PENGGUNA);

alter table ITEM_HISTORY
    add constraint FK_RELATION_60 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table ITEM_RATING
    add constraint FK_RELATION_101 foreign key  (ID_PENGGUNA)
       references PENGGUNA (ID_PENGGUNA);

alter table ITEM_RATING
    add constraint FK_RELATION_255 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table REVIEW
    add constraint FK_RELATION_116 foreign key  (ID_RATING_LOKASI)
       references LOKASI_RATING (ID_RATING_LOKASI);

alter table JORAN
    add constraint FK_RELATION_167 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table JORAN
    add constraint FK_RELATION_183 foreign key  (ID_JENIS_JORAN)
       references JENIS_JORAN (ID_JENIS_JORAN);

alter table KAIL
    add constraint FK_RELATION_168 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table KAIL
    add constraint FK_RELATION_191 foreign key  (ID_JENIS_KAIL)
       references JENIS_KAIL (ID_JENIS_KAIL);

alter table BENANG
    add constraint FK_RELATION_169 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table BENANG
    add constraint FK_RELATION_192 foreign key  (ID_JENIS_BENANG)
       references JENIS_BENANG (ID_JENIS_BENANG);

alter table DETAIL_LOKASI
    add constraint FK_RELATION_197 foreign key  (ID_LOKASI)
       references LOKASI (ID_LOKASI);

alter table DETAIL_LOKASI
    add constraint FK_RELATION_198 foreign key  (ID_JENIS_JORAN)
       references JENIS_JORAN (ID_JENIS_JORAN);

alter table DETAIL_LOKASI
    add constraint FK_RELATION_199 foreign key  (ID_TIPE_LOKASI)
       references TIPE_LOKASI (ID_TIPE_LOKASI);

