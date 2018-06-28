/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2018. 06. 24. 13:06:35                       */
/*==============================================================*/


alter table CAMPING.TETEL_TORZS
   drop constraint FK_TETEL_TO_REFERENCE_AFA;

alter table CAMPING.AFA
   drop primary key cascade;

drop table CAMPING.AFA cascade constraints;

alter table CAMPING.TETEL_TORZS
   drop primary key cascade;

drop table CAMPING.TETEL_TORZS cascade constraints;

drop user CAMPING;

drop tablespace CAMPING including contents cascade constraints;

create tablespace CAMPING;

/*==============================================================*/
/* User: CAMPING                                                */
/*==============================================================*/
create user CAMPING 
  identified by ""
    default tablespace CAMPING;

/*==============================================================*/
/* Table: AFA                                                   */
/*==============================================================*/
create table CAMPING.AFA 
(
   AFA_ID               NUMBER               not null,
   AFA                  NUMBER(4,2)          not null,
   ERVENYES_TOL         DATE                 not null,
   TIPUS                VARCHAR2(150)
);

alter table CAMPING.AFA
   add constraint PK_AFA primary key (AFA_ID);

/*==============================================================*/
/* Table: TETEL_TORZS                                           */
/*==============================================================*/
create table CAMPING.TETEL_TORZS 
(
   SZAMLA_ID            NUMBER               not null,
   NEV                  VARCHAR2(100),
   AR                   number(10,2),
   AKTIV                dom_in,
   AFA_ID               NUMBER
);

alter table CAMPING.TETEL_TORZS
   add constraint PK_TETEL_TORZS primary key (SZAMLA_ID);

alter table CAMPING.TETEL_TORZS
   add constraint FK_TETEL_TO_REFERENCE_AFA foreign key (AFA_ID)
      references CAMPING.AFA (AFA_ID);

