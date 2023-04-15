-- sélection de toutes les  informations de la table membre
-- select * from membres;

-- sélectionne les différents types d'activités (leur id) proposés dans les salles
 -- select distinct type_activites from salles;

-- sélection du nom de médecin de Mlle Farmera
-- select nom_medecin, nom from membres 
-- join medecin on membres.medecin_id = medecin.medecin_id
-- where membres.nom = "farmera";


-- sélectionne le nom du membres qui fait du sport dans un club dont la superficie est supérieure à 300m2 et dont le nom du médecin est Takahiro
-- select membres.membre_id,nom,superficie from membres
 -- join clubs on membres.membre_id = clubs.membre_id
--  join medecin on membres.medecin_id = medecin.medecin_id
--  where superficie > 300 and nom_medecin = "takahiro"; 

-- sélectionne les noms d'assurances classés et visualisables dans l'ordre alphabétique croissant
-- select nom_assurance from assurance order by nom_assurance ASC;

-- selectionne une limite de 3 adresses
-- select adresse_complete from coordonnees limit 3;  ;

-- sélectionne le prix de l'abonnement annuel le moins cher
-- select min(facture_abonnement) from abonnement;

-- sélectionne la moyenne des dépenses totaux annuels des membres du clubs
-- select avg(montant_total) from caisses;

-- sélectionne le type d'abonnement dont commençant par "pre"
-- select * from type_abonnement where type_abo like 'pre%';

-- sélectionne les clubs (ainsi que leur superficie respective) dont la superficie est comprises entre 230 et 500m2
-- select nom_club,superficie from clubs where superficie between 230 and 500;

-- sélectionne les noms ainsi que le type d'activité pour laquelle celle ci n'est pas du cyclisme
-- select nom, salles_activites.typ_e from membres
--  join clubs on membres.membre_id = clubs.membre_id
 -- join salles on salles.salle_id = clubs.salle_id
--  join salles_activites on salles_activites.type_activites = salles.type_activites
 -- where not typ_e = "cyclisme";
 
 
 -- sélectionne le nombre de patients/membres par médecin dont le nombre de patient par médecin est supérieur strcitement à 2
--  select count(nom) as nombre_de_membres_patient, nom_medecin from membres
--  join medecin on membres.medecin_id = medecin.medecin_id
--  group by nom_medecin
-- having nombre_de_membres_patient > 2;
 



