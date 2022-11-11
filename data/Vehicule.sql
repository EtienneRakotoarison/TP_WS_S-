create table marque(
    idmarque serial primary key,
    nom_marque varchar(255)
);
insert into marque (nom_marque) values
('Toyota'),
('Ford'),
('Mercedes-Benz'),
('Hyundai'),
('Renault');

create table modele(
    idmodele serial primary key,
    idmarque int references marque(idmarque),
    nom_modele varchar(255)
);
insert into modele (idmarque, nom_modele) values
(1, 'Hilux'),
(1, 'Prado'),
(2, 'Ranger'),
(2, 'Focus'),
(3, 'G63'),
(3, 'GLA'),
(4, 'Starex'),
(4, 'i30'),
(5, 'Megane'),
(5, 'Clio');

create table vehicule(
    idvehicule serial primary key,
    idmodele int references modele(idmodele),
    kilometrage_initiale int not null,
    immatriculation varchar(10)
);
insert into vehicule (idmodele, kilometrage_initiale, immatriculation) values
(2, 100, '1234 TBB'),
(2, 100, '2222 TBB'),
(2, 100, '8800 TBB'),
(5, 100, '44044 WWT'),
(5, 100, '1426 TBB'),
(5, 100, '0798 TBB'),
(7, 100, '1324 TBB'),
(8, 100, '9707 TBB'),
(8, 100, '0987 TBB'),
(8, 100, '6555 TBB'),
(5, 100, '0001 TBB');

create table kilometrage(
    idkilometre serial primary key,
    idvehicule int references vehicule(idvehicule),
    daty date not null,
    kilometre_debut int,
    kilometre_fin int
);

create table assurance(
    idassurance serial primary key,
    idvehicule int references vehicule(idvehicule),
    daty_debut date not null,
    daty_fin date not null
);

create table vidange(
    idvidange serial primary key,
    idvehicule int references vehicule(idvehicule),
    daty_vidange date
);

create table kilometrage_vidange(
    idvehicule int references vehicule(idvehicule),
    kilometrage int default 0
);

create table pneu(
    idpneu serial primary key,
    idvehicule int references vehicule(idvehicule),
    daty_change_pneu date
);

create table kilometrage_pneu(
    idvehicule int references vehicule(idvehicule),
    kilometrage int default 0
);
