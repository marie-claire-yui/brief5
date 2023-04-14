insert into type_abonnement(id_type_abo,type_abo)
values (1,"vip"),(2,"premium version international"),(3,"premium"),(4,"cycliste international"),(5,"cycliste d'eau douce");
-- checked

insert into salles_activites(type_activites,typ_e)
values (1, "cyclisme"),(2,"machines musculation"),(3,"sans machine");
-- checked

insert into salles(salle_id,type_activites,reserve)
values(1,1,1),(2,1,1),(3,2,1),(4,2,0),(5,3,0);
-- checked

insert into abonnement(abonnement_id,id_type_abo,acces_tous_clubs,acces_toutes_salles,activites_collectives,coach)
values(1,1,0,0,0,0),(2,2,0,0,1,0),(3,3,1,0,0,1),(4,4,0,1,1,0),(5,5,1,0,1,1);
 -- checked

insert into medecin(medecin_id, certificat_medical, nom_medecin)
values (1, "654FRGTTHTH23", "Jakowski"),(2,"734cEDGTT","Takahiro"),(3,"34535667DSFCRTRDTFHS","Parisot"),(4,"24335AZCTRH","Saez"),(5,"987dzaidioz","Nunoz");
-- checked

insert into assurance (numero_assure,membre_id,nom_assurance)
values (67,1,"MATMUT"),(54,2,"HARMONIE"),(79,3,"EMGEN"),(28,4,"HARMONIE"),(801,5,"EMGEN");
-- checked

insert into membres(membre_id,nom,prenom,medecin_id,abonnement_id,numero_assure)
values(1,"Jean","Michel",1,1,67),(2,"Polopoff","Pierre",1,2,54),(3,"Davidoff","Marie",2,3,79),(4,"Bossue","Damien",2,3,28),(5,"Farmera","Milène",1,4,801);
-- checked 

insert into caisses(caisse_id,facture_magasin,facture_abonnement,montant_total,membre_id)
values (1, 40,35,75,1),(2, 75,35,110,2),(3, 20,35,55,3),(4,0,35,35,4),(5, 15,35,50,5);
-- checked

insert into  magasin(magasin_id,nrj_drinks,antalgiques,facture_magasin,outfit,membre_id)
values (1,2,2,40,4,1),(2,2,2,75,11,2),(3,1,1,20,2,3),(4,0,0,0,0,4),(5,1,2,15,0,5);
-- checked

insert into clubs(club_id,superficie,nom_club,membre_id,salle_id)
values (1,200,"fitness park",1,2),(2,250,"mario world",2,1),(3,450,"skyrim",3,1),(4,205,"velocity",4,1),(5,600,"fitlanemega",5,3);
-- checked

insert into coordonnees(coordonnees_id,adresse_complete,telephone,mail_sportif,membre_id,medecin_id,club_id,numero_assure)
values(1,"14 parc saint exupery 06100 NICE","0615721337","kasai.mcyui@gmail.com",1,1,1,67),(2,"666 roads of the devil London England","443215721337","helloworld@gmail.com",2,1,1,54),(3,"39 Straße Dusseldorf Franckfurt Allemagne","56715721337","eden.ging@gmail.com",3,1,4,79),(4,"33 Via Ferrata Italia","32567157217","lucibello@gmail.com",4,2,3,28),(5,"1346  avenida Dos Santos","48715778337","undostres@gmail.com",5,3,2,801);
-- checked