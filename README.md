# Projet-eCommerce-JEE  
Projet JavaEE pour fil rouge [étude AFPA @2018]

## 1) *Configuration de développement*
-----------
### 1.1) Logiciels

MySQL Server 5.7    
MySQL Workbench 6.3     
Eclipse JEE Photon Release (4.8.0)  
Apache Tomcat 9 ou 8.5     

### 1.2) Paramètre BDD

Dump de la base dans dossier MySQL  
fichier : eCommerce.sql [format sql 5.7]

Création des utilisateurs sur le serveur localhost  

| Server   | Nom  | Password |
| --- | :---| ---: |
| localhost  | eclipse  | GoEclipse |
| localhost | chatnoir | -vide- |

## 2) *Utilisation*
-----------
### 2.1) Page d'accueil

url page d'accueil :    
http://localhost:8080/eCommerce/index

### 2.2) Connexion

combinaison user / mdp
| adresse mail    | Password | Statut |
| --- | --- | --- |
| mon@email.com  | azerty | client |
| admin@go.fr | admin | administrateur |
| client@normal.fr | azerty | client avec panier rempli |
| plantage@cmd.fr | plantage | exemple plantage d'un panier corrompu |


### 2.3) Panier

codes réductions applicable uniquement après connection :  
global10 : pour 10% sur la commande     
rocky15 : pour 15% sur l'article Rocky  


