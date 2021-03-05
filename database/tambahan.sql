-- ============================================================
--   Database name:  MODEL_5                                   
--   DBMS name:      ORACLE Version 7.0                        
--   Created on:     2/19/2021  7:56 PM                        
-- ============================================================

-- ============================================================
--   Table: DETAIL_USER                                        
-- ============================================================
create table DETAIL_USER
(
    ID_USERS                        INTEGER                not null AUTO_INCREMENT,
    ID_DETAIL_USER                  INTEGER                null    ,
    JORAN                           CHAR(50)               null    ,
    MATA_KAIL                       CHAR(50)               null    ,
    BENANG                          CHAR(50)               null    ,
    TIPE_LOKASI                     CHAR(50)               null    ,
    constraint PK_DETAIL_USER primary key (ID_USERS)
);

alter table DETAIL_USER
    add constraint FK_RELATION_146 foreign key  (ID_USERS)
       references USERS (ID_USERS);

