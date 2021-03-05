-- ============================================================
--   Database name:  MODEL_5                                   
--   DBMS name:      ORACLE Version 7.0                        
--   Created on:     2/16/2021  2:26 AM                        
-- ============================================================



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
--   Table: JENIS_ITEM                                         
-- ============================================================
create table JENIS_ITEM
(
    ID_JENIS                        INTEGER                not null AUTO_INCREMENT,
    NAMA                            CHAR(50)               null    ,
    constraint PK_JENIS_ITEM primary key (ID_JENIS)
);

-- ============================================================
--   Table: LOKASI_RATING                                      
-- ============================================================
create table LOKASI_RATING
(
    ID_RATING_LOKASI                INTEGER                not null AUTO_INCREMENT,
    ID_LOKASI                       INTEGER                not null,
    ID_USER                         INTEGER                not null,
    RATING                          FLOAT                  null    ,
    SUM_USER                        INTEGER                null    ,
    constraint PK_LOKASI_RATING primary key (ID_RATING_LOKASI)
);

-- ============================================================
--   Index: RELATION_105_FK                                    
-- ============================================================
create index RELATION_105_FK on LOKASI_RATING (ID_LOKASI asc);

-- ============================================================
--   Index: RELATION_104_FK                                    
-- ============================================================
create index RELATION_104_FK on LOKASI_RATING (ID_USER asc);

-- ============================================================
--   Table: TIPE_ITEM                                          
-- ============================================================
create table TIPE_ITEM
(
    ID_TIPE_ITEM                    INTEGER                not null AUTO_INCREMENT,
    ID_JENIS                        INTEGER                not null,
    NAMA                            CHAR(50)               null    ,
    constraint PK_TIPE_ITEM primary key (ID_TIPE_ITEM)
);

-- ============================================================
--   Index: RELATION_114_FK                                    
-- ============================================================
create index RELATION_114_FK on TIPE_ITEM (ID_JENIS asc);

-- ============================================================
--   Table: DETAIL_ITEM                                        
-- ============================================================
create table DETAIL_ITEM
(
    ID_DETAIL_ITEM                  INTEGER                not null AUTO_INCREMENT,
    ID_TIPE_ITEM                    INTEGER                not null,
    ID_ITEM                         INTEGER                null    ,
    UKURAN                          CHAR(10)               null    ,
    BERAT                           CHAR(10)               null    ,
    SUBRATING                       FLOAT                  null    ,
    constraint PK_DETAIL_ITEM primary key (ID_DETAIL_ITEM)
);

-- ============================================================
--   Index: RELATION_124_FK                                    
-- ============================================================
create index RELATION_124_FK on DETAIL_ITEM (ID_TIPE_ITEM asc);

-- ============================================================
--   Index: RELATION_127_FK                                    
-- ============================================================
create index RELATION_127_FK on DETAIL_ITEM (ID_ITEM asc);

-- ============================================================
--   Table: ITEM                                               
-- ============================================================
create table ITEM
(
    ID_ITEM                         INTEGER                not null AUTO_INCREMENT,
    ID_USER                         INTEGER                not null,
    NAMA                            CHAR(50)               null    ,
    DESCRIPTION                     CHAR(255)              null    ,
    HARGA                           CHAR(50)               null    ,
    JUMLAH                          INTEGER                null    ,
    IMG                             CHAR(255)              null    ,
    ID_DETAIL_ITEM                  INTEGER                not null,
    constraint PK_ITEM primary key (ID_ITEM)
);

-- ============================================================
--   Index: RELATION_99_FK                                     
-- ============================================================
create index RELATION_99_FK on ITEM (ID_USER asc);

-- ============================================================
--   Index: RELATION_127_FK2                                   
-- ============================================================
create index RELATION_127_FK2 on ITEM (ID_DETAIL_ITEM asc);

-- ============================================================
--   Table: USER_HISTORY                                       
-- ============================================================
create table USER_HISTORY
(
    ID_USER_HISTORY                 INTEGER                not null AUTO_INCREMENT,
    ID_USER                         INTEGER                not null,
    STATUS                          CHAR(10)               null    ,
    DATE_CREATE                     DATE                   null    ,
    DATE_UPDATE                     DATE                   null    ,
    constraint PK_USER_HISTORY primary key (ID_USER_HISTORY)
);

-- ============================================================
--   Index: RELATION_62_FK                                     
-- ============================================================
create index RELATION_62_FK on USER_HISTORY (ID_USER asc);

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
    ID_USER                         INTEGER                not null,
    RATING                          FLOAT                  null    ,
    SUM_USER                        INTEGER                null    ,
    ID_DETAIL_ITEM                  INTEGER                not null
);

-- ============================================================
--   Index: RELATION_101_FK                                    
-- ============================================================
create index RELATION_101_FK on ITEM_RATING (ID_USER asc);

-- ============================================================
--   Index: RELATION_128_FK                                    
-- ============================================================
create index RELATION_128_FK on ITEM_RATING (ID_DETAIL_ITEM asc);

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
--   Table: TIPE_LOKASI                                        
-- ============================================================
create table TIPE_LOKASI
(
    ID_TIPE_LOKASI                  INTEGER                not null AUTO_INCREMENT,
    ID_TIPE_ITEM                    INTEGER                null    ,
    ID_LOKASI                       INTEGER                null    ,
    NAMA                            CHAR(50)               null    ,
    constraint PK_TIPE_LOKASI primary key (ID_TIPE_LOKASI)
);

-- ============================================================
--   Index: RELATION_193_FK                                    
-- ============================================================
create index RELATION_193_FK on TIPE_LOKASI (ID_TIPE_ITEM asc);

-- ============================================================
--   Index: RELATION_194_FK                                    
-- ============================================================
create index RELATION_194_FK on TIPE_LOKASI (ID_LOKASI asc);

alter table LOKASI_RATING
    add constraint FK_RELATION_105 foreign key  (ID_LOKASI)
       references LOKASI (ID_LOKASI);

alter table LOKASI_RATING
    add constraint FK_RELATION_104 foreign key  (ID_USER)
       references USER (ID_USER);

alter table TIPE_ITEM
    add constraint FK_RELATION_114 foreign key  (ID_JENIS)
       references JENIS_ITEM (ID_JENIS);

alter table DETAIL_ITEM
    add constraint FK_RELATION_124 foreign key  (ID_TIPE_ITEM)
       references TIPE_ITEM (ID_TIPE_ITEM);

alter table DETAIL_ITEM
    add constraint FK_RELATION_127 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table ITEM
    add constraint FK_RELATION_99 foreign key  (ID_USER)
       references USER (ID_USER);

alter table ITEM
    add constraint FK_RELATION_1272 foreign key  (ID_DETAIL_ITEM)
       references DETAIL_ITEM (ID_DETAIL_ITEM);

alter table USER_HISTORY
    add constraint FK_RELATION_62 foreign key  (ID_USER)
       references USER (ID_USER);

alter table ITEM_HISTORY
    add constraint FK_RELATION_60 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM);

alter table ITEM_RATING
    add constraint FK_RELATION_101 foreign key  (ID_USER)
       references USER (ID_USER);

alter table ITEM_RATING
    add constraint FK_RELATION_128 foreign key  (ID_DETAIL_ITEM)
       references DETAIL_ITEM (ID_DETAIL_ITEM);

alter table REVIEW
    add constraint FK_RELATION_116 foreign key  (ID_RATING_LOKASI)
       references LOKASI_RATING (ID_RATING_LOKASI);

alter table TIPE_LOKASI
    add constraint FK_RELATION_193 foreign key  (ID_TIPE_ITEM)
       references TIPE_ITEM (ID_TIPE_ITEM);

alter table TIPE_LOKASI
    add constraint FK_RELATION_194 foreign key  (ID_LOKASI)
       references LOKASI (ID_LOKASI);

