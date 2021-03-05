-- ============================================================
--   Database name:  MODEL_1                                   
--   DBMS name:      ORACLE Version 7.0                        
--   Created on:     2/14/2021  6:04 PM                        
-- ============================================================

-- ============================================================
--   Table: USER                                               
-- ============================================================
create table USER
(
    ID_USER                         INTEGER                not null,
    USERNAME                        CHAR(16)               null    ,
    EMAIL                           CHAR(50)               null    ,
    PHONE                           CHAR(16)               null    ,
    PASSWORD                        CHAR(16)               null    ,
    constraint PK_USER primary key (ID_USER)
)
/

-- ============================================================
--   Table: LOKASI                                             
-- ============================================================
create table LOKASI
(
    ID_LOKASI                       INTEGER                not null,
    NAMA                            CHAR(50)               null    ,
    ALAMAT                          CHAR(50)               null    ,
    constraint PK_LOKASI primary key (ID_LOKASI)
)
/

-- ============================================================
--   Table: ITEM                                               
-- ============================================================
create table ITEM
(
    ID_ITEM                         INTEGER                not null,
    ID_USER                         INTEGER                not null,
    NAMA                            CHAR(50)               null    ,
    DETAIL                          CHAR(255)              null    ,
    HARGA                           CHAR(50)               null    ,
    JUMLAH                          INTEGER                null    ,
    IMG                             CHAR(255)              null    ,
    constraint PK_ITEM primary key (ID_ITEM)
)
/

-- ============================================================
--   Index: RELATION_99_FK                                     
-- ============================================================
create index RELATION_99_FK on ITEM (ID_USER asc)
/

-- ============================================================
--   Table: LOKASI_RATING                                      
-- ============================================================
create table LOKASI_RATING
(
    ID_RATING_LOKASI                INTEGER                not null,
    ID_USER                         INTEGER                not null,
    ID_LOKASI                       INTEGER                not null,
    RATING                          FLOAT                  null    ,
    SUM_USER                        INTEGER                null    ,
    constraint PK_LOKASI_RATING primary key (ID_RATING_LOKASI)
)
/

-- ============================================================
--   Index: RELATION_104_FK                                    
-- ============================================================
create index RELATION_104_FK on LOKASI_RATING (ID_USER asc)
/

-- ============================================================
--   Index: RELATION_105_FK                                    
-- ============================================================
create index RELATION_105_FK on LOKASI_RATING (ID_LOKASI asc)
/

-- ============================================================
--   Table: USER_HISTORY                                       
-- ============================================================
create table USER_HISTORY
(
    ID_USER_HISTORY                 INTEGER                not null,
    ID_USER                         INTEGER                null    ,
    STATUS                          CHAR(10)               null    ,
    DATE_CREATE                     DATE                   null    ,
    DATE_UPDATE                     DATE                   null    ,
    constraint PK_USER_HISTORY primary key (ID_USER_HISTORY)
)
/

-- ============================================================
--   Index: RELATION_62_FK                                     
-- ============================================================
create index RELATION_62_FK on USER_HISTORY (ID_USER asc)
/

-- ============================================================
--   Table: ITEM_HISTORY                                       
-- ============================================================
create table ITEM_HISTORY
(
    ID_ITEM_HISTORY                 INTEGER                not null,
    ID_ITEM                         INTEGER                null    ,
    STATUS                          CHAR(10)               null    ,
    DATE_CREATE                     DATE                   null    ,
    DATE_UPDATE                     DATE                   null    ,
    constraint PK_ITEM_HISTORY primary key (ID_ITEM_HISTORY)
)
/

-- ============================================================
--   Index: RELATION_60_FK                                     
-- ============================================================
create index RELATION_60_FK on ITEM_HISTORY (ID_ITEM asc)
/

-- ============================================================
--   Table: ITEM_RATING                                        
-- ============================================================
create table ITEM_RATING
(
    ID_ITEM                         INTEGER                not null,
    ID_USER                         INTEGER                not null,
    RATING                          FLOAT                  null    ,
    SUM_USER                        INTEGER                null    
)
/

-- ============================================================
--   Index: RELATION_100_FK                                    
-- ============================================================
create index RELATION_100_FK on ITEM_RATING (ID_ITEM asc)
/

-- ============================================================
--   Index: RELATION_101_FK                                    
-- ============================================================
create index RELATION_101_FK on ITEM_RATING (ID_USER asc)
/

-- ============================================================
--   Table: REVIEW                                             
-- ============================================================
create table REVIEW
(
    ID_REVIEW                       INTEGER                not null,
    ID_RATING_LOKASI                INTEGER                not null,
    REVIEW                          CHAR(50)               null    ,
    constraint PK_REVIEW primary key (ID_REVIEW)
)
/

-- ============================================================
--   Index: RELATION_116_FK                                    
-- ============================================================
create index RELATION_116_FK on REVIEW (ID_RATING_LOKASI asc)
/

alter table ITEM
    add constraint FK_RELATION_99 foreign key  (ID_USER)
       references USER (ID_USER)
/

alter table LOKASI_RATING
    add constraint FK_RELATION_104 foreign key  (ID_USER)
       references USER (ID_USER)
/

alter table LOKASI_RATING
    add constraint FK_RELATION_105 foreign key  (ID_LOKASI)
       references LOKASI (ID_LOKASI)
/

alter table USER_HISTORY
    add constraint FK_RELATION_62 foreign key  (ID_USER)
       references USER (ID_USER)
/

alter table ITEM_HISTORY
    add constraint FK_RELATION_60 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM)
/

alter table ITEM_RATING
    add constraint FK_RELATION_100 foreign key  (ID_ITEM)
       references ITEM (ID_ITEM)
/

alter table ITEM_RATING
    add constraint FK_RELATION_101 foreign key  (ID_USER)
       references USER (ID_USER)
/

alter table REVIEW
    add constraint FK_RELATION_116 foreign key  (ID_RATING_LOKASI)
       references LOKASI_RATING (ID_RATING_LOKASI)
/

