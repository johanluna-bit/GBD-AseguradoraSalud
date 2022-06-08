/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     3/6/2022 21:36:13                            */
/*==============================================================*/


drop index ASESOR_PK;

drop table ASESOR;

drop index CLINICA_ATENCION_FK;

drop index CONTRATO_ATENCION_FK;

drop index ATENCION_PK;

drop table ATENCION;

drop index ASESOR_CLIENTE_FK;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index CLINICA_PK;

drop table CLINICA;

drop index CLIENTE_CONTRATO_FK;

drop index CONTRATO_PK;

drop table CONTRATO;

drop index FACTURA_DETALLE_FK;

drop index SERVICIO_DETALLE_FK;

drop index POLIZA_DETALLE_FK;

drop index DETALLE_PK;

drop table DETALLE;

drop index DOCTOR_PK;

drop table DOCTOR;

drop index ATENCION_ESPECIALIDAD_FK;

drop index DOCTOR_ESPECIALIDAD_FK;

drop index ESPECIALIDAD_PK;

drop table ESPECIALIDAD;

drop index CONTRATO_FACTURA_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index CLIENTE_PATOLOGIA_FK;

drop index PATOLOGIA_PK;

drop table PATOLOGIA;

drop index CONTRATO_POLIZA_FK;

drop index POLIZA_PK;

drop table POLIZA;

drop index CONTRATO_SERVICIO_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

/*==============================================================*/
/* Table: ASESOR                                                */
/*==============================================================*/
create table ASESOR (
   ID_ASESOR            INT4                 not null,
   CEDULA_ASESOR        VARCHAR(11)          null,
   NOMBRE_ASESOR        VARCHAR(40)          null,
   TELEFONO_ASESOR      VARCHAR(11)          null,
   CORREO_ASESOR        VARCHAR(40)          null,
   DIRECCION_ASESOR     VARCHAR(40)          null,
   constraint PK_ASESOR primary key (ID_ASESOR)
);

/*==============================================================*/
/* Index: ASESOR_PK                                             */
/*==============================================================*/
create unique index ASESOR_PK on ASESOR (
ID_ASESOR
);

/*==============================================================*/
/* Table: ATENCION                                              */
/*==============================================================*/
create table ATENCION (
   ID_ATENCION          INT4                 not null,
   ID_CONTRATO          INT4                 null,
   ID_CLINICA           INT4                 null,
   MOTIVO_ATENCION      VARCHAR(45)          null,
   FECHA_ATENCION       DATE                 null,
   PRECIO_ATENCION      MONEY                null,
   constraint PK_ATENCION primary key (ID_ATENCION)
);

/*==============================================================*/
/* Index: ATENCION_PK                                           */
/*==============================================================*/
create unique index ATENCION_PK on ATENCION (
ID_ATENCION
);

/*==============================================================*/
/* Index: CONTRATO_ATENCION_FK                                  */
/*==============================================================*/
create  index CONTRATO_ATENCION_FK on ATENCION (
ID_CONTRATO
);

/*==============================================================*/
/* Index: CLINICA_ATENCION_FK                                   */
/*==============================================================*/
create  index CLINICA_ATENCION_FK on ATENCION (
ID_CLINICA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   ID_ASESOR            INT4                 null,
   CEDULA_CLIENTE       VARCHAR(11)          null,
   NOMBRE_CLIENTE       VARCHAR(40)          null,
   TELEFONO_CLIENTE     VARCHAR(11)          null,
   CORREO_CLIENTE       VARCHAR(40)          null,
   TIPO_SANGRE          VARCHAR(3)           null,
   ESTADO_CUENTA        BOOL                 null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: ASESOR_CLIENTE_FK                                     */
/*==============================================================*/
create  index ASESOR_CLIENTE_FK on CLIENTE (
ID_ASESOR
);

/*==============================================================*/
/* Table: CLINICA                                               */
/*==============================================================*/
create table CLINICA (
   ID_CLINICA           INT4                 not null,
   NOMBRE_CLINICA       VARCHAR(40)          null,
   TELEFONO_CLINICA     VARCHAR(11)          null,
   DIRECCION_CLINICA    VARCHAR(40)          null,
   constraint PK_CLINICA primary key (ID_CLINICA)
);

/*==============================================================*/
/* Index: CLINICA_PK                                            */
/*==============================================================*/
create unique index CLINICA_PK on CLINICA (
ID_CLINICA
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   ID_CONTRATO          INT4                 not null,
   ID_CLIENTE           INT4                 null,
   ESTADO               VARCHAR(40)          null,
   FECHA_CONTRATO       DATE                 null,
   PRECIO_CONTRATO      MONEY                null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Index: CLIENTE_CONTRATO_FK                                   */
/*==============================================================*/
create  index CLIENTE_CONTRATO_FK on CONTRATO (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE (
   ID_DETALLE           INT4                 not null,
   ID_POLIZA            INT4                 null,
   ID_SERVICIO          INT4                 null,
   ID_FACTURA           INT4                 null,
   DESCRIPCION          VARCHAR(40)          null,
   PRECIO_DETALLE       MONEY                null,
   constraint PK_DETALLE primary key (ID_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_PK                                            */
/*==============================================================*/
create unique index DETALLE_PK on DETALLE (
ID_DETALLE
);

/*==============================================================*/
/* Index: POLIZA_DETALLE_FK                                     */
/*==============================================================*/
create  index POLIZA_DETALLE_FK on DETALLE (
ID_POLIZA
);

/*==============================================================*/
/* Index: SERVICIO_DETALLE_FK                                   */
/*==============================================================*/
create  index SERVICIO_DETALLE_FK on DETALLE (
ID_SERVICIO
);

/*==============================================================*/
/* Index: FACTURA_DETALLE_FK                                    */
/*==============================================================*/
create  index FACTURA_DETALLE_FK on DETALLE (
ID_FACTURA
);

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR (
   ID_DOCTOR            INT4                 not null,
   CEDULA_DOCTOR        VARCHAR(11)          null,
   NOMBRE_DOCTOR        VARCHAR(40)          null,
   TELEFONO_DOCTOR      VARCHAR(40)          null,
   CORREO_DOCTOR        VARCHAR(40)          null,
   DIRECCION_DOCTOR     VARCHAR(40)          null,
   constraint PK_DOCTOR primary key (ID_DOCTOR)
);

/*==============================================================*/
/* Index: DOCTOR_PK                                             */
/*==============================================================*/
create unique index DOCTOR_PK on DOCTOR (
ID_DOCTOR
);

/*==============================================================*/
/* Table: ESPECIALIDAD                                          */
/*==============================================================*/
create table ESPECIALIDAD (
   ID_ESPECIALIDAD      INT4                 not null,
   ID_DOCTOR            INT4                 null,
   ID_ATENCION          INT4                 null,
   TIPO_ESPECIALIDAD    VARCHAR(40)          null,
   constraint PK_ESPECIALIDAD primary key (ID_ESPECIALIDAD)
);

/*==============================================================*/
/* Index: ESPECIALIDAD_PK                                       */
/*==============================================================*/
create unique index ESPECIALIDAD_PK on ESPECIALIDAD (
ID_ESPECIALIDAD
);

/*==============================================================*/
/* Index: DOCTOR_ESPECIALIDAD_FK                                */
/*==============================================================*/
create  index DOCTOR_ESPECIALIDAD_FK on ESPECIALIDAD (
ID_DOCTOR
);

/*==============================================================*/
/* Index: ATENCION_ESPECIALIDAD_FK                              */
/*==============================================================*/
create  index ATENCION_ESPECIALIDAD_FK on ESPECIALIDAD (
ID_ATENCION
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           INT4                 not null,
   ID_CONTRATO          INT4                 null,
   FECHA_FACTURA        DATE                 null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: CONTRATO_FACTURA_FK                                   */
/*==============================================================*/
create  index CONTRATO_FACTURA_FK on FACTURA (
ID_CONTRATO
);

/*==============================================================*/
/* Table: PATOLOGIA                                             */
/*==============================================================*/
create table PATOLOGIA (
   ID_PATOLOGIA         INT4                 not null,
   ID_CLIENTE           INT4                 null,
   TIPO_PATOLOGIA       VARCHAR(45)          null,
   constraint PK_PATOLOGIA primary key (ID_PATOLOGIA)
);

/*==============================================================*/
/* Index: PATOLOGIA_PK                                          */
/*==============================================================*/
create unique index PATOLOGIA_PK on PATOLOGIA (
ID_PATOLOGIA
);

/*==============================================================*/
/* Index: CLIENTE_PATOLOGIA_FK                                  */
/*==============================================================*/
create  index CLIENTE_PATOLOGIA_FK on PATOLOGIA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: POLIZA                                                */
/*==============================================================*/
create table POLIZA (
   ID_POLIZA            INT4                 not null,
   ID_CONTRATO          INT4                 null,
   PLAN                 VARCHAR(40)          null,
   constraint PK_POLIZA primary key (ID_POLIZA)
);

/*==============================================================*/
/* Index: POLIZA_PK                                             */
/*==============================================================*/
create unique index POLIZA_PK on POLIZA (
ID_POLIZA
);

/*==============================================================*/
/* Index: CONTRATO_POLIZA_FK                                    */
/*==============================================================*/
create  index CONTRATO_POLIZA_FK on POLIZA (
ID_CONTRATO
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_CONTRATO          INT4                 null,
   TIPO_SERVICIO        VARCHAR(40)          null,
   PRECIO_SERVICIO      MONEY                null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: CONTRATO_SERVICIO_FK                                  */
/*==============================================================*/
create  index CONTRATO_SERVICIO_FK on SERVICIO (
ID_CONTRATO
);

alter table ATENCION
   add constraint FK_ATENCION_CLINICA_A_CLINICA foreign key (ID_CLINICA)
      references CLINICA (ID_CLINICA)
      on delete restrict on update restrict;

alter table ATENCION
   add constraint FK_ATENCION_CONTRATO__CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_ASESOR_CL_ASESOR foreign key (ID_ASESOR)
      references ASESOR (ID_ASESOR)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_CLIENTE_C_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_FACTURA_D_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_POLIZA_DE_POLIZA foreign key (ID_POLIZA)
      references POLIZA (ID_POLIZA)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_SERVICIO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table ESPECIALIDAD
   add constraint FK_ESPECIAL_ATENCION__ATENCION foreign key (ID_ATENCION)
      references ATENCION (ID_ATENCION)
      on delete restrict on update restrict;

alter table ESPECIALIDAD
   add constraint FK_ESPECIAL_DOCTOR_ES_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_CONTRATO__CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

alter table PATOLOGIA
   add constraint FK_PATOLOGI_CLIENTE_P_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table POLIZA
   add constraint FK_POLIZA_CONTRATO__CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_CONTRATO__CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

