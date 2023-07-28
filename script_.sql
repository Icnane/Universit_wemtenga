/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 09:13:13                      */
/*==============================================================*/


drop table if exists client;

drop table if exists depense;

drop table if exists mesure_client;

drop table if exists model;

drop table if exists payment;

drop table if exists payment_client;

drop table if exists personnel;

drop table if exists rendez_vous;

drop table if exists utilisateur_systeme;

/*==============================================================*/
/* Table : client                                               */
/*==============================================================*/
create table client
(
   id_client            int not null,
   id_mesure            int not null,
   id_utilisateur       int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   sex                  varchar(254),
   adresse_mail         varchar(254),
   numero_model         int,
   prix_model           int,
   numero_tel           int,
   primary key (id_client)
);

/*==============================================================*/
/* Table : depense                                              */
/*==============================================================*/
create table depense
(
   id_depense           int not null,
   id_personnel         int,
   id_payment           int,
   achat_tissu          int,
   achat_fil            int,
   achat_boutons        int,
   achat_chaine         int,
   achat_machine        int,
   loyer                int,
   achat_fer            int,
   primary key (id_depense)
);

/*==============================================================*/
/* Table : mesure_client                                        */
/*==============================================================*/
create table mesure_client
(
   id_mesure            int not null,
   id_model             int not null,
   epaul                int,
   coup                 int,
   tronc                int,
   main                 int,
   ceinture             int,
   primary key (id_mesure)
);

/*==============================================================*/
/* Table : model                                                */
/*==============================================================*/
create table model
(
   id_model             int not null,
   model_1              int,
   model_2              int,
   model_3              int,
   model_4              int,
   model_5              int,
   primary key (id_model)
);

/*==============================================================*/
/* Table : payment                                              */
/*==============================================================*/
create table payment
(
   id_payment           int not null,
   id_payment_client    int,
   paiment_salaire      int,
   paiment_electricite  int,
   paiment_eau          int,
   primary key (id_payment)
);

/*==============================================================*/
/* Table : payment_client                                       */
/*==============================================================*/
create table payment_client
(
   id_payment_client    int not null,
   id_model             int,
   nom                  varchar(254),
   prenom               varchar(254),
   date                 datetime,
   numero_model         int,
   adresse_mail         varchar(254),
   somme_verce          datetime,
   primary key (id_payment_client)
);

/*==============================================================*/
/* Table : personnel                                            */
/*==============================================================*/
create table personnel
(
   id_personnel         int not null,
   nb_couturier         int,
   nb_couturiere        int,
   nb_aide_couturier    int,
   nb_secretaire        int,
   nb_admin             int,
   primary key (id_personnel)
);

/*==============================================================*/
/* Table : rendez_vous                                          */
/*==============================================================*/
create table rendez_vous
(
   id_rdv               int not null,
   id_payment_client    int,
   date_rdv             int,
   primary key (id_rdv)
);

/*==============================================================*/
/* Table : utilisateur_systeme                                  */
/*==============================================================*/
create table utilisateur_systeme
(
   id_utilisateur       int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   age                  datetime,
   sex                  varchar(254),
   adresse_mail         varchar(254),
   telephone            int,
   type_utilisateur     varchar(254),
   primary key (id_utilisateur)
);

alter table client add constraint FK_Association_1 foreign key (id_utilisateur)
      references utilisateur_systeme (id_utilisateur) on delete restrict on update restrict;

alter table client add constraint FK_Association_2 foreign key (id_mesure)
      references mesure_client (id_mesure) on delete restrict on update restrict;

alter table depense add constraint FK_Association_7 foreign key (id_payment)
      references payment (id_payment) on delete restrict on update restrict;

alter table depense add constraint FK_Association_8 foreign key (id_personnel)
      references personnel (id_personnel) on delete restrict on update restrict;

alter table mesure_client add constraint FK_Association_3 foreign key (id_model)
      references model (id_model) on delete restrict on update restrict;

alter table payment add constraint FK_Association_6 foreign key (id_payment_client)
      references payment_client (id_payment_client) on delete restrict on update restrict;

alter table payment_client add constraint FK_Association_4 foreign key (id_model)
      references model (id_model) on delete restrict on update restrict;

alter table rendez_vous add constraint FK_Association_5 foreign key (id_payment_client)
      references payment_client (id_payment_client) on delete restrict on update restrict;

