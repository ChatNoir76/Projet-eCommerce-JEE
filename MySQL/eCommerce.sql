CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `date_inscription_client` datetime NOT NULL,
  `nom_client` varchar(255) NOT NULL,
  `prenom_client` varchar(255) DEFAULT NULL,
  `sexe_client` char(1) DEFAULT NULL,
  `mail_client` varchar(255) DEFAULT NULL,
  `tel_client` varchar(25) DEFAULT NULL,
  `date_naissance_client` datetime DEFAULT NULL,
  `adresse_client` varchar(255) DEFAULT NULL,
  `code_postal_client` varchar(25) DEFAULT NULL,
  `ville_client` varchar(255) DEFAULT NULL,
  `pays_client` varchar(255) DEFAULT NULL,
  `commentaire_client` varchar(1000) DEFAULT NULL,
  `mdp_client` varchar(25) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `mail_client` (`mail_client`)
) ENGINE=InnoDB AUTO_INCREMENT=12176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (10,'2005-11-24 22:11:00','Skywalker','Luke','h','luke@jedi.com','0836656565','1977-06-05 00:00:00','3 rue de la grotte ','29666','Jedicity','Dagobah','pas de sonnette, merci de crier devant la grotte','loveuyoda'),(11,'2003-02-12 13:22:00','Organa','Leia','f','leia@resistance.com','0935846267','1977-06-05 00:00:00','2045 rue de la citadelle ','35922','le_village','Coruscant','appt 25864','loveuhan'),(12,'2017-03-05 10:05:00','Leponge','Bob','h','bob@spontex.com','0235484542','1990-02-21 00:00:00','122 rue des conques ','2385','Bikini Bottom','ocean pacifique','code porte 0204','plouf'),(13,'2014-02-26 00:00:00','Lennon','John','h','letitbe@gmail.com','855-566-241','1940-10-09 00:00:00','251 Menlove Avenue','26448','Londres','Royaume uni',NULL,'yoko'),(14,'2010-11-01 00:00:00','Manson','Marilyn','h','suicide@666.com','551-004-648','1969-01-05 00:00:00','666 rue du bonheur','26485','Los Angeles','USA',NULL,'mobscene'),(20,'2017-05-12 00:00:00','FOURNIER','David','H','fournier.david@gmail.com','0664251485','1994-05-29 00:00:00','37 rue Fontaine','76710','Montville','France',NULL,'gzfgze'),(21,'2014-01-26 00:00:00','LAURENT','Stephanie','F','laurent.stephanie@gmail.com','0754126845','1959-04-10 00:00:00','12, rue Bohars','29200','Brest','France',NULL,'bzergz'),(22,'2012-07-16 00:00:00','SIMON','Elodie','F','simon.elodie@gmail.com','0654123598','1975-08-15 00:00:00','21 rue Henri Becquerel','60000','Beauvais','France',NULL,'fezfae'),(23,'2005-06-25 00:00:00','GASSAMA','Camara','H','gassama.camara@gmail.com','0742685102','1980-04-24 00:00:00','39 avenue joseph antoine','92700','Colombes','France',NULL,'azfdae'),(24,'2015-03-26 00:00:00','LEPRINCE','Anais','F','leprince.anais@gmail.com','0653209758','1991-06-29 00:00:00','3 rue des jardins','20200','Bastia','France',NULL,'bergzr'),(30,'2017-05-18 00:00:00','DUPONT','Marcel','H','dupont.marcel@gmail.com','0665241578','1988-09-13 00:00:00','15 allée Marceau','76000','Rouen','France',NULL,'fzefz'),(31,'2015-09-24 00:00:00','LEROY','Jean','H','leroy.jean@gmail.com','0664152348','1975-04-12 00:00:00','282 bd St Germain','75007','Paris','France',NULL,'fzgzra'),(32,'2014-02-27 00:00:00','MOREAU','Michelle','F','moreau.michelle@gmail.com','0714542635','1985-12-05 00:00:00','18, rue Baudin Place Charras','92400','Courbevoie','France',NULL,'zvrgvrz'),(33,'2011-05-19 00:00:00','DURAND','Melanie','F','durand.melanie@gmail.com','0668542195','1988-09-26 00:00:00','4, rue danton','75006','Paris','France',NULL,'vzfezfez'),(34,'2016-08-18 00:00:00','MOREL','Olivier','H','morel.olivier@gmail.com','0616574862','1967-05-24 00:00:00','74 rue St Nicolas','76000','Rouen','France',NULL,'dazdaef'),(50,'2018-05-12 22:22:22','Oussama','Faihrir','M','oussama.faihrir@gmail.com','0607080910','1994-06-01 00:00:00','8 rue de la poutre','76000','Rouen','France','oui','azer1234'),(51,'2018-05-13 22:22:23','Golet','Jerry','M','jery.golet@gmail.com','0607080911','1994-06-02 00:00:00','8 rue de la foutre','76320','Paris','Californie','oui','tyui1234'),(52,'2018-05-13 22:22:24','Christ','Jesus','M','geoffroy.aupied@gmail.com','0607080912','1990-01-01 00:00:00','8 rue rue','76000','Washington','Corée_du_Nord','oui','azer1234'),(53,'2018-05-15 22:22:25','Troud','Noemie','F','noemie.troud@gmail.com','0607080913','0594-06-01 00:00:00','8 rue de la loutre','76000','Bordeaux','Irlande','oui','azer1234'),(54,'2018-05-15 22:22:26','Bal','Christian','M','christian.bal@gmail.com','0607080914','1994-06-01 00:00:00','8 rue de la boutre','76000','Geneve','Irak','oui','azer1234'),(60,'2015-10-12 00:00:00','lane','lois','f','jesuisindecis@plop.com','223459848','1980-01-12 00:00:00','11 rue de la chieuse','90000','metropolis','france je crois','aime un homme au gout bizarre','jesuissexy'),(61,'2010-10-12 00:00:00','starky','hoch','h','jesuisindecisq@plop.com','223459878','1988-01-12 00:00:00','11 rueduviellard','90000','oublié','france je crois','paria','tyuiop789'),(62,'2012-10-12 00:00:00','sulivan','cloe','f','jesuisindecissss@plop.com','223459178','1986-01-12 00:00:00','11 rue du cadavre','90000','metropolis','france je crois','morte','jevaismourir'),(63,'2016-10-12 00:00:00','kent','clark','h','jesuisindeciss@plop.com','223459869','1984-01-12 00:00:00','11 rue de la grande folle','90000','metropolis','france je crois','homme en collant.....étrange','jesuismauvaise'),(64,'2017-10-12 00:00:00','phenix','marcus','h','jesuisindecimm@plop.com','223459896','1982-01-12 00:00:00','11 rue du bg','90000','terra','france je crois','champion de la CGU','tyuiop784'),(70,'2012-06-23 00:00:00','cul','jean','H','WTF@HOTMAIL.COM','0123456789','1800-04-12 00:00:00','45 sans vie','69000','DTC','FRANCE','client regulier','RIENAFOUTRE69'),(71,'2000-05-25 00:00:00','bil','mireille','F','BIMI@HOTMAIL.FR','013216789','2012-08-12 00:00:00','54 jaimetout','34000','ouca','FRANCE','client ocassion','bellevie'),(72,'1900-05-06 00:00:00','poil','rasé','H','PR@live.FR','06785389','2000-08-12 00:00:00','21 sans poil','27000','rasoir','FRANCE','client rare','GILLETTE'),(73,'1987-03-25 00:00:00','paul','PIERRETTE','F','papier@HOTMAIL.FR','017656789','2017-12-12 00:00:00','32 boulevard de gaulle','64000','oups','FRANCE','client premium','WW2'),(74,'1990-01-25 00:00:00','ROI','ARTHUR','H','CAMELOT@GMAIL.COM','01342356','0250-08-12 00:00:00','33 SAINT GRAAL','1000','KARMELITE','FRANCE','client basique','excalibur'),(80,'2017-06-15 15:24:35','Auboisdormant','Abel','H','abeladressemail@youhou.com','0658974536','1958-05-14 00:00:00','rue de la rue pres de la rue','76000','Rouen','France','wess bien ta vu!!!','123456'),(81,'2016-03-14 12:35:59','Biensucé','Emma','F','emmavdm@gmail.com','0168947861','1980-09-29 00:00:00','rue du chemin','75000','Paris','France','j\'aime les pommes, mais pas que!!','654321'),(82,'2018-01-27 23:59:14','okardetour','ademar','S','vroomvroom@tuture.fr','0461384678','1998-04-03 00:00:00','avenue martin','69000','Lyon','France','j\'aime les hommes','987654'),(83,'2017-05-26 00:03:57','Yotine','Guy','H','c\'estpluscommeguy@pierre.com','0106487412','1978-02-28 00:00:00','rie du barrage','75000','Paris','France','va faire tout noir!!','456789'),(84,'2016-07-09 15:56:47','Diote','Kelly','F','diote@gmail.com','0648759135','1956-08-30 00:00:00','rue de la marmite','33000','Bordeaux','France','je ne sais pas quoi dire','123987'),(100,'2017-11-11 00:00:00','Faran','Jomaken','M','JomakenFaran@Nomail.com','0102030405','1981-11-11 00:00:00','100 Rue de l arcantraz','66099','Nowhere','Noland','Omae...','Brazemaran'),(101,'2017-11-11 00:00:00','Joanat','Jomaken','F','JomakenJoanat@Nomail.com','0102030402','1981-11-11 00:00:00','100 Rue de l arcantraz','66099','Nowhere','Noland','wa...','wombocombo'),(102,'2017-11-11 00:00:00','Domaran','Dremeria','M','DomarianDremeria@Nomail.com','0102030404','1981-11-11 00:00:00','102 Rue de l arcantraz','66099','Nowhere','Noland',' mo...','iamgroot'),(103,'2017-11-11 00:00:00','Yshtola','Rhul','F','YshtolaRhul@Linkshell.ez','0102030407','1981-11-11 00:00:00','103 Rue de l arcantraz','66987','Nowhere','Noland','shin...','Thanosdidnothingwrong'),(104,'2017-11-11 00:00:00','Saoran','Jzan','M','SaoranJzan@Somalink.ss','0102030408','1981-11-11 00:00:00','104 Rue de l arcantraz','66987','Nowhere','Noland','deiru','Youknownothing'),(110,'2018-01-02 23:14:32','auchon','paul','h','paul.auchon.moelleux@afpa.fr','0617459863','1974-06-04 00:00:00','17 rue du matelas gonflable','95100','Le Lit','fr','n\'est pas forcément un connard selon stéphane...','polo'),(111,'2017-04-25 12:14:33','minou','zazaza','f','monstreetcie@afpeur.mp','+0045616598357','1996-12-25 00:00:00','14 rue du père noel','0','monstro-Polis','mp','possible de trouver pikachu dans la centrale électrique','zaza'),(112,'2018-06-14 21:00:00','iwillsurvive','france','f','france98@nostalgique.fr','0623638954','1998-06-12 00:00:00','03 avenue deschamps','92000','stade de france','fr','et un, et deux et trois ZERO','0123'),(113,'2017-12-12 03:47:36','poutine','vlad','h','vavoirailleurssijysuis@bang.ru',NULL,'1954-12-22 00:00:00','1 avenue du congélateur','13000','marseille','fr','livraison casino de marseille contact Mr Machoir d\'acier','hitman'),(114,'2018-04-17 09:12:32','larousse','titine','f','celle_de_la_cantine@afpa.fr','0669696969','1990-10-04 00:00:00','169 rue de la poupée gonflable','69000','Lit yon','fr','ressemble à s\'y méprendre à un tableau de picasso','rougealevre'),(115,'2018-02-02 22:18:29','ptitegoutte','justine','f','etcorineptitegoutte@blagounn.ette','0800141414','1981-09-23 00:00:00','13 voie de la gueulle à fioul','27230','poivro','fr','elle nest pas très .NET','asp'),(116,'2018-05-29 10:59:01','mitissus','milaine','f','aufildelacouture@labocouture.fr','0236985475','1963-03-27 00:00:00','1 rue de la botte de foin ','45620','aiguille','fr','elle picote un peu celle la','picnikdouille'),(117,'2017-11-11 16:45:32','trompe','donald','h','catrumpenormement@usa.us',NULL,'1950-02-28 00:00:00','99th street','0','baton rouge','us','il est vraiment... loin celui la...','boutonrouge'),(118,'2017-10-25 17:17:17','null','celine','f','celine.null@afpa.fr','0217559853','1968-12-04 00:00:00','69 rue de jean rené','22360','casserol','fr',NULL,'dion'),(119,'2018-01-02 21:23:45','deere','john','h','tracteur@lechamp.com',NULL,'1974-06-04 00:00:00','14 champs à droite du premier','76600','campagnol en caux','fr','la terre c\'est les affaires','agri'),(130,'2017-06-12 00:06:28','dupont','alain','M','bgdf@gmail.com','0625854218','1992-02-01 00:00:00','6 rue verte','92600','colombes','france','aghdcaghcbaghk','1234'),(131,'2017-09-05 14:35:21','jean','luc','M','abcd@gmail.fr','0125897642','1990-01-01 00:00:00','42 rue couture','76800','saint etienne du rouvray','france','azertyuio','4567'),(132,'2018-01-02 16:00:00','charles','henry','M','qsd@hotmail.fr','0521467896','1965-09-08 00:00:00','55 avenue du buisson','65800','brest','france','wxcvbnhgj','7896'),(133,'1990-01-01 00:00:00','peter','francine','F','fghj@xmail.com','0725364121','1973-04-03 00:00:00','28 blvd de paris','25460','biaritz','France','mlkjhgnbvc','3698'),(134,'2018-04-06 18:00:00','sertq','aline','F','wxcvb@lapo.net','0412457836','1996-07-25 00:00:00','13 rue jaune','33025','bordeaux','france','mpolkiujhy','2587'),(140,'2015-01-01 00:00:00','Sifredi','Rocco','M','Rocco@live.fr','0669696969','1977-10-18 00:00:00','12 Rue de la pine','69699','Milan','Italie','Pornstar','zizitoutdur'),(141,'2015-01-02 00:00:00','Stark','Tony','M','tonystark@avengers.com','9658745212','1956-10-07 00:00:00','Stark Tower','911','New-York','Etats-Unis','Héros','starkisthebest'),(142,'2015-01-03 00:00:00','Rodgers','Steeve','M','Steeve@avengers.com','8798684167','1920-01-01 00:00:00','Brooklyn','911','New-York','Etats-Unis','Héros','captainforever'),(143,'2015-01-04 00:00:00','Romanoff','Natasha','F','natasha@avengers.com','2648843187','1985-01-01 00:00:00','Kremlin','117','Moscou','Russie','Héros','cuircuirnichon'),(144,'2015-01-05 00:00:00','Barton','Clint','M','clintbarton@avengers.com','6418688134','1985-01-01 00:00:00','Barton\'s Ranch','5614','Hope City','Etats-Unis','Héros','bowforever'),(12010,'1990-01-01 00:00:00','Royer','Chloé','F','chloe.royer@gmail.com','','1900-01-01 00:00:00','chez papa','76190','Croixmare','France','la plus grande','aucun'),(12011,'1990-01-01 00:00:00','Royer','Léa','F','lea.royer@gmail.com','','1900-01-01 00:00:00','chez papa','76190','Croixmare','France','la plus petite','aucun'),(12012,'1990-01-01 00:00:00','Royer','Joris','H','joris.royer@gmail.com','','1900-01-01 00:00:00','dans maman','0','','','pas encore né','aucun'),(12013,'1990-01-01 00:00:00','Royer','Jonathan','H','jonathan.royer@gmail.com','','1900-01-01 00:00:00','le patriarche','76190','Croixmare','France','le boss','aucun'),(12014,'1990-01-01 00:00:00','Royer','Fripouille','H','fripouille.royer@gmail.co','','1900-01-01 00:00:00','un peu partout','0','','France','le chat','aucun'),(12020,'1999-01-01 00:00:00','nom1','prenom1','h','test','','1999-01-01 00:00:00','add','cp','testville','fr','test','yyyy'),(12032,'1999-01-01 00:00:00','nom1','prenom1','h','testk','','1999-01-01 00:00:00','add','cp','testville','fr','test','yyyy'),(12034,'2018-06-14 00:00:00','said','said','m','luke1@jedi.com','22587454','1987-05-27 00:00:00','10 rue walili elkassam','26000','settat','maroc','jkhkh','kkkk'),(12036,'2018-06-15 12:08:32','nom1','prenom1','h','testingkkk@k.k','','1999-01-01 00:00:00','add','cp','testville','fr','test','yyyy'),(12046,'2018-06-15 16:52:25','guest',NULL,'i','guest12046@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fareva01'),(12047,'2018-06-15 16:55:35','guest',NULL,'i','guest12047@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fareva01'),(12048,'2018-06-16 09:35:13','guest',NULL,'i','guest12048@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12049,'2018-06-16 09:39:00','guest',NULL,'i','guest12049@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12050,'2018-06-16 09:41:06','guest',NULL,'i','guest12050@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12051,'2018-06-16 09:42:00','guest',NULL,'i','guest12051@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12052,'2018-06-16 09:43:59','guest',NULL,'i','guest12052@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12053,'2018-06-16 09:45:57','guest','','i','guest12053@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12056,'2018-06-16 09:53:34','Hally','day','H','mail12056@client.com',NULL,'1987-05-09 00:00:00','10 rue de la route','76000','Rouen','france',NULL,'123456'),(12059,'2018-07-04 00:00:00','nomClient','prenom','E','pasdemail@montest.fr',NULL,'2018-07-04 00:00:00',NULL,NULL,NULL,NULL,NULL,'pas de mot de passe'),(12063,'2018-07-10 15:29:40','guest',NULL,'I','guest12063@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12064,'2018-07-10 16:54:23','guest',NULL,'i','guest12064@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12065,'2018-07-10 16:57:12','guest',NULL,NULL,'guest12065@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12066,'2018-07-10 16:57:28','guest','blabla','i','guest12066@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12068,'2018-07-10 17:13:44','guest',NULL,'i','guest12068@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12069,'2018-07-10 18:13:43','guest',NULL,NULL,'guest12069@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12072,'2018-07-10 18:29:10','guest',NULL,'i','guest12072@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12074,'2018-07-10 18:34:32','guest',NULL,'i','guest12074@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12075,'2018-07-10 18:36:44','guest',NULL,NULL,'guest12075@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12076,'2018-07-11 08:41:23','guest',NULL,NULL,'guest12076@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12077,'2018-07-11 15:46:28','guest',NULL,NULL,'guest12077@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12078,'2018-07-11 16:38:55','guest',NULL,'i','guest12078@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12079,'2018-08-31 10:17:26','leroy','mika','m','admin@go.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin'),(12080,'2018-09-04 19:44:51','guest',NULL,NULL,'guest12080@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12081,'2018-09-04 19:48:19','guest',NULL,NULL,'guest12081@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12082,'2018-09-04 19:48:31','guest',NULL,NULL,'guest12082@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12083,'2018-09-04 19:50:14','guest',NULL,NULL,'guest12083@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12084,'2018-09-04 19:52:55','guest',NULL,NULL,'guest12084@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12085,'2018-09-04 19:53:31','guest',NULL,NULL,'guest12085@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12086,'2018-09-04 19:54:43','guest',NULL,NULL,'guest12086@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12087,'2018-09-04 19:54:57','guest',NULL,NULL,'guest12087@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12088,'2018-09-04 19:59:17','guest',NULL,NULL,'guest12088@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12089,'2018-09-04 19:59:46','guest',NULL,NULL,'guest12089@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12090,'2018-09-04 20:03:16','guest',NULL,NULL,'guest12090@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12091,'2018-09-05 13:05:23','guest',NULL,NULL,'guest12091@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12092,'2018-09-05 13:14:01','guest',NULL,NULL,'guest12092@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12093,'2018-09-05 13:30:18','guest',NULL,NULL,'guest12093@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12094,'2018-09-05 13:31:14','guest',NULL,NULL,'guest12094@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12095,'2018-09-05 13:32:44','guest',NULL,NULL,'guest12095@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12096,'2018-09-05 13:34:08','guest',NULL,NULL,'guest12096@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12097,'2018-09-05 14:36:12','guest',NULL,NULL,'guest12097@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12098,'2018-09-05 15:44:33','guest',NULL,NULL,'guest12098@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12099,'2018-09-06 10:35:11','guest',NULL,NULL,'guest12099@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12100,'2018-09-06 10:41:28','guest',NULL,NULL,'guest12100@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12101,'2018-09-06 10:59:21','guest',NULL,NULL,'guest12101@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12102,'2018-09-06 11:35:53','guest',NULL,NULL,'guest12102@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12103,'2018-09-06 15:42:14','guest',NULL,NULL,'guest12103@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12104,'2018-09-06 15:48:26','guest',NULL,NULL,'guest12104@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12105,'2018-09-06 15:51:29','guest',NULL,NULL,'guest12105@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12106,'2018-09-06 15:55:45','guest',NULL,NULL,'guest12106@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12107,'2018-09-06 15:58:00','guest',NULL,NULL,'guest12107@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12108,'2018-09-06 15:59:32','guest',NULL,NULL,'guest12108@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12109,'2018-09-06 15:59:58','guest',NULL,NULL,'guest12109@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12110,'2018-09-06 16:02:39','guest',NULL,NULL,'guest12110@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12111,'2018-09-06 16:04:09','guest',NULL,NULL,'guest12111@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12112,'2018-09-06 16:06:32','guest',NULL,NULL,'guest12112@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12113,'2018-09-06 16:07:47','guest',NULL,NULL,'guest12113@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12114,'2018-09-06 16:12:44','guest',NULL,NULL,'guest12114@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12115,'2018-09-06 16:14:31','guest',NULL,NULL,'guest12115@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12116,'2018-09-06 16:16:14','guest',NULL,NULL,'guest12116@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12117,'2018-09-06 16:21:21','guest',NULL,NULL,'guest12117@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12118,'2018-09-06 16:23:32','guest',NULL,NULL,'guest12118@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12119,'2018-09-06 16:24:36','guest',NULL,NULL,'guest12119@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12120,'2018-09-06 16:37:10','guest',NULL,NULL,'guest12120@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12121,'2018-09-06 16:39:50','guest',NULL,NULL,'guest12121@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12122,'2018-09-06 16:41:39','guest',NULL,NULL,'guest12122@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12123,'2018-09-07 11:45:44','pierre','paul','m','a@b.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ab'),(12124,'2018-09-11 15:10:11','guestClient',NULL,NULL,'email@bo.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mlkjhgfd'),(12125,'2018-09-11 15:57:37','guest',NULL,NULL,'guest12125@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12126,'2018-09-11 16:04:43','dede','dede','I','testnew@client.fr',NULL,'2018-09-10 00:00:00','edede','deded','dede',NULL,'dedeed','deded'),(12127,'2018-09-12 13:18:20','guest',NULL,NULL,'guest12127@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12128,'2018-09-12 13:30:22','guest',NULL,NULL,'guest12128@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12129,'2018-09-12 14:07:46','guest',NULL,NULL,'guest12129@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12130,'2018-09-12 15:30:30','guest',NULL,NULL,'guest12130@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12131,'2018-09-12 15:31:48','guest',NULL,NULL,'guest12131@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12132,'2018-09-12 15:33:59','guest',NULL,NULL,'guest12132@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12133,'2018-09-12 15:41:30','guest',NULL,NULL,'guest12133@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12134,'2018-09-12 15:44:02','guest',NULL,NULL,'guest12134@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12135,'2018-09-12 15:51:19','guest',NULL,NULL,'guest12135@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12136,'2018-09-12 16:01:39','guest',NULL,NULL,'guest12136@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12137,'2018-09-12 16:31:14','guest',NULL,NULL,'guest12137@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12138,'2018-09-12 16:31:51','guest',NULL,NULL,'guest12138@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12139,'2018-09-12 16:33:25','guest',NULL,NULL,'guest12139@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12140,'2018-09-12 16:36:40','guest',NULL,NULL,'guest12140@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12141,'2018-09-13 10:16:33','guest',NULL,NULL,'guest12141@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12142,'2018-09-13 10:48:51','guest',NULL,NULL,'guest12142@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12143,'2018-09-13 10:52:10','guest',NULL,NULL,'guest12143@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12144,'2018-09-13 11:07:58','guest',NULL,NULL,'guest12144@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12145,'2018-09-13 11:43:01','guest',NULL,NULL,'guest12145@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12146,'2018-09-13 12:00:11','guest',NULL,NULL,'guest12146@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12147,'2018-09-13 14:12:13','guest',NULL,NULL,'guest12147@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12148,'2018-09-13 14:17:01','guest',NULL,NULL,'guest12148@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12149,'2018-09-13 14:48:19','guest',NULL,NULL,'guest12149@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12150,'2018-09-13 15:03:43','guest',NULL,NULL,'guest12150@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12151,'2018-09-13 15:34:20','guest',NULL,NULL,'guest12151@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12152,'2018-09-13 15:37:01','guest',NULL,NULL,'guest12152@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12153,'2018-09-13 15:45:10','guest',NULL,NULL,'guest12153@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12154,'2018-09-13 15:58:32','guest',NULL,NULL,'guest12154@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12155,'2018-09-13 16:00:16','guest',NULL,NULL,'guest12155@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12156,'2018-09-13 16:06:05','guest',NULL,NULL,'guest12156@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12157,'2018-09-13 16:24:48','guest',NULL,NULL,'guest12157@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12158,'2018-09-13 16:34:50','guest',NULL,NULL,'guest12158@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12159,'2018-09-14 12:04:58','guest',NULL,NULL,'guest12159@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12160,'2018-09-14 12:17:04','barbie','kenny','I','client@normal.fr',NULL,'2018-09-13 00:00:00','pas de rue','cp','ville',NULL,NULL,'azerty'),(12161,'2018-09-14 16:46:26','guest',NULL,NULL,'guest12161@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12162,'2018-09-14 16:47:13','erer','ererer','I','aa@bb.fr',NULL,'2018-09-13 00:00:00','jhygtre','hhhh','jhg',NULL,NULL,'azertyuiop'),(12163,'2018-09-17 10:55:44','naissance','naissance','I','naissance@naissance.naissance',NULL,NULL,'naissance','naissance','naissance',NULL,NULL,'naissance'),(12164,'2018-09-17 11:02:13','inputNaissance','inputNaissance','I','inputNaissance@inputNaissance.inputNaissance',NULL,'1978-01-04 00:00:00','inputNaissance','inputNaissance','inputNaissance',NULL,NULL,'inputNaissance'),(12165,'2018-09-17 11:04:37','azerty','azerty','I','azerty@azerty.azerty',NULL,NULL,'azerty','azerty','azerty',NULL,NULL,'azerty'),(12166,'2018-09-17 11:23:21','jjj','jjj','I','jj@jj.Jj',NULL,NULL,'jj','jj','jj',NULL,NULL,'jjj'),(12167,'2018-09-17 11:26:09','dd','dd','I','dd@dd.dd',NULL,'1899-12-31 00:00:00','dd','dd','dd',NULL,NULL,'dd'),(12168,'2018-09-17 11:32:08','popo','popo','I','p@o.po',NULL,'2010-08-11 00:00:00','popo','popo','popo',NULL,NULL,'popo'),(12169,'2018-09-18 14:18:59','guest',NULL,NULL,'guest12169@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12170,'2018-09-18 14:24:15','guest',NULL,NULL,'guest12170@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12171,'2018-09-18 14:26:02','guest',NULL,NULL,'guest12171@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12172,'2018-09-19 15:43:26','guest',NULL,NULL,'guest12172@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12173,'2018-09-19 15:44:18','guest',NULL,NULL,'guest12173@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01'),(12174,'2018-09-20 11:22:16','nom','prenom','I','plantage@cmd.fr',NULL,'1899-12-31 00:00:00','adresse','cp','ville',NULL,'plantage commande','plantage'),(12175,'2018-09-20 14:15:49','guest',NULL,NULL,'guest12175@monsite.fr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Site01');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_after_insertion_client after insert on client
for each row
/*objectif : remplir la table histo client après une création
			 d'un client soit en guest soit en création de compte
*/
begin
	declare id_verif_mail int;
    set id_verif_mail = fx_verif_mail(new.mail_client);
	case id_verif_mail #en fonction du statut du mail, insertion histo client en 1:guest ou 2:classic
		when 0 then 
			#format mail non respecté
			signal sqlstate 'EL000' set MYSQL_ERRNO=60001, MESSAGE_TEXT = "erreur logiciel";
            
        when 1 then
			#nouveau client ayant crée un compte, statut en classic
			insert into histo_client(date_chg_statut, id_statut_client, id_client) values
			(now(), 2, new.id_client);
        
        when 2 then
			#nouveau client inconnu, statut en guest
			insert into histo_client(date_chg_statut, id_statut_client, id_client) values
			(now(), 1, new.id_client);
		else 
			#format mail indéterminé
			signal sqlstate 'EL000' set MYSQL_ERRNO=60002, MESSAGE_TEXT = "erreur logiciel";
    end case;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_before_delete_client before delete on client
for each row
/*objectif : autoriser la suppression d'un client ayant un statut guest
			 suppression dans histo_client
             suppression dans commande
*/
begin
	declare StatutMaxHisto int;

	-- recupère le nombre de fois ou l\'id du client est > 1
    set StatutMaxHisto = (Select max(histo_client.id_statut_client) from histo_client where histo_client.id_client = old.id_client);

    if (StatutMaxHisto = 1) then
		-- suppression dans histo_client
		delete from histo_client
        where histo_client.id_client = old.id_client;
        
        -- suppression dans commande
        delete from commande
        where old.id_client = commande.id_client;

    end if;
    
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `remise_globale` decimal(5,4) DEFAULT NULL,
  `date_creation_commande` datetime DEFAULT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `FK_commande_id_client` (`id_client`),
  CONSTRAINT `FK_commande_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=123546 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,0.0000,'2018-06-11 00:00:00',71),(2,0.1000,'2018-06-12 00:00:00',74),(3,0.2000,'2018-06-12 00:00:00',72),(10,0.0000,'2018-06-12 13:00:00',13),(11,0.0000,'2016-08-22 22:30:00',14),(12,0.0000,'2017-10-10 10:21:00',10),(13,0.0000,'2015-02-21 09:03:00',11),(25,0.0500,'2018-05-27 00:00:00',21),(26,0.0500,'2018-06-12 00:00:00',22),(27,0.0000,'2017-12-10 00:00:00',24),(30,0.0000,'2018-05-14 00:00:00',33),(31,0.0000,'2018-06-01 00:00:00',30),(32,0.0000,'2018-03-18 00:00:00',31),(33,0.0000,'2017-02-16 00:00:00',34),(34,0.0000,'2018-01-28 00:00:00',32),(60,0.0000,'2018-10-05 00:00:00',60),(61,0.0000,'2018-10-05 00:00:00',62),(80,NULL,'2017-05-26 14:00:15',80),(81,NULL,'2017-06-26 14:00:15',84),(82,NULL,'2018-02-20 14:25:54',82),(100,0.0000,'2017-11-11 17:00:00',100),(110,0.2000,'2018-01-02 23:17:32',110),(111,0.0000,'2018-06-12 01:12:13',114),(130,0.1500,'2018-01-02 02:05:23',130),(131,0.0000,'2018-01-15 15:26:32',130),(132,0.2000,'2018-01-31 09:25:32',131),(133,0.0000,'2018-02-01 07:54:28',131),(134,0.0000,'2018-02-01 09:12:25',132),(135,0.0000,'2018-03-01 22:53:29',133),(136,0.0000,'2018-03-15 13:58:55',133),(137,0.1500,'2018-03-25 17:25:49',133),(138,0.0000,'2018-04-06 22:59:38',134),(139,0.2000,'2018-04-13 21:20:33',12079),(140,0.0000,'2018-06-12 00:00:00',140),(141,0.0000,'2018-06-12 00:00:00',141),(12010,NULL,'2018-06-11 00:00:00',12010),(12011,NULL,'2018-06-12 00:00:00',12011),(12012,NULL,'2018-01-01 00:00:00',12012),(12013,NULL,'2018-02-01 00:00:00',12012),(12014,NULL,'2018-06-06 00:00:00',12010),(12345,9.9999,'2018-06-12 00:00:00',51),(123456,9.9999,'2018-06-12 00:00:00',52),(123457,0.0000,'2018-06-15 11:26:13',110),(123462,0.0000,'2018-07-10 17:13:44',12068),(123465,0.0000,'2018-07-10 18:29:10',12072),(123466,0.0000,'2018-07-10 18:34:32',12074),(123467,0.0000,'2018-07-10 18:36:44',12075),(123468,0.0000,'2018-07-11 08:41:23',12076),(123469,0.0000,'2018-07-11 15:46:30',12077),(123470,0.0000,'2018-07-11 16:38:59',12078),(123471,0.0000,'2018-09-06 15:42:14',12103),(123472,0.0000,'2018-09-06 15:48:26',12104),(123473,0.0000,'2018-09-06 15:51:29',12105),(123474,0.0000,'2018-09-06 15:55:45',12106),(123475,0.0000,'2018-09-06 15:58:00',12107),(123476,0.0000,'2018-09-06 15:59:33',12108),(123477,0.0000,'2018-09-06 15:59:58',12109),(123478,0.0000,'2018-09-06 16:02:40',12110),(123479,0.0000,'2018-09-06 16:04:09',12111),(123480,0.0000,'2018-09-06 16:06:32',12112),(123481,0.0000,'2018-09-06 16:07:47',12113),(123482,0.0000,'2018-09-06 16:12:44',12114),(123483,0.0000,'2018-09-06 16:14:31',12115),(123484,0.0000,'2018-09-06 16:16:14',12116),(123485,0.0000,'2018-09-06 16:21:21',12117),(123486,0.0000,'2018-09-06 16:23:32',12118),(123487,0.0000,'2018-09-06 16:24:36',12119),(123488,0.0000,'2018-09-06 16:37:10',12120),(123489,0.0000,'2018-09-06 16:39:50',12121),(123490,0.0000,'2018-09-06 16:41:39',12122),(123491,0.1000,'2018-09-07 11:45:44',12123),(123492,0.0000,'2018-09-11 15:57:37',12125),(123493,0.0000,'2018-09-11 16:04:43',12126),(123494,0.0000,'2018-09-12 13:18:20',12127),(123495,0.0000,'2018-09-12 13:30:22',12128),(123496,0.0000,'2018-09-12 14:07:46',12129),(123497,0.0000,'2018-09-12 15:30:30',12130),(123498,0.0000,'2018-09-12 15:31:48',12131),(123499,0.0000,'2018-09-12 15:33:59',12132),(123500,0.0000,'2018-09-12 15:41:30',12133),(123501,0.0000,'2018-09-12 15:44:02',12134),(123502,0.0000,'2018-09-12 15:51:19',12135),(123503,0.0000,'2018-09-12 16:01:39',12136),(123504,0.0000,'2018-09-12 16:31:14',12137),(123505,0.0000,'2018-09-12 16:31:51',12138),(123506,0.0000,'2018-09-12 16:33:25',12139),(123507,0.0000,'2018-09-12 16:36:40',12140),(123508,0.0000,'2018-09-13 10:16:33',12141),(123509,0.0000,'2018-09-13 10:48:51',12142),(123510,0.0000,'2018-09-13 10:52:10',12143),(123511,0.0000,'2018-09-13 11:07:58',12144),(123512,0.0000,'2018-09-13 11:43:01',12145),(123513,0.0000,'2018-09-13 12:00:11',12146),(123514,0.0000,'2018-09-13 14:12:13',12147),(123515,0.0000,'2018-09-13 14:17:01',12148),(123516,0.0000,'2018-09-13 14:48:19',12149),(123517,0.0000,'2018-09-13 15:03:43',12150),(123518,0.0000,'2018-09-13 15:34:20',12151),(123519,0.0000,'2018-09-13 15:37:01',12152),(123520,0.1000,'2018-09-13 15:45:10',12153),(123521,0.1000,'2018-09-13 15:58:32',12154),(123522,0.1000,'2018-09-13 16:00:16',12155),(123523,0.1000,'2018-09-13 16:06:05',12156),(123524,0.1000,'2018-09-13 16:24:48',12157),(123525,0.0000,'2018-09-13 16:34:50',12158),(123526,0.0000,'2018-09-14 12:04:58',12159),(123527,0.1000,'2018-09-14 12:17:04',12160),(123528,0.0000,'2018-09-14 16:46:26',12161),(123529,0.1000,'2018-09-14 16:47:13',12162),(123530,0.0000,'2018-09-17 10:55:45',12163),(123531,0.0000,'2018-09-17 11:02:13',12164),(123532,0.0000,'2018-09-17 11:04:37',12165),(123533,0.0000,'2018-09-17 11:23:21',12166),(123534,0.0000,'2018-09-17 11:26:09',12167),(123535,0.0000,'2018-09-17 11:32:08',12168),(123536,0.0000,'2018-09-18 14:18:59',12169),(123537,0.0000,'2018-09-18 14:24:15',12170),(123538,0.0000,'2018-09-18 14:26:02',12171),(123539,0.0000,'2018-09-19 15:43:26',12172),(123540,0.0000,'2018-09-19 15:44:18',12173),(123541,0.0000,'2018-09-20 10:24:55',12160),(123542,0.1000,'2018-09-20 10:25:28',12160),(123543,0.1000,'2018-09-20 10:56:19',12160),(123545,0.0000,'2018-09-20 14:15:49',12175);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_after_insertion_commande after insert on commande
/* Objectif : Création d'un lien entre la nouvelle commande et son statut
*/
for each row
begin
	# creation d'un lien entre commande et son nouveau statut
	insert into histo_commande(date_chg_statut, id_statut_commande, id_commande) values
    (now(), 1, new.id_commande);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_before_delete_commande before delete on commande
for each row
/*objectif : suppression dans histo commande 
			 suppression dans commande_produit
             pour autoriser la suppression de la commande
*/
begin
        delete from histo_commande
        where old.id_commande = histo_commande.id_commande;
        
        delete from commande_produit
        where old.id_commande = commande_produit.id_commande;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande_produit` (
  `quantite_produit` int(11) NOT NULL,
  `prix_HT_unitaire_debut` decimal(15,3) DEFAULT NULL,
  `remise_appliquee` decimal(5,4) NOT NULL,
  `tva_appliquee` decimal(5,4) NOT NULL,
  `prix_TTC_unitaire_final` decimal(15,2) DEFAULT NULL,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `FK_commande_produit_id_produit` (`id_produit`),
  CONSTRAINT `FK_commande_produit_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  CONSTRAINT `FK_commande_produit_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_produit`
--

LOCK TABLES `commande_produit` WRITE;
/*!40000 ALTER TABLE `commande_produit` DISABLE KEYS */;
INSERT INTO `commande_produit` VALUES (5,50.111,0.0000,0.0550,52.87,1,16),(5,NULL,0.0000,0.0000,10.90,1,70),(10,9.990,0.0000,0.0550,10.54,1,71),(1,NULL,0.1000,0.0000,50.00,1,75),(5,54.250,0.0000,0.2000,65.10,1,130),(1,NULL,0.0000,0.0000,9.00,2,78),(4,NULL,0.1000,0.0000,13.00,3,79),(5,NULL,0.0000,0.0000,14.99,25,22),(4,NULL,0.0000,0.0000,16.90,26,26),(2,NULL,0.0000,0.0000,44.49,27,24),(3,NULL,0.0600,0.0000,35.72,30,33),(2,NULL,0.0000,0.0000,144.00,31,34),(5,NULL,0.0000,0.0000,116.05,32,30),(3,NULL,0.0000,0.0000,108.00,33,31),(1,NULL,0.0000,0.0000,15.75,34,36),(3,NULL,0.0000,0.0000,111.24,60,60),(25,NULL,0.0000,0.0000,250.00,61,61),(1,NULL,0.0000,0.0000,19.20,80,87),(1,NULL,0.0000,0.0000,24.00,80,88),(2,NULL,0.0000,0.0000,168.00,81,85),(1,NULL,0.0000,0.0000,12.00,82,80),(1,NULL,0.0000,0.0000,7.39,82,82),(1,NULL,0.0000,0.0000,15.00,82,83),(1,NULL,0.0000,0.0000,14.40,82,84),(2,NULL,0.0000,0.0000,12.00,100,104),(4,NULL,0.0000,0.0000,12.00,100,106),(1,NULL,0.0000,0.0000,9.00,110,113),(1,NULL,0.0000,0.0000,9.00,110,115),(3,NULL,0.0000,0.0000,1300.00,111,110),(1,NULL,0.0000,0.0000,54.25,130,131),(1,NULL,0.0000,0.0000,45.90,130,134),(1,NULL,0.0000,0.0000,45.90,131,134),(2,NULL,0.0000,0.0000,21.65,131,138),(1,NULL,0.0000,0.0000,45.90,131,139),(1,NULL,0.0000,0.0000,13.20,132,132),(1,NULL,0.0000,0.0000,25.90,133,136),(1,NULL,0.0000,0.0000,54.25,134,130),(1,NULL,0.0000,0.0000,25.60,134,132),(1,NULL,0.0000,0.0000,12.85,135,133),(1,NULL,0.0000,0.0000,25.90,136,135),(1,NULL,0.0000,0.0000,12.90,137,137),(2,NULL,0.0000,0.0000,21.65,137,138),(1,NULL,0.0000,0.0000,25.90,138,135),(1,NULL,0.0000,0.0000,18.90,138,136),(5,NULL,0.0000,0.0000,NULL,12010,12010),(1,NULL,0.0000,0.0000,NULL,12010,12011),(12,NULL,0.0000,0.0000,NULL,12010,12013),(3,NULL,0.0000,0.0000,NULL,12013,12010),(6,NULL,0.0000,0.0000,NULL,12013,12012),(2,NULL,0.0000,0.0000,NULL,12014,12010),(1,55.000,0.0000,0.0550,58.03,123472,13),(1,50.111,0.0000,0.0550,52.87,123473,16),(1,30.000,0.0000,0.2000,36.00,123474,15),(2,55.000,0.0000,0.0550,58.03,123475,13),(1,30.000,0.0000,0.2000,36.00,123476,15),(1,24.000,0.0000,0.2000,28.80,123477,17),(1,30.000,0.0000,0.2000,36.00,123478,15),(1,30.000,0.0000,0.2000,36.00,123479,11),(1,30.000,0.0000,0.2000,36.00,123480,11),(1,19.000,0.0000,0.2000,22.80,123481,10),(1,30.000,0.0000,0.2000,36.00,123481,11),(1,22.000,0.0000,0.2000,26.40,123481,12),(8,55.000,0.0000,0.0550,58.03,123481,13),(1,25.000,0.0000,0.2000,30.00,123481,14),(1,22.000,0.0000,0.2000,26.40,123482,12),(1,25.000,0.0000,0.2000,30.00,123483,14),(1,30.000,0.0000,0.2000,36.00,123484,11),(1,19.000,0.0000,0.2000,22.80,123485,10),(1,30.000,0.0000,0.2000,36.00,123485,11),(1,25.000,0.0000,0.2000,30.00,123485,14),(1,25.000,0.0000,0.2000,30.00,123486,14),(3,30.000,0.0000,0.2000,36.00,123487,11),(1,22.000,0.0000,0.2000,26.40,123487,12),(1,30.000,0.0000,0.2000,36.00,123487,15),(4,22.000,0.0000,0.2000,26.40,123488,12),(1,55.000,0.0000,0.0550,58.03,123488,13),(1,19.000,0.0000,0.2000,22.80,123489,10),(1,30.000,0.0000,0.2000,36.00,123489,11),(3,22.000,0.0000,0.2000,26.40,123489,12),(4,30.000,0.0000,0.2000,36.00,123490,11),(1,25.000,0.0000,0.2000,30.00,123490,14),(6,19.000,0.0000,0.2000,22.80,123491,10),(3,30.000,0.0000,0.2000,36.00,123491,11),(12,22.000,0.1500,0.2000,22.44,123491,12),(2,25.000,0.0000,0.2000,30.00,123491,14),(1,89.900,0.0000,0.2000,107.88,123491,58),(1,55.000,0.0000,0.0550,58.03,123492,13),(1,55.000,0.0000,0.0550,58.03,123493,13),(2,19.000,0.0000,0.2000,22.80,123494,10),(1,22.000,0.0000,0.2000,26.40,123495,12),(1,30.000,0.0000,0.2000,36.00,123496,11),(1,25.000,0.0000,0.2000,30.00,123497,14),(3,55.000,0.0000,0.0550,58.03,123498,13),(1,19.000,0.0000,0.2000,22.80,123499,10),(1,30.000,0.0000,0.2000,36.00,123500,11),(1,22.000,0.0000,0.2000,26.40,123501,12),(2,19.000,0.0000,0.2000,22.80,123502,10),(1,22.000,0.0000,0.2000,26.40,123502,12),(1,55.000,0.0000,0.0550,58.03,123503,13),(1,30.000,0.0000,0.2000,36.00,123504,11),(1,19.000,0.0000,0.2000,22.80,123505,10),(1,22.000,0.0000,0.2000,26.40,123506,12),(1,30.000,0.0000,0.2000,36.00,123507,11),(2,19.000,0.0000,0.2000,22.80,123508,10),(1,19.000,0.0000,0.2000,22.80,123509,10),(1,30.000,0.0000,0.2000,36.00,123509,11),(1,22.000,0.0000,0.2000,26.40,123509,12),(2,19.000,0.0000,0.2000,22.80,123510,10),(1,30.000,0.0000,0.2000,36.00,123510,11),(2,22.000,0.0000,0.2000,26.40,123510,12),(1,19.000,0.0000,0.2000,22.80,123511,10),(1,30.000,0.0000,0.2000,36.00,123512,11),(333,22.000,0.0000,0.2000,26.40,123512,16),(1,19.000,0.0000,0.2000,22.80,123513,10),(5,22.000,0.0000,0.2000,26.40,123513,12),(1,22.000,0.0000,0.2000,26.40,123514,12),(1,19.000,0.0000,0.2000,22.80,123515,10),(1,22.000,0.0000,0.2000,26.40,123516,12),(2,19.000,0.0000,0.2000,22.80,123517,10),(1,30.000,0.0000,0.2000,36.00,123517,11),(1,22.000,0.0000,0.2000,26.40,123517,12),(1,25.000,0.0000,0.2000,30.00,123517,14),(2,22.000,0.0000,0.2000,26.40,123518,12),(1,22.000,0.0000,0.2000,26.40,123519,12),(1,22.000,0.0000,0.2000,26.40,123521,12),(2,30.000,0.0000,0.2000,36.00,123521,15),(2,30.000,0.0000,0.2000,36.00,123522,11),(1,22.000,0.1500,0.2000,26.22,123522,12),(1,55.000,0.0000,0.0550,58.03,123522,13),(3,30.000,0.0000,0.2000,36.00,123523,11),(1,22.000,0.1500,0.2000,22.44,123523,12),(3,30.000,0.0000,0.2000,36.00,123524,11),(3,22.000,0.1500,0.2000,22.44,123524,12),(1,30.000,0.0000,0.2000,36.00,123525,15),(1,1998.990,0.0000,0.2000,2398.79,123525,50),(6,30.000,0.0000,0.2000,36.00,123526,11),(1,19.000,0.0000,0.2000,22.80,123527,10),(2,30.000,0.0000,0.2000,36.00,123527,11),(1,22.000,0.1500,0.2000,22.44,123527,12),(3,19.000,0.0000,0.2000,22.80,123528,10),(3,30.000,0.0000,0.2000,36.00,123528,11),(5,22.000,0.0000,0.2000,26.40,123528,12),(3,19.000,0.0000,0.2000,22.80,123529,10),(300,30.000,0.0000,0.2000,36.00,123529,11),(50,22.000,0.1500,0.2000,22.44,123529,12),(1,19.000,0.0000,0.2000,22.80,123536,10),(99,19.000,0.0000,0.2000,22.80,123537,10),(99,19.000,0.0000,0.2000,22.80,123538,10),(3,22.000,0.0000,0.2000,26.40,123539,12),(2,19.000,0.0000,0.2000,22.80,123540,10),(1,30.000,0.0000,0.2000,36.00,123541,15),(1,49.990,0.0000,0.2000,59.99,123541,23),(5,22.000,0.0000,0.2000,26.40,123542,30),(1,22.000,0.0000,0.2000,26.40,123543,12),(9,55.000,0.0000,0.0550,58.03,123543,13),(5,55.000,0.0000,0.0550,58.03,123545,13);
/*!40000 ALTER TABLE `commande_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_message`
--

DROP TABLE IF EXISTS `error_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_message` (
  `iderror_message` int(11) NOT NULL AUTO_INCREMENT,
  `FR_lib` varchar(255) DEFAULT NULL,
  `concerne` varchar(45) DEFAULT NULL,
  `commentaire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iderror_message`)
) ENGINE=InnoDB AUTO_INCREMENT=60061 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_message`
--

LOCK TABLES `error_message` WRITE;
/*!40000 ALTER TABLE `error_message` DISABLE KEYS */;
INSERT INTO `error_message` VALUES (60000,'l\'adresse mail existe déjà','adresse mail','doublon'),(60001,'le format de l\'adresse mail n\'est pas valide','adresse mail','format non respecté'),(60002,'le format de l\'adresse mail n\'a pas pu être déterminé','adresse mail','format non respecté'),(60003,'l\'adresse mail n\'a pas été renseignée','adresse mail','valeur null'),(60010,'l\'élément n\'a pas pu être supprimé car ce n\'est pas un compte guest, il fait parti de l\'historique','suppression client','clef étrangère'),(60011,'l\'élément à supprimer n\'a pas été trouvé dans la base de données','suppression client','id non présent'),(60012,'l\'élément n\'a pas pu être supprimé car il est lié à plusieurs clients','suppression client','clef étrangère'),(60013,'ce fournisseur ne peut pas être supprimé car il a déjà un historique de commande présent dans la base de donnée','supression fournisseur','clef étrangère'),(60020,'l\'id client n\'est pas reconnu par la base de donnée','commande','id non présent'),(60021,'ce fournisseur n\'existe pas, il n\'est pas reconnu dans la base de donnée','fournisseur','id non présent'),(60030,'ce genre n\'est pas compatible avec ce produit','fonction prodGenreProd','fx=0'),(60031,'ce genre n\'a pas été reconnu, est il présent dans la BDD?','fonction prodGenreProd','fx=-1'),(60032,'ce type n\'a pas été reconnu, est il présent dans la BDD?','fonction prodGenreProd','fx=-2'),(60033,'une erreur est survenu lors de la vérification de la compatibilité genre/type produit, veuillez contacter votre administrateur','fonction prodGenreProd','fx=?'),(60034,'ce produit n\'est pas présent dans la base de donnée','ps_prodGenreProd','id produit introuvable'),(60035,'ce type à déjà été ajouté à ce produit','ps_prodGenreProd','doublon id composée'),(60040,'Ce panier à déjà plusieurs référence de ce produit, veuillez contacter votre administrateur','ps_panier_ajoutProduit','clef idc et idp en double'),(60041,'la quantité à ajouter est négative, l\'ajout est donc annulé','ps_panier_ajoutProduit','quantité ajouté négative'),(60042,'le produit à ajouter au panier n\'existe pas dans la base de données','ps_panier_ajoutProduit','id produit introuvable'),(60043,'Le numéro de commande n\'est pas reconnu','ps_panier_ajoutProduit','id commande introuvable'),(60044,'Le statut de la commande n\'a pas pu être déterminé','ps_panier_ajoutProduit','idstatut commande = null'),(60045,'Cette commande à déjà été finalisée (payée)','ps_panier_ajoutProduit','id statut > 2'),(60050,'Le statut du client n\'a pas été trouvé dans la base de données, les données de ce compte sont corrompues','ps_dernierStatut','id client = null'),(60060,'Le numéro de commande n\'a pas pu être récupéré','ps_panier_getcommandefromclient','id commande = -1 ou null');
/*!40000 ALTER TABLE `error_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(255) NOT NULL,
  `mail_fournisseur` varchar(255) DEFAULT NULL,
  `adresse_fournisseur` varchar(255) DEFAULT NULL,
  `code_postal_fournisseur` varchar(255) DEFAULT NULL,
  `ville_fournisseur` varchar(255) DEFAULT NULL,
  `pays_fournisseur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=12018 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (10,'sous_le_manteau','manteau@gmail.com','3 rue lafayette','75000','Paris','France'),(11,'dvd_dealer','dvd@dealer.com','5 queen street','25483','Londres','Royaume uni'),(12,'livre_en_stock','livre@stock.com','3 chemin de la page','76000','Rouen','France'),(20,'CVS','cvs@aol.com','6-8 Rue Gaston Lauriau ','93100','MONTREUIL','France'),(21,'GAM','infogam@gamannecy.com','2 rue du Lac - BP. 298','74008','ANNECY Cedex','France'),(22,'SDP LE LIVRE CLUB','d.michelas@lelivreclub.fr','164 Rue Ambroise Paré','30900',' Nîmes','France'),(30,'Replay Multimedia','info@replaymultimedia.com','126, rue Landy','93400','Saint-Ouen','France'),(31,'ABYSSE CORP','bourez@abyssecorp.com','52 Quai Gaston Boulet','76000','Rouen','France'),(32,'Arcades','contact@arcadesdirect.fr','Parc du château de Lancosme','36500','Vendoeuvres','France'),(50,'CockPorn','contact@cockporn.com','rue du général de Gaulle','95130','Paris','Espagne'),(51,'PopCorn','contact@popcorn.com','rue du maïs','27000','Elbeuf','USA'),(52,'KornFlex','contact@kornflex.com','quai henri IV','76200','Dieppe','Madagascar'),(60,'PRÉSIDENT PRESCOTT','onvatouslesbutés@crève.com','10 rue de la guerre','78954','azura','terra'),(61,'Stark Industries','jesuislemeilleur@desavengers.com','20 allée de la pègre','45612','new york','USA'),(62,'Geralt de Riv','jesuisbestofsorceleur@ettombeurdecesdames.wisima','pas de rue(vagabond)','99999','wizima','Pologne'),(70,'cdjapan','cdjapan@mail.jp','34 tokyo blouvelvard','120277','TOKYO','JAPON'),(71,'nihonbox','nihonbox@mail.jp','145 kyoto street','140287','KYOTO','JAPON'),(72,'noVinyl','noVinyl@mail.FR','1 rue sans vinyl','75000','PARIS','FRANCE'),(80,'FoureTout','fourtout@livraison.fr','35 rue de la livraison','75000','Paris','France'),(81,'Alladin','alladin@gmail.com','ru du tapis volant','0','Agraba','Egypte'),(82,'ratatouille','ratata@rat.fr','rue du restaurant','76000','Rouen','France'),(100,'BROKEN_FOUNDRY','brokenf@bf_co.com','120 rue casse','65478','FORNA','Noland'),(101,'BRAZIERE_GAMES','BraziereGames@BG.com','124 rue casse','65478','FORNA','Noland'),(102,'THAUMATURGE_SYGN','ThaumaturgeSygn@caster.com','128 rue casse','65478','FORNA','Noland'),(110,'techno-folies','boutiqueTF@orange.fr','56 avenue de la rue de paris','95000','paris','fr'),(115,'benJ','benJ@porno.fr','afpa','76000','rouen','fr'),(119,'dorothée club','asBin@nostalgique.com','10 ZI du fourre tout','2569','hyère','fr'),(130,'castagnette','hgbn@hotmail.com','26 rue violette','36520','ladune','france'),(131,'lord wx','resz@gb.net','13 eastern road','3542','london','angleterre'),(132,'xs import','kjuy@mail.com','96 blvd mao','5648','pekin','chine'),(12010,'AFPA','contact@afpa.fr','zone le Madrillet','76000','Saint-Etienne du rouvray','France'),(12011,'Fongecif','contact@fogecif.fr','inconnue','76000','Rouen','France'),(12012,'Pôle emploi','nePasContacter@poleEmploi.fr','partout','76190','Yvetot','France'),(12015,'nom','mail@service.com','adresse','codepostal','ville','pays'),(12016,'FoureTout','fourtout@livraison.fr','35 rue de la livraison','75000','Paris','France'),(12017,'nom','mail@service.com','adresse','codepostal','ville','pays');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_after_insertion_fournisseur after insert on fournisseur
/* Objectif : Création d'un lien entre le nouveau fournisseur et son statut (1 : actif par défaut)
*/
for each row
begin
	# creation du lien
	insert into histo_fournisseur(date_chg_statut, id_statut_fournisseur, id_fournisseur) values
    (now(), 1, new.id_fournisseur);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_before_delete_fournisseur before delete on fournisseur
/* Objectif : suppression de la clef étrangère dans histo_fournisseur

condition : ne pas avoir de référence dans histo_prix_fournisseur
			(contrainte géré par ps_commande_delete)
*/
for each row
begin
	# suppression de l'historique histo_fournisseur
    delete from histo_fournisseur
	where old.id_fournisseur = histo_fournisseur.id_fournisseur;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genre_produit`
--

DROP TABLE IF EXISTS `genre_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_produit` (
  `id_genre_produit` int(11) NOT NULL AUTO_INCREMENT,
  `lib_genre_produit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_genre_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_produit`
--

LOCK TABLES `genre_produit` WRITE;
/*!40000 ALTER TABLE `genre_produit` DISABLE KEYS */;
INSERT INTO `genre_produit` VALUES (1,'action'),(2,'science fiction'),(3,'romance'),(4,'peplum'),(5,'policier'),(6,'porno'),(7,'horreur'),(8,'animalier'),(9,'fantastique'),(10,'rock'),(11,'metal'),(12,'classic'),(13,'rap');
/*!40000 ALTER TABLE `genre_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histo_client`
--

DROP TABLE IF EXISTS `histo_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histo_client` (
  `date_chg_statut` datetime NOT NULL,
  `id_statut_client` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id_statut_client`,`id_client`,`date_chg_statut`),
  KEY `FK_histo_client_id_client` (`id_client`),
  CONSTRAINT `FK_histo_client_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FK_histo_client_id_statut_client` FOREIGN KEY (`id_statut_client`) REFERENCES `statut_client` (`id_statut_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histo_client`
--

LOCK TABLES `histo_client` WRITE;
/*!40000 ALTER TABLE `histo_client` DISABLE KEYS */;
INSERT INTO `histo_client` VALUES ('2015-06-12 00:00:00',2,20),('2016-07-14 00:00:00',2,21),('2018-01-02 00:00:00',3,22),('2015-05-14 00:00:00',2,23),('2014-05-13 00:00:00',2,24),('2017-05-19 00:00:00',1,30),('2015-09-30 00:00:00',2,31),('2014-05-28 00:00:00',3,32),('2014-06-24 00:00:00',4,33),('2018-04-18 00:00:00',2,34),('2018-05-17 00:00:00',2,50),('2018-05-12 00:00:00',1,51),('2018-05-05 00:00:00',2,52),('2018-05-25 00:00:00',2,53),('2018-05-16 00:00:00',1,54),('1995-10-25 00:00:00',3,60),('2010-10-12 00:00:00',2,61),('2013-10-12 00:00:00',4,62),('2016-10-12 00:00:00',2,63),('2017-10-12 00:00:00',4,64),('2017-08-09 00:00:00',2,70),('2018-04-02 00:00:00',2,71),('1900-05-17 00:00:00',1,72),('1987-10-12 00:00:00',3,73),('1996-12-03 00:00:00',4,74),('2017-06-15 15:24:35',2,80),('2017-09-15 15:24:35',3,80),('2016-03-14 12:35:59',2,81),('2018-05-15 22:02:45',4,81),('2018-01-27 23:59:14',2,82),('2017-05-26 00:03:57',2,83),('2016-07-09 15:56:47',2,84),('2017-07-09 15:56:47',3,84),('2017-11-11 00:00:00',2,100),('2017-11-11 00:00:00',2,101),('2017-11-11 00:00:00',2,102),('2017-11-11 00:00:00',2,103),('2017-11-11 00:00:00',2,104),('0000-00-00 00:00:00',130,2018),('0000-00-00 00:00:00',131,2018),('0000-00-00 00:00:00',132,2018),('0000-00-00 00:00:00',133,2018),('0000-00-00 00:00:00',134,2018),('2018-06-06 00:00:00',2,12010),('2018-02-02 00:00:00',2,12011),('2018-05-05 00:00:00',4,12011),('2018-06-15 12:08:32',1,12036),('2018-06-15 16:52:25',1,12046),('2018-06-15 16:55:35',1,12047),('2018-06-16 09:35:13',1,12048),('2018-06-16 09:39:00',1,12049),('2018-06-16 09:41:06',1,12050),('2018-06-16 09:42:00',1,12051),('2018-06-16 09:43:59',1,12052),('2018-06-16 09:53:34',2,12056),('2018-07-04 11:29:35',2,12059),('2018-07-10 15:29:40',1,12063),('2018-07-10 16:54:23',1,12064),('2018-07-10 16:57:12',1,12065),('2018-07-10 16:57:28',1,12066),('2018-07-10 17:13:44',1,12068),('2018-07-10 18:13:43',1,12069),('2018-07-10 18:29:10',1,12072),('2018-07-10 18:34:32',1,12074),('2018-07-10 18:36:44',1,12075),('2018-07-11 08:41:23',1,12076),('2018-07-11 15:46:28',1,12077),('2018-07-11 16:38:55',1,12078),('2018-08-31 10:17:26',5,12079),('2018-09-04 19:44:51',1,12080),('2018-09-04 19:48:19',1,12081),('2018-09-04 19:48:31',1,12082),('2018-09-04 19:50:14',1,12083),('2018-09-04 19:52:55',1,12084),('2018-09-04 19:53:31',1,12085),('2018-09-04 19:54:43',1,12086),('2018-09-04 19:54:57',1,12087),('2018-09-04 19:59:17',1,12088),('2018-09-04 19:59:46',1,12089),('2018-09-04 20:03:16',1,12090),('2018-09-05 13:05:23',1,12091),('2018-09-05 13:14:01',1,12092),('2018-09-05 13:30:18',1,12093),('2018-09-05 13:31:14',1,12094),('2018-09-05 13:32:44',1,12095),('2018-09-05 13:34:08',1,12096),('2018-09-05 14:36:12',1,12097),('2018-09-05 15:44:33',1,12098),('2018-09-06 10:35:11',1,12099),('2018-09-06 10:41:28',1,12100),('2018-09-06 10:59:21',1,12101),('2018-09-06 11:35:53',1,12102),('2018-09-06 15:42:14',1,12103),('2018-09-06 15:48:26',1,12104),('2018-09-06 15:51:29',1,12105),('2018-09-06 15:55:45',1,12106),('2018-09-06 15:58:00',1,12107),('2018-09-06 15:59:32',1,12108),('2018-09-06 15:59:58',1,12109),('2018-09-06 16:02:39',1,12110),('2018-09-06 16:04:09',1,12111),('2018-09-06 16:06:32',1,12112),('2018-09-06 16:07:47',1,12113),('2018-09-06 16:12:44',1,12114),('2018-09-06 16:14:31',1,12115),('2018-09-06 16:16:14',1,12116),('2018-09-06 16:21:21',1,12117),('2018-09-06 16:23:32',1,12118),('2018-09-06 16:24:36',1,12119),('2018-09-06 16:37:10',1,12120),('2018-09-06 16:39:50',1,12121),('2018-09-06 16:41:39',1,12122),('2018-09-07 11:45:44',1,12123),('2018-09-07 14:45:44',2,12123),('2018-09-11 15:10:11',2,12124),('2018-09-11 15:57:37',1,12125),('2018-09-11 16:04:43',2,12126),('2018-09-12 13:18:20',1,12127),('2018-09-12 13:30:22',1,12128),('2018-09-12 14:07:46',1,12129),('2018-09-12 15:30:30',1,12130),('2018-09-12 15:31:48',1,12131),('2018-09-12 15:33:59',1,12132),('2018-09-12 15:41:30',1,12133),('2018-09-12 15:44:02',1,12134),('2018-09-12 15:51:19',1,12135),('2018-09-12 16:01:39',1,12136),('2018-09-12 16:31:14',1,12137),('2018-09-12 16:31:51',1,12138),('2018-09-12 16:33:25',1,12139),('2018-09-12 16:36:40',1,12140),('2018-09-13 10:16:33',1,12141),('2018-09-13 10:48:51',1,12142),('2018-09-13 10:52:10',1,12143),('2018-09-13 11:07:58',1,12144),('2018-09-13 11:43:01',1,12145),('2018-09-13 12:00:11',1,12146),('2018-09-13 14:12:13',1,12147),('2018-09-13 14:17:01',1,12148),('2018-09-13 14:48:19',1,12149),('2018-09-13 15:03:43',1,12150),('2018-09-13 15:34:20',1,12151),('2018-09-13 15:37:01',1,12152),('2018-09-13 15:45:10',1,12153),('2018-09-13 15:58:32',1,12154),('2018-09-13 16:00:16',1,12155),('2018-09-13 16:06:05',1,12156),('2018-09-13 16:24:48',1,12157),('2018-09-13 16:34:50',1,12158),('2018-09-14 12:04:58',1,12159),('2018-09-14 12:17:04',2,12160),('2018-09-14 16:46:26',1,12161),('2018-09-14 16:47:13',2,12162),('2018-09-17 10:55:44',2,12163),('2018-09-17 11:02:13',2,12164),('2018-09-17 11:04:37',2,12165),('2018-09-17 11:23:21',2,12166),('2018-09-17 11:26:09',2,12167),('2018-09-17 11:32:08',2,12168),('2018-09-18 14:18:59',1,12169),('2018-09-18 14:24:15',1,12170),('2018-09-18 14:26:02',1,12171),('2018-09-19 15:43:26',1,12172),('2018-09-19 15:44:18',1,12173),('2018-09-20 11:22:16',2,12174),('2018-09-20 14:15:49',1,12175);
/*!40000 ALTER TABLE `histo_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histo_commande`
--

DROP TABLE IF EXISTS `histo_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histo_commande` (
  `date_chg_statut` datetime NOT NULL,
  `id_statut_commande` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  PRIMARY KEY (`id_statut_commande`,`id_commande`,`date_chg_statut`),
  KEY `FK_histo_commande_id_commande` (`id_commande`),
  CONSTRAINT `FK_histo_commande_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  CONSTRAINT `FK_histo_commande_id_statut_commande` FOREIGN KEY (`id_statut_commande`) REFERENCES `statut_commande` (`id_statut_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histo_commande`
--

LOCK TABLES `histo_commande` WRITE;
/*!40000 ALTER TABLE `histo_commande` DISABLE KEYS */;
INSERT INTO `histo_commande` VALUES ('2018-06-11 12:30:00',1,1),('2018-06-12 13:20:00',4,2),('2018-06-12 14:50:00',7,3),('2018-05-27 00:00:00',2,25),('2018-06-12 00:00:00',5,26),('2017-12-10 00:00:00',4,27),('2018-06-10 00:00:00',5,30),('2018-06-01 00:00:00',2,31),('2018-05-19 00:00:00',4,32),('2017-08-16 00:00:00',7,33),('2018-02-15 00:00:00',6,34),('2018-10-05 00:00:00',1,60),('2018-10-06 00:00:00',1,61),('2017-05-26 14:00:15',1,80),('2017-05-26 14:02:15',2,80),('2017-05-26 14:05:15',3,80),('2017-05-26 14:10:15',4,80),('2017-05-27 09:00:15',5,80),('2017-05-28 16:00:15',6,80),('2017-06-26 14:00:15',1,81),('2017-06-27 14:00:15',7,81),('2018-02-20 14:25:54',1,82),('2018-02-20 14:30:54',2,82),('2017-11-11 00:00:00',2,100),('2018-01-02 23:17:32',1,110),('2018-01-02 23:59:32',2,110),('2018-01-03 00:01:23',3,110),('2018-01-03 08:47:32',4,110),('2018-01-03 12:31:36',5,110),('2018-01-04 08:00:00',6,110),('2018-06-12 01:12:13',1,111),('2018-06-12 01:14:47',2,111),('2018-06-12 01:17:12',7,111),('0000-00-00 00:00:00',130,2018),('0000-00-00 00:00:00',131,2018),('0000-00-00 00:00:00',132,2018),('0000-00-00 00:00:00',133,2018),('0000-00-00 00:00:00',134,2018),('0000-00-00 00:00:00',135,2018),('0000-00-00 00:00:00',136,2018),('0000-00-00 00:00:00',137,2018),('0000-00-00 00:00:00',138,2018),('0000-00-00 00:00:00',139,2018),('2018-01-01 00:00:00',2,12012),('2018-01-03 00:00:00',5,12012),('2018-06-06 00:00:00',2,12014),('2018-06-06 00:00:00',3,12014),('2018-07-06 00:00:00',5,12014),('2018-06-13 10:00:00',1,12345),('2018-06-13 12:00:00',2,12345),('2018-06-13 14:00:00',3,12345),('2018-06-13 16:00:00',4,12345),('2018-06-15 16:00:00',1,123456),('2018-06-15 18:00:00',2,123456),('2018-06-15 20:00:00',3,123456),('2018-06-15 22:00:00',4,123456),('2018-06-15 11:26:13',1,123457),('2018-07-10 17:13:44',1,123462),('2018-07-10 18:29:10',1,123465),('2018-07-10 18:34:32',1,123466),('2018-07-10 18:36:44',1,123467),('2018-07-11 08:41:23',1,123468),('2018-07-11 15:46:30',1,123469),('2018-07-11 16:38:59',1,123470),('2018-09-06 15:42:14',1,123471),('2018-09-06 15:48:26',1,123472),('2018-09-06 15:51:29',1,123473),('2018-09-06 15:55:45',1,123474),('2018-09-06 15:58:00',1,123475),('2018-09-06 15:59:33',1,123476),('2018-09-06 15:59:58',1,123477),('2018-09-06 16:02:40',1,123478),('2018-09-06 16:04:09',1,123479),('2018-09-06 16:06:32',1,123480),('2018-09-06 16:07:47',1,123481),('2018-09-06 16:12:44',1,123482),('2018-09-06 16:14:31',1,123483),('2018-09-06 16:16:14',1,123484),('2018-09-06 16:21:21',1,123485),('2018-09-06 16:23:32',1,123486),('2018-09-06 16:24:36',1,123487),('2018-09-06 16:37:10',1,123488),('2018-09-06 16:39:50',1,123489),('2018-09-06 16:41:39',1,123490),('2018-09-07 11:45:44',1,123491),('2018-09-11 15:57:37',1,123492),('2018-09-11 16:04:43',1,123493),('2018-09-12 13:18:20',1,123494),('2018-09-12 13:30:22',1,123495),('2018-09-12 14:07:46',1,123496),('2018-09-12 15:30:30',1,123497),('2018-09-12 15:31:48',1,123498),('2018-09-12 15:33:59',1,123499),('2018-09-12 15:41:30',1,123500),('2018-09-12 15:44:02',1,123501),('2018-09-12 15:51:19',1,123502),('2018-09-12 16:01:39',1,123503),('2018-09-12 16:31:14',1,123504),('2018-09-12 16:31:51',1,123505),('2018-09-12 16:33:25',1,123506),('2018-09-12 16:36:40',1,123507),('2018-09-13 10:16:33',1,123508),('2018-09-13 10:48:51',1,123509),('2018-09-13 10:52:10',1,123510),('2018-09-13 11:07:58',1,123511),('2018-09-13 11:43:01',1,123512),('2018-09-13 12:00:11',1,123513),('2018-09-13 14:12:13',1,123514),('2018-09-13 14:17:01',1,123515),('2018-09-13 14:48:19',1,123516),('2018-09-13 15:03:43',1,123517),('2018-09-13 15:34:20',1,123518),('2018-09-13 15:37:01',1,123519),('2018-09-13 15:45:10',1,123520),('2018-09-13 15:58:32',1,123521),('2018-09-13 16:00:16',1,123522),('2018-09-13 16:06:05',1,123523),('2018-09-13 16:24:48',1,123524),('2018-09-13 16:34:50',1,123525),('2018-09-14 12:04:58',1,123526),('2018-09-14 12:17:04',1,123527),('2018-09-20 09:18:52',3,123527),('2018-09-20 09:20:05',3,123527),('2018-09-20 10:24:55',3,123527),('2018-09-14 16:46:26',1,123528),('2018-09-14 16:47:13',1,123529),('2018-09-17 10:55:45',1,123530),('2018-09-17 11:02:13',1,123531),('2018-09-17 11:04:37',1,123532),('2018-09-17 11:23:21',1,123533),('2018-09-17 11:26:09',1,123534),('2018-09-17 11:32:08',1,123535),('2018-09-18 14:18:59',1,123536),('2018-09-18 14:24:15',1,123537),('2018-09-18 14:26:02',1,123538),('2018-09-19 15:43:26',1,123539),('2018-09-19 15:44:18',1,123540),('2018-09-20 10:24:55',1,123541),('2018-09-20 10:25:28',3,123541),('2018-09-20 10:25:28',1,123542),('2018-09-20 10:56:19',3,123542),('2018-09-20 10:56:19',1,123543),('2018-09-20 14:15:49',1,123545);
/*!40000 ALTER TABLE `histo_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histo_fournisseur`
--

DROP TABLE IF EXISTS `histo_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histo_fournisseur` (
  `date_chg_statut` datetime DEFAULT NULL,
  `id_statut_fournisseur` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`id_statut_fournisseur`,`id_fournisseur`),
  KEY `FK_histo_fournisseur_id_fournisseur` (`id_fournisseur`),
  CONSTRAINT `FK_histo_fournisseur_id_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`),
  CONSTRAINT `FK_histo_fournisseur_id_statut_four` FOREIGN KEY (`id_statut_fournisseur`) REFERENCES `statut_fournisseur` (`id_statut_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histo_fournisseur`
--

LOCK TABLES `histo_fournisseur` WRITE;
/*!40000 ALTER TABLE `histo_fournisseur` DISABLE KEYS */;
INSERT INTO `histo_fournisseur` VALUES ('2015-01-12 00:00:00',1,20),('2014-01-01 00:00:00',1,21),('0000-00-00 00:00:00',1,22),('2015-03-16 00:00:00',1,30),('2013-09-14 00:00:00',1,31),('2018-02-18 00:00:00',1,50),('2018-03-15 00:00:00',1,51),('2018-01-12 00:00:00',1,52),('2016-10-25 00:00:00',1,60),('2010-10-12 00:00:00',1,61),('2013-10-12 00:00:00',1,62),('2015-02-04 00:00:00',1,70),('2014-05-06 00:00:00',1,71),('2018-02-03 00:00:00',1,72),('2015-01-01 00:00:00',1,80),('2015-01-01 00:00:00',1,81),('2016-01-01 00:00:00',1,82),('2017-11-11 00:00:00',1,100),('2017-11-11 00:00:00',1,101),('2017-11-11 00:00:00',1,102),('2017-01-01 00:00:00',1,110),('2017-01-01 00:00:00',1,115),('1900-01-01 00:00:00',1,119),('2018-07-13 15:35:29',1,12015),('2018-07-13 15:36:20',1,12016),('2018-07-13 15:38:01',1,12017),('2018-05-10 00:00:00',2,32),('2017-01-01 00:00:00',2,81);
/*!40000 ALTER TABLE `histo_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histo_prix_fournisseur`
--

DROP TABLE IF EXISTS `histo_prix_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histo_prix_fournisseur` (
  `prix_achat` decimal(15,3) DEFAULT NULL,
  `date_chg_prix` datetime NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_fournisseur`,`id_produit`,`date_chg_prix`),
  KEY `FK_histo_prix_fournisseur_id_produit` (`id_produit`),
  CONSTRAINT `FK_histo_prix_fournisseur_id_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`),
  CONSTRAINT `FK_histo_prix_fournisseur_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histo_prix_fournisseur`
--

LOCK TABLES `histo_prix_fournisseur` WRITE;
/*!40000 ALTER TABLE `histo_prix_fournisseur` DISABLE KEYS */;
INSERT INTO `histo_prix_fournisseur` VALUES (5.000,'2018-01-01 00:00:00',20,20),(12.000,'2017-12-01 00:00:00',20,21),(12.000,'2017-12-01 00:00:00',20,22),(10.000,'2017-10-10 00:00:00',20,29),(30.000,'2017-12-31 00:00:00',21,23),(30.000,'2018-01-01 00:00:00',21,24),(20.000,'2016-12-31 00:00:00',21,25),(10.000,'2018-02-01 00:00:00',22,26),(10.000,'2018-01-31 00:00:00',22,27),(40.000,'2017-05-01 00:00:00',22,28),(10.000,'2018-03-15 00:00:00',30,30),(14.000,'2018-03-15 00:00:00',30,31),(2.500,'2018-03-15 00:00:00',30,32),(7.000,'2018-03-15 00:00:00',30,33),(45.000,'2018-03-15 00:00:00',30,34),(14.000,'2018-05-23 00:00:00',31,35),(8.000,'2018-05-23 00:00:00',31,36),(35.000,'2018-05-23 00:00:00',31,37),(6.000,'2018-05-23 00:00:00',31,38),(7.000,'2018-05-23 00:00:00',31,39),(10.990,'2018-05-12 00:00:00',50,53),(2.990,'2018-05-12 00:00:00',50,56),(15.990,'2018-05-12 00:00:00',51,51),(15.990,'2018-05-12 00:00:00',51,52),(10.990,'2018-05-12 00:00:00',51,54),(1.990,'2018-05-12 00:00:00',51,57),(20.990,'2018-05-12 00:00:00',52,50),(5.990,'2018-05-12 00:00:00',52,55),(50.990,'2018-05-12 00:00:00',52,58),(10.990,'2018-05-12 00:00:00',52,59),(10.000,'2013-10-12 00:00:00',60,64),(8.000,'2017-10-12 00:00:00',60,66),(30.000,'2010-10-12 00:00:00',60,67),(40.000,'2016-10-25 00:00:00',60,68),(25.000,'2016-10-12 00:00:00',61,60),(45.000,'2016-10-12 00:00:00',61,62),(4.000,'2017-10-12 00:00:00',61,65),(6.000,'2017-10-12 00:00:00',62,61),(8.000,'2013-10-12 00:00:00',62,63),(12.000,'2017-10-12 00:00:00',62,69),(4.000,'2017-12-12 00:00:00',70,79),(5.000,'2018-01-01 00:00:00',71,70),(40.000,'2018-05-03 00:00:00',72,75),(5.000,'2017-01-01 00:00:00',80,82),(10.000,'2017-01-01 00:00:00',80,84),(100.000,'2017-01-01 00:00:00',80,85),(10.000,'2017-01-01 00:00:00',80,87),(8.000,'2016-01-01 00:00:00',81,80),(12.000,'2016-01-01 00:00:00',81,83),(30.000,'2016-01-01 00:00:00',81,86),(10.000,'2017-01-01 00:00:00',82,81),(15.000,'2017-01-01 00:00:00',82,88),(5.000,'2017-01-01 00:00:00',82,89),(5.000,'2017-11-11 00:00:00',100,100),(5.000,'2017-11-11 00:00:00',100,101),(5.000,'2017-11-11 00:00:00',100,102),(5.000,'2017-11-11 00:00:00',100,105),(5.000,'2017-11-11 00:00:00',100,106),(5.000,'2017-11-11 00:00:00',101,107),(5.000,'2017-11-11 00:00:00',101,108),(5.000,'2017-11-11 00:00:00',101,109),(5.000,'2017-11-11 00:00:00',102,103),(5.000,'2017-11-11 00:00:00',102,104),(15.990,'2017-01-01 00:00:00',110,111),(37.000,'2017-01-01 00:00:00',110,112),(0.990,'2017-01-01 00:00:00',110,114),(19.990,'2017-01-01 00:00:00',110,115),(2.050,'2017-01-01 00:00:00',110,116),(370.000,'2017-01-01 00:00:00',115,110),(9.990,'2017-01-01 00:00:00',119,113),(1.000,'2018-06-13 00:00:00',130,130),(1.000,'2018-06-13 00:00:00',130,131),(1.000,'2018-06-13 00:00:00',130,132),(1.000,'2018-06-13 00:00:00',130,133),(299.990,'2018-08-31 12:28:00',130,12022),(1.000,'2018-06-13 00:00:00',131,134),(1.000,'2018-06-13 00:00:00',131,135),(1.000,'2018-06-13 00:00:00',131,136),(1.000,'2018-06-13 00:00:00',132,137),(1.000,'2018-06-13 00:00:00',132,138),(1.000,'2018-06-13 00:00:00',132,139),(1.000,'2018-06-13 00:00:00',140,140),(1.000,'2018-06-13 00:00:00',140,141),(1.000,'2018-06-13 00:00:00',140,142),(1.000,'2018-06-13 00:00:00',141,143),(1.000,'2018-06-13 00:00:00',141,144),(1.000,'2018-06-13 00:00:00',141,145),(1.000,'2018-06-13 00:00:00',141,146),(1.000,'2018-06-13 00:00:00',141,147),(1.000,'2018-06-13 00:00:00',142,148),(1.000,'2018-06-13 00:00:00',142,149),(13.000,'0000-00-00 00:00:00',12010,12013),(3.000,'2018-02-02 00:00:00',12010,12018),(5.000,'2018-03-03 00:00:00',12010,12019),(8.000,'2018-06-05 00:00:00',12011,12010),(10.000,'2018-01-01 00:00:00',12011,12011),(9.000,'2018-09-15 00:00:00',12012,12012);
/*!40000 ALTER TABLE `histo_prix_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `histo_produit`
--

DROP TABLE IF EXISTS `histo_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `histo_produit` (
  `date_chg_statut` datetime NOT NULL,
  `remise_eventuelle` decimal(5,4) DEFAULT NULL,
  `date_dispo` datetime DEFAULT NULL,
  `id_statut_produit` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_statut_produit`,`id_produit`,`date_chg_statut`),
  KEY `FK_histo_produit_id_produit` (`id_produit`),
  CONSTRAINT `FK_histo_produit_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  CONSTRAINT `FK_histo_produit_id_statut_produit` FOREIGN KEY (`id_statut_produit`) REFERENCES `statut_produit` (`id_statut_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `histo_produit`
--

LOCK TABLES `histo_produit` WRITE;
/*!40000 ALTER TABLE `histo_produit` DISABLE KEYS */;
INSERT INTO `histo_produit` VALUES ('2016-12-31 00:00:00',NULL,'2017-01-08 00:00:00',1,20),('2018-01-01 00:00:00',NULL,'2017-01-06 00:00:00',1,21),('2018-01-01 00:00:00',NULL,'2016-01-01 00:00:00',1,22),('2016-12-31 00:00:00',NULL,'2017-02-04 00:00:00',1,24),('2017-12-31 00:00:00',NULL,'2017-01-05 00:00:00',1,25),('2017-12-31 00:00:00',NULL,'2017-01-01 00:00:00',1,26),('2018-01-10 00:00:00',NULL,'2017-10-10 00:00:00',1,27),('2018-01-18 00:00:00',NULL,'2018-08-01 00:00:00',1,28),('2017-12-31 00:00:00',NULL,'2016-01-01 00:00:00',1,29),('2018-06-05 00:00:00',0.0000,'2018-05-15 00:00:00',1,30),('2018-06-01 00:00:00',0.0000,'2018-12-30 00:00:00',1,31),('2018-06-10 00:00:00',0.0550,'2013-12-04 00:00:00',1,33),('2018-06-12 00:00:00',0.0000,'2018-09-16 00:00:00',1,34),('2018-06-10 00:00:00',0.0000,'2018-09-15 00:00:00',1,36),('2018-06-10 00:00:00',0.0000,'2018-03-23 00:00:00',1,37),('2018-06-12 00:00:00',0.0000,'2016-08-12 00:00:00',1,38),('2018-06-12 00:00:00',0.0000,'2018-06-17 00:00:00',1,39),('0000-00-00 00:00:00',NULL,NULL,1,60),('0000-00-00 00:00:00',NULL,NULL,1,61),('0000-00-00 00:00:00',NULL,NULL,1,65),('0000-00-00 00:00:00',NULL,NULL,1,66),('0000-00-00 00:00:00',NULL,NULL,1,67),('0000-00-00 00:00:00',NULL,NULL,1,68),('0000-00-00 00:00:00',NULL,NULL,1,69),('2018-06-10 00:00:00',NULL,'2017-08-13 00:00:00',1,70),('2018-06-12 00:00:00',0.3000,'2018-07-14 00:00:00',1,78),('2017-05-26 15:00:00',NULL,'2017-05-26 00:00:00',1,80),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,81),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,82),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,83),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,84),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,85),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,86),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,87),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,88),('2017-05-26 00:00:00',NULL,'2017-05-26 00:00:00',1,89),('2017-11-11 00:00:00',0.0000,NULL,1,100),('2017-11-11 00:00:00',0.0000,NULL,1,101),('2017-11-11 00:00:00',0.0000,NULL,1,102),('2017-11-11 00:00:00',0.0000,NULL,1,103),('2017-11-11 00:00:00',0.0000,NULL,1,104),('2017-11-11 00:00:00',0.0000,NULL,1,105),('2017-11-11 00:00:00',0.0000,NULL,1,106),('2017-11-11 00:00:00',0.0000,NULL,1,107),('2017-11-11 00:00:00',0.0000,NULL,1,108),('2017-11-11 00:00:00',0.0000,NULL,1,109),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,110),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,111),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,112),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,113),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,114),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,115),('2017-01-01 00:00:00',0.0000,'2017-01-01 00:00:00',1,116),('2018-08-31 11:51:18',NULL,NULL,1,12021),('2018-08-31 12:08:26',0.0000,'2018-08-31 12:08:26',1,12022),('2018-02-15 00:00:00',NULL,'2016-06-05 00:00:00',2,23),('2018-06-10 00:00:00',0.0000,'1995-04-12 00:00:00',2,32),('0000-00-00 00:00:00',NULL,NULL,2,62),('0000-00-00 00:00:00',NULL,NULL,2,63),('0000-00-00 00:00:00',NULL,NULL,2,64),('2017-01-05 00:00:00',0.0000,'2017-01-01 00:00:00',2,116),('2018-06-12 00:00:00',0.0000,'1991-05-13 00:00:00',3,35),('2018-06-10 00:00:00',0.1000,'2015-05-14 00:00:00',3,76);
/*!40000 ALTER TABLE `histo_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(255) DEFAULT NULL,
  `prixht_produit` decimal(15,3) DEFAULT NULL,
  `stock_inventaire_produit` int(11) DEFAULT NULL,
  `stock_minimum` int(11) DEFAULT NULL,
  `stock_objectif` int(11) DEFAULT NULL,
  `tva_produit` decimal(5,4) DEFAULT NULL,
  `id_type_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `FK_produit_id_type_produit` (`id_type_produit`),
  CONSTRAINT `FK_produit_id_type_produit` FOREIGN KEY (`id_type_produit`) REFERENCES `type_produit` (`id_type_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=12023 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (10,'Master of puppets',19.000,96,2,20,0.2000,6),(11,'Barbie divorce',30.000,89,3,10,0.2000,2),(12,'Rocky 22',22.000,86,5,25,0.2000,3),(13,'Regime vegan: comment manger un bouffeur de graines pas jour?',55.000,5,2,10,0.0550,4),(14,'Sims 122',25.000,12,10,30,0.2000,7),(15,'Star Wars 44',30.000,4,2,10,0.2000,3),(16,'Le suicide pour les nuls',50.111,25,10,50,0.0550,4),(17,'Tintin en Coree du nord',24.000,16,3,30,0.2000,5),(18,'Cuisinez avec Hannibal Lecter ',50.000,20,5,50,0.2000,4),(19,'30 ans d\'amour dans les bras d\'un manchot',25.000,25,10,30,0.0550,3),(20,'Jump on Board Digipack',7.000,15,3,20,0.2000,1),(21,'Je reviens à toi Livre-disque',14.990,12,3,15,0.2000,1),(22,'Prequelle Edition Deluxe limitée',14.990,16,3,18,0.2000,1),(23,'Pokémon Let\'s Go Pikachu Nintendo Switch',49.990,29,5,35,0.2000,7),(24,'Mario Tennis Aces Nintendo Switch',44.490,25,10,50,0.2000,7),(25,'Final Fantasy XV Edition Royale PS4',34.990,10,5,30,0.2000,7),(26,'Une aventure nommée Federer',16.900,5,2,10,0.0550,4),(27,'Je suis healthy !',14.950,6,2,10,0.0550,4),(28,'Ready Player One Coffret Exclusivité Fnac Steelbook Blu-ray 4K Ultra HD',59.990,NULL,NULL,NULL,0.2000,3),(29,'Cro Man DVD',14.990,10,5,20,0.2000,2),(30,'Avengers',22.000,0,2,20,0.2000,2),(31,'Equalizer',30.000,4,2,30,0.2000,3),(32,'Gipsy King',7.000,0,0,5,0.0550,1),(33,'ALPHA',12.000,10,5,15,0.0500,5),(34,'GOD OF WAR',60.000,14,7,30,0.2000,7),(35,'Claude François',20.000,3,1,5,0.0500,6),(36,'Le lambeau',15.000,4,2,7,0.0500,4),(37,'Fifa18',55.000,10,5,25,0.2000,7),(38,'DEADPOOL',13.000,5,2,10,0.0550,1),(39,'MI6',15.000,13,8,25,0.2000,3),(50,'FIFA_1879',1998.990,1998,1998,1998,0.2000,7),(51,'Idiocracy',20.990,5,10,15,0.2000,2),(52,'Mylene_Farmer_Tour_2015',20.000,5,2,5,0.2000,1),(53,'Salut_Fred',12.990,4,1,5,0.2000,3),(54,'L_Anaconda_Algerien',15.990,58,5,10,0.0550,3),(55,'Prison_School_Tome_1',9.990,3,1,5,0.0550,4),(56,'Elle_a_Le_Choix_Dans_La_Date',5.990,20,5,15,0.0550,3),(57,'JUL_je_me_vois_pas_briller',499.990,20,1,0,0.2000,1),(58,'Coffret_Teletubbies',89.900,65,20,50,0.2000,2),(59,'Human_Centipede',20.990,20,10,0,0.2000,7),(60,'splatoon',37.080,10,2,15,0.2000,7),(61,'La fête est finie',10.000,30,5,30,0.2000,1),(62,'LSDA-trilogie',58.000,5,3,20,0.2000,3),(63,'Hsotd - Intégrale',12.000,5,2,10,0.0550,5),(64,'Les Derniers Jedi',13.000,10,8,30,0.2000,2),(65,'La Ch\'tite famille',8.000,20,10,25,0.2000,2),(66,'Ceinture Noire 1er Dan',13.000,30,10,50,0.2000,1),(67,'God Of War',40.000,40,15,50,0.2000,7),(68,'Gears of War -U_E',10.000,10,5,15,0.2000,7),(69,'Kâma Sûtra',20.000,5,2,10,0.0550,4),(70,'Scandal',10.900,3,2,7,0.2000,1),(71,'l\'art du judo',9.990,2,1,4,0.0550,4),(72,'saint seiya',30.500,3,1,5,0.2000,2),(73,'DTC',2.990,1,0,2,0.2000,1),(74,'les gladiatrices',4.000,1,0,1,0.2000,2),(75,'ZELDA',55.000,3,2,5,0.2000,7),(76,'MARIO KART 64',40.000,1,0,2,0.2000,7),(77,'les nuls ',8.990,3,2,5,0.0550,5),(78,'THE MUSMUS',9.000,2,1,3,0.2000,1),(79,'HOSTEL 2',15.450,3,1,5,0.2000,3),(80,'tata et les tontons',10.000,5,2,4,0.2000,2),(81,'H.P  l\'ecole des sorciers',15.000,4,1,4,0.2000,3),(82,'H.P  l\'ecole des sorciers',7.000,2,1,2,0.0550,4),(83,'Gladiator',15.000,7,3,6,0.2000,3),(84,'Black Ice',12.000,6,2,6,0.2000,1),(85,'James Bond Collector',140.000,2,1,1,0.2000,2),(86,'Overwatch',35.000,7,3,6,0.2000,7),(87,'Diablo 3',16.000,2,1,1,0.2000,7),(88,'Diablo 3 extension',20.000,5,2,4,0.2000,7),(89,'les arcanes du chaos',7.000,4,1,2,0.0550,4),(100,'Fragile',10.000,100,10,500,NULL,1),(101,'Legion',10.000,100,10,500,NULL,2),(102,'Deadpool2',10.000,100,10,500,NULL,3),(103,'Game of throne',10.000,100,10,500,NULL,4),(104,'Steins;Gate',10.000,100,10,500,NULL,5),(105,'Roudabout',10.000,100,10,500,NULL,6),(106,'Y.M.C.A',10.000,100,10,500,NULL,7),(107,'Persona5',10.000,100,10,500,NULL,8),(108,'Brutal Legend',10.000,100,10,500,NULL,8),(109,'MONSTER HUNTER: WORLD ORIGINAL SOUNDTRACK',10.000,100,10,500,NULL,1),(110,'la foire a la 106 de strasbourg',370.450,20,3,20,0.2000,4),(111,'la blonde est dans la classe',15.990,20,3,20,0.2000,3),(112,'tiré dans lmile',370.450,20,3,20,0.2000,7),(113,'file edit... piaf',9.990,5,1,10,0.2000,6),(114,'vie ma vie',0.990,2,1,2,0.0550,5),(115,'francky vincent, le réveil de la clio 4',19.990,100,20,200,0.2000,2),(116,'red boule',2.050,10,1,15,0.2000,1),(130,'la vie est belle',54.250,25,5,30,0.2000,3),(131,'chanson d été',13.200,9,5,25,0.2000,1),(132,'une dernière fois',25.600,12,5,30,0.0550,4),(133,'titin au congo',12.850,20,5,20,0.0550,5),(134,'tombraider',45.900,8,18,20,0.2000,7),(135,'le soldat ryan',25.900,9,5,20,0.2000,2),(136,'usual suspect',18.900,13,4,25,0.2000,2),(137,'body count',12.900,6,5,10,0.2000,1),(138,'paris sous les bombes',21.650,9,5,10,0.2000,6),(139,'call of duty 2018',45.900,11,10,35,0.2000,7),(12010,'Zelda - Ocarina of time',20.000,18,0,13,0.0000,7),(12011,'Final fantasy VII',30.000,13,5,7,0.0000,7),(12012,'Akira',15.000,3,0,5,0.0000,3),(12013,'Ghost in the shell',15.000,2,1,5,0.0000,3),(12014,'Mr robot',25.000,3,7,10,0.0000,2),(12015,'Astérix - Mission cléopat',15.000,10,5,20,0.0000,5),(12016,'Les 12 travaux d\'Astérix',15.000,15,5,20,0.0000,5),(12017,'La fête est finie',19.000,16,15,20,0.0000,1),(12018,'One more light',19.000,3,5,15,0.0000,1),(12019,'Paranoid',15.000,2,10,35,0.0000,1),(12020,'nomproduit',150.260,20,3,20,0.2017,2),(12021,'nomproduit',53.000,20,3,20,0.2017,3),(12022,'nom produit ok',575.000,2,1,3,0.2017,3);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`chatnoir`@`localhost`*/ /*!50003 trigger tg_after_insertion_produit after insert on produit
/* Objectif : Création d'un lien entre le nouveau fournisseur et son statut (1 : en stock par défaut)
*/
for each row
begin
	# creation du lien
	insert into histo_produit(date_chg_statut, remise_eventuelle, date_dispo, id_statut_produit, id_produit) values
    (now(), 0.0000, @date_dispo_produit, 1, new.id_produit);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produit_genre_produit`
--

DROP TABLE IF EXISTS `produit_genre_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_genre_produit` (
  `id_produit` int(11) NOT NULL,
  `id_genre_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`,`id_genre_produit`),
  KEY `FK_produit_genre_produit_id_genre_produit` (`id_genre_produit`),
  CONSTRAINT `FK_produit_genre_produit_id_genre_produit` FOREIGN KEY (`id_genre_produit`) REFERENCES `genre_produit` (`id_genre_produit`),
  CONSTRAINT `FK_produit_genre_produit_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_genre_produit`
--

LOCK TABLES `produit_genre_produit` WRITE;
/*!40000 ALTER TABLE `produit_genre_produit` DISABLE KEYS */;
INSERT INTO `produit_genre_produit` VALUES (11,1),(12,1),(13,1),(15,1),(16,1),(17,1),(23,1),(24,1),(25,1),(31,1),(34,1),(38,1),(39,1),(50,1),(51,1),(55,1),(60,1),(62,1),(63,1),(67,1),(68,1),(71,1),(74,1),(76,1),(85,1),(86,1),(115,1),(133,1),(134,1),(135,1),(139,1),(28,2),(30,2),(34,2),(38,2),(39,2),(64,2),(72,2),(75,2),(104,2),(112,2),(115,2),(116,2),(140,2),(141,2),(142,2),(19,3),(33,3),(36,3),(63,3),(69,3),(112,3),(114,3),(130,3),(83,4),(111,4),(148,4),(149,4),(89,5),(111,5),(132,5),(136,5),(53,6),(56,6),(80,6),(110,6),(14,7),(18,7),(37,7),(52,7),(57,7),(59,7),(63,7),(77,7),(79,7),(87,7),(88,7),(112,7),(143,7),(144,7),(145,7),(146,7),(147,7),(29,8),(54,8),(80,8),(110,8),(26,9),(27,9),(30,9),(34,9),(38,9),(58,9),(62,9),(67,9),(68,9),(75,9),(80,9),(81,9),(82,9),(87,9),(88,9),(101,9),(102,9),(103,9),(116,9),(20,10),(70,10),(84,10),(100,10),(105,10),(10,11),(21,11),(78,11),(108,11),(113,11),(137,11),(22,12),(32,12),(35,12),(73,12),(109,12),(131,12),(61,13),(66,13),(138,13);
/*!40000 ALTER TABLE `produit_genre_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_info_annexe`
--

DROP TABLE IF EXISTS `produit_info_annexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_info_annexe` (
  `lib_info_annexe` varchar(255) NOT NULL,
  `id_info_annexe_produit` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_info_annexe_produit`,`id_produit`,`lib_info_annexe`),
  KEY `FK_info_annexe_produit_id_produit` (`id_produit`),
  CONSTRAINT `FK_info_annexe_produit_id_info_annexe_produit` FOREIGN KEY (`id_info_annexe_produit`) REFERENCES `type_info_annexe` (`id_info_annexe_produit`),
  CONSTRAINT `FK_info_annexe_produit_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_info_annexe`
--

LOCK TABLES `produit_info_annexe` WRITE;
/*!40000 ALTER TABLE `produit_info_annexe` DISABLE KEYS */;
INSERT INTO `produit_info_annexe` VALUES ('Cliff Burton',4,10),('James Hetfield',4,10),('Kirk Hammett',4,10),('Lars Ulrich',4,10),('Metallica',4,10),('texas',4,20),('Ghost ',4,21),('marc lavoine',4,22),('nintendo',5,23),('nintendo switch',8,23),('+7',13,23),('nintendo',5,24),('nintendo switch',8,24),('+3',13,24),('Square enix',5,25),('playstation 4',8,25),('+16',13,25),('Rocher Eds Du',5,26),('papier',10,26),('first',5,27),('papier',10,27),('Steven Spielberg',1,28),('Tye Sheridan',2,28),('Nick Park',1,29),('Tom Hiddleston',2,29),('Joss Whendon',1,30),('Couleur 35 mm',10,30),('142 minutes',11,30),('Français',12,30),('-13',13,30),('Antoine Furqua',1,31),('Denzel Washington',2,31),('Couleur',10,31),('132 minutes',11,31),('Gipsy King',4,32),('Chicago 1995',5,32),('Alain Queireix',3,33),('Herzet',9,33),('Frederic Souterelle : Kratos',2,34),('2018',5,34),('PS4',8,34),('Français',12,34),('Claude François',4,35),('Réédition de son célèbre album de 1977',5,35),('33T',10,35),('Philippe Lançon',3,36),('Avril 2018',5,36),('EA Sports',1,37),('Sept 2017',5,37),('PS4',8,37),('Tim Miller',1,38),('Ryan Reynolds',2,38),('2016',5,38),('108 minutes',11,38),('Christopher McQuarrie',1,39),('Tom Cruise',2,39),('2018',5,39),('12',9,60),('switch',9,60),('Orelsan',5,61),('50min',12,61),('Peter Jackson',1,62),(' Liv Tyler',3,62),(' Viggo Mortensen',3,62),('Elijah Wood',3,62),('Cinémascope',11,62),('714 minutes',12,62),('Tetsurô Araki',1,63),('300 minutes',12,63),('RINA SUZUKI',4,70),('DAVID DOUILLET',3,71),('MASAMI KURUMADA',8,72),('CLARA MORGANE',3,73),('ANNE',2,74),('switch',7,75),('NINTENDO 64',7,76),('CONNARD',3,77),('CHIO',4,78),('ELI ROTH',1,79),('LAUREN GERMAN',2,79),('95',10,79),('16',12,79),('Jean Fille',1,80),('Flipper',2,80),('Lassie',2,80),('Leave Vrette',2,80),('Sam Gratte',2,80),('Tata rencontre Tonton et boom tata  apres flipper rencontre Lassie et Bam Lassie.',6,80),('259 min',11,80),('Chris Colombus',1,81),('Daniel Radcliffe',2,81),('Emma Watson',2,81),('alors, c\'est un brun un roux et une brune qui rentre dans une ecole....',6,81),('152 min',11,81),('J.K Rowling',3,82),('alors, c\'est un brun un roux et une brune qui rentre dans une ecole....',6,82),('Christopher Nolan',1,83),('Russel Crow, Joaquin Phoenix',2,83),('gladiateur plus empereur egal scene de menage',6,83),('155 min',11,83),('16 ans',13,83),('ACDC',4,84),('Ben, tout les mecs qui ont joué James Bond',2,85),('reuni tout les films de James Bond',6,85),('Tres long',11,85),('PC, ps4',8,86),('12 ans',13,86),('defonce du demon',6,87),('pc, ps4',8,87),('extention de diablo 3, il faut possede le premier sinon tu l\'a dans le f..',6,88),('pc',8,88),('Maxime Chattam',3,89),('c\'est un livre avec des pages, des mots, ca peut etre dur pour certains',6,89),('le zébre amène le courrier à maman rinoféroce',6,110),('-16',13,110),('finalement, après 2 mois de cours, une blonde intègre la 15e place de la classe',6,111),('25 tours',10,113),('inspecteur derrick',1,114),('après un malheureux tête à cul, franck se vois confié une clio 4 pendant 2 semaines',6,115),('jgjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhjhj',6,116),('un remake de la fameuse cannette',6,116),('Nintendo 64',8,12010),('Christian Slater',2,12014),('Rami Malek',2,21014);
/*!40000 ALTER TABLE `produit_info_annexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_client`
--

DROP TABLE IF EXISTS `statut_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statut_client` (
  `id_statut_client` int(11) NOT NULL AUTO_INCREMENT,
  `lib_statut_client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_statut_client`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_client`
--

LOCK TABLES `statut_client` WRITE;
/*!40000 ALTER TABLE `statut_client` DISABLE KEYS */;
INSERT INTO `statut_client` VALUES (1,'guest'),(2,'classic'),(3,'premium'),(4,'desactive'),(5,'_MAG'),(6,'_DIR');
/*!40000 ALTER TABLE `statut_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statut_commande` (
  `id_statut_commande` int(11) NOT NULL AUTO_INCREMENT,
  `lib_statut_commande` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_statut_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_commande`
--

LOCK TABLES `statut_commande` WRITE;
/*!40000 ALTER TABLE `statut_commande` DISABLE KEYS */;
INSERT INTO `statut_commande` VALUES (1,'panier'),(2,'validation'),(3,'payée'),(4,'en preparation'),(5,'expédiée'),(6,'livrée'),(7,'annulée');
/*!40000 ALTER TABLE `statut_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_fournisseur`
--

DROP TABLE IF EXISTS `statut_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statut_fournisseur` (
  `id_statut_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `lib_statut_fournisseur` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_statut_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_fournisseur`
--

LOCK TABLES `statut_fournisseur` WRITE;
/*!40000 ALTER TABLE `statut_fournisseur` DISABLE KEYS */;
INSERT INTO `statut_fournisseur` VALUES (1,'actif'),(2,'inactif');
/*!40000 ALTER TABLE `statut_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statut_produit`
--

DROP TABLE IF EXISTS `statut_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statut_produit` (
  `id_statut_produit` int(11) NOT NULL AUTO_INCREMENT,
  `lib_statut_produit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_statut_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statut_produit`
--

LOCK TABLES `statut_produit` WRITE;
/*!40000 ALTER TABLE `statut_produit` DISABLE KEYS */;
INSERT INTO `statut_produit` VALUES (1,'en stock'),(2,'rupture'),(3,'fin de vie');
/*!40000 ALTER TABLE `statut_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_genre_produit`
--

DROP TABLE IF EXISTS `type_genre_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_genre_produit` (
  `id_type_produit` int(11) NOT NULL,
  `id_genre_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_type_produit`,`id_genre_produit`),
  KEY `FK_type_genre_produit_id_genre_produit` (`id_genre_produit`),
  CONSTRAINT `FK_type_genre_produit_id_genre_produit` FOREIGN KEY (`id_genre_produit`) REFERENCES `genre_produit` (`id_genre_produit`),
  CONSTRAINT `FK_type_genre_produit_id_type_produit` FOREIGN KEY (`id_type_produit`) REFERENCES `type_produit` (`id_type_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_genre_produit`
--

LOCK TABLES `type_genre_produit` WRITE;
/*!40000 ALTER TABLE `type_genre_produit` DISABLE KEYS */;
INSERT INTO `type_genre_produit` VALUES (2,1),(3,1),(4,1),(5,1),(7,1),(2,2),(3,2),(4,2),(5,2),(7,2),(2,3),(3,3),(4,3),(5,3),(7,3),(2,4),(3,4),(4,4),(5,4),(7,4),(2,5),(3,5),(4,5),(5,5),(7,5),(2,6),(3,6),(4,6),(5,6),(7,6),(2,7),(3,7),(4,7),(5,7),(7,7),(2,8),(3,8),(4,8),(5,8),(7,8),(2,9),(3,9),(4,9),(5,9),(7,9),(1,10),(6,10),(1,11),(6,11),(1,12),(6,12),(1,13),(6,13);
/*!40000 ALTER TABLE `type_genre_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_info_annexe`
--

DROP TABLE IF EXISTS `type_info_annexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_info_annexe` (
  `id_info_annexe_produit` int(11) NOT NULL AUTO_INCREMENT,
  `lib_info_annexe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_info_annexe_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_info_annexe`
--

LOCK TABLES `type_info_annexe` WRITE;
/*!40000 ALTER TABLE `type_info_annexe` DISABLE KEYS */;
INSERT INTO `type_info_annexe` VALUES (1,'realisateur'),(2,'acteur'),(3,'auteur'),(4,'interprete'),(5,'edition'),(6,'synopsis'),(7,'lien_image'),(8,'plateforme'),(9,'dessinateur'),(10,'format'),(11,'duree'),(12,'langue'),(13,'public_conseille');
/*!40000 ALTER TABLE `type_info_annexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_produit`
--

DROP TABLE IF EXISTS `type_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_produit` (
  `id_type_produit` int(11) NOT NULL AUTO_INCREMENT,
  `lib_type_produit` varchar(255) DEFAULT NULL,
  `tva_type_produit` decimal(5,4) DEFAULT NULL,
  PRIMARY KEY (`id_type_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_produit`
--

LOCK TABLES `type_produit` WRITE;
/*!40000 ALTER TABLE `type_produit` DISABLE KEYS */;
INSERT INTO `type_produit` VALUES (1,'cd',0.2000),(2,'dvd',0.2000),(3,'Bluray',0.2000),(4,'livre',0.0550),(5,'bd',0.0550),(6,'vinyle',0.2000),(7,'jeux',0.2000);
/*!40000 ALTER TABLE `type_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_histo_panier`
--

DROP TABLE IF EXISTS `vw_histo_panier`;
/*!50001 DROP VIEW IF EXISTS `vw_histo_panier`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_histo_panier` AS SELECT 
 1 AS `id_client`,
 1 AS `remise_globale`,
 1 AS `date_creation_commande`,
 1 AS `id_commande`,
 1 AS `id_statut_commande`,
 1 AS `date_chg_statut`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `warning`
--

DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning` (
  `id_warning` int(11) NOT NULL AUTO_INCREMENT,
  `lib_warning` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_warning`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
INSERT INTO `warning` VALUES (1,'Fin de série'),(2,'Production stoppée'),(3,'Ventes stoppées');
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP FUNCTION IF EXISTS `fx_donne_errmsg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fx_donne_errmsg`(errcode int) RETURNS varchar(255) CHARSET latin1
begin
	return (select FR_lib from error_message where iderror_message = errcode);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fx_verif_genre_type_produit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` FUNCTION `fx_verif_genre_type_produit`(id_type int, id_genre int) RETURNS int(11)
begin
	declare maRep int;declare idg int;declare idt int;declare nbRel int;
    set idt = ( select count(*) 
        from type_genre_produit
        where id_type_produit = id_type);
    set idg = ( select count(*) 
        from type_genre_produit
        where id_genre_produit = id_genre);  

    #autorisation de la relation
    set nbRel = (select count(*)
        from type_genre_produit
        where id_type_produit = id_type
        and id_genre_produit = id_genre);
    set maRep = (if (nbRel <= 0,0,1));

    #vérification des ids
    set maRep = (if( idg <= 0,-1,maRep));
    set maRep = (if( idt <= 0,-2,maRep));
    return maRep;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fx_verif_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fx_verif_mail`(monmail varchar(255)) RETURNS int(11)
begin
	declare maRep int;
    #vérification du format
	set maRep = (if(monmail like ('%@%.%'), 1, 0));
    #gestion cas particulier GUEST mail=null
    set maRep = (if(isnull(monmail), 2, maRep));
    return maRep;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_client_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_client_delete`(
							in id integer, 
							out errcode integer,
							out errmsg varchar(255))
begin
	declare nbOld int;
    declare nbNew int;
    declare nb int;
    declare find bool;
	declare exit handler for 1451 -- impossible de supprimer à cause des FK
    begin
        set errcode = 60010, errmsg = fx_donne_errmsg(errcode);
		rollback;
    end;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nb = (select count(*) from client where id_client=id);
        set find = if(nb=1,true, false);
        set nbOld = (select count(*) from client);
        
        if (find=false) then 
			-- si élément non trouvé
			signal sqlstate 'EL000' set MYSQL_ERRNO=60011, MESSAGE_TEXT = "erreur logiciel";
        end if;
        
        delete from client where id_client=id;
        set nbNew = (select count(*) from client);
        
        if (nbNew <> nbOld - 1) then
			select nbNew, nbOld;
			-- si la suppression ne concerne pas qu'une ligne...
			signal sqlstate 'EL000' set MYSQL_ERRNO=60012, MESSAGE_TEXT = "erreur logiciel";
        end if;
        
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_client_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_client_insertion`(in nom_client varchar(255), 
									in prenom_client varchar(255), 
									in sexe_client char(1), 
									in email_client varchar(255), 
									in tel_client varchar(25), 
									in date_naissance_client datetime, 
									in adresse_client varchar(255), 
									in code_postal_client varchar(25), 
									in ville_client varchar(255), 
									in pays_client varchar(255), 
									in commentaire_client varchar(1000), 
									in mdp_client varchar(25),
									out errcode integer,
									out errmsg varchar(255),
									out id_client integer)
begin
	declare id_statut_mail int;
	declare nbmail int;
	declare exit handler for 1062 # 1062 : Duplicate entry
    begin
		set errcode = 60070;
		set errmsg = fx_donne_errmsg(errcode);
		rollback;
	end;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null; set id_client = -1;set nbmail = 0;

		set nbmail = (select count(*)
						from client
						where client.mail_client like email_client);

		if (nbmail > 0) then
		#adresse mail déjà présente
			signal sqlstate 'EL000' set MYSQL_ERRNO=60000;
        end if;

		set id_statut_mail = fx_verif_mail(email_client);

        case id_statut_mail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# creation de compte
				insert into client(date_inscription_client, nom_client, prenom_client, sexe_client, mail_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client)
				values (now(), nom_client, prenom_client, sexe_client, email_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client);
				set id_client = last_insert_id();
			
			when 2 then
				# creation client guest
				insert into client(date_inscription_client, nom_client, prenom_client, sexe_client, mail_client, tel_client, date_naissance_client, adresse_client, code_postal_client, ville_client, pays_client, commentaire_client, mdp_client)
				values (now(), 'guest', null, null, null, null, null, null, null, null, null, null, 'Site01');
				set id_client = last_insert_id();
				
				#guest = mail unique --> creation mail avec id utilisateur
				UPDATE client 
				SET client.mail_client = concat('guest',id_client,'@monsite.fr') 
				WHERE client.id_client=id_client;
			else 
				#format mail indéterminé
				signal sqlstate 'EL000' set MYSQL_ERRNO=60002;
		end case;
	
        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_client_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_client_update`(
							in id integer, 
							in nom varchar(255), 
							in prenom varchar(255), 
							in sexe char(1), 
							in mail varchar(255), 
							in tel varchar(25), 
							in date_naissance datetime, 
							in adresse varchar(255), 
							in code_postal varchar(25), 
							in ville varchar(255), 
							in pays varchar(255), 
							in commentaire varchar(1000), 
							in mdp varchar(25),
							out errcode integer,
							out errmsg varchar(255))
begin
	declare id_statut_mail int;
	declare exit handler for 1062 # 1062 : Duplicate entry (soit par id soit par mail)
    begin
		declare nbmail int;
        # détermine si l'email est unique ou multiple
        set nbmail = (select count(*) from client where client.mail_client = mail_client);
        # enregistrement des errcode et msg par défaut
        get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
        if (nbmail > 0) then # gestion du cas particulier ou la duplicate entry est l'adresse mail et non l'id
			set errcode = 60000;
            set errmsg = fx_donne_errmsg(errcode);
        end if;
		rollback;
	end;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set id_statut_mail = fx_verif_mail(mail);
        
        case id_statut_mail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001, MESSAGE_TEXT = "erreur logiciel";
				
			when 1 then
				# Mail valide
				update client
                set
                nom_client=nom, prenom_client=prenom, 
                sexe_client = sexe, mail_client = mail, tel_client = tel, 
                date_naissance_client = date_naissance, adresse_client=adresse, 
                code_postal_client = code_postal, ville_client=ville, pays_client = pays, 
                commentaire_client = commentaire, mdp_client = mdp
                where id_client = id;
			
			when 2 then
				# Mail null
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003, MESSAGE_TEXT = "erreur logiciel";
			else 
				#format mail indéterminé
				signal sqlstate 'EL000' set MYSQL_ERRNO=60002, MESSAGE_TEXT = "erreur logiciel";
		end case;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_commande_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_commande_delete`(
							in id integer, 
							out errcode integer,
							out errmsg varchar(255))
begin
	declare idclient int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set idclient = (select commande.id_client from commande where commande.id_commande = id);
        
        delete from commande
        where commande.id_commande = id;
        
        insert into commande (remise_globale, date_creation_commande, id_client) Values
		(0, now(), idclient);
        
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_commande_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_commande_insertion`(in remise_globale decimal(5,4), 
                                      in id_client int,
                                      out errcode int,
                                      out errmsg varchar(255),
                                      out id_commande int)
begin
	declare nbClient int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
    # initialisation des variables OUT
    set errcode = 0; set errmsg = null; set id_commande = null;
    set nbClient = (select count(*) from client where client.id_client = id_client);
    if (nbClient <> 1) then
		#si pas ou plusieurs client dans la base client
        signal sqlstate 'EL000' set MYSQL_ERRNO=60020;
    end if;
    
	# requete à effectuer
	insert into commande (remise_globale, date_creation_commande, id_client) Values
	(remise_globale, now(), id_client);
	
	set id_commande = last_insert_id();
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_commande_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_commande_update`(
							in id int,
							in remise decimal(5,4), 
							out errcode integer,
							out errmsg varchar(255))
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        
        update commande
        set commande.remise_globale = remise
        where commande.id_commande = id;
        
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_dernier_statut` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`eclipse`@`localhost` PROCEDURE `ps_dernier_statut`(in nom_statut varchar(50), 
									in id_obj int, 
                                    out errcode int,
                                    out errmsg varchar(1000),
                                    out id_trouve int)
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;set id_trouve = -1;
		set @maRequete = concat("set @id = (Select histo_",nom_statut,".id_statut_",nom_statut," from histo_",nom_statut,
						", ",nom_statut,", statut_",nom_statut,
						" where ",nom_statut,".id_",nom_statut," = histo_",nom_statut,".id_",nom_statut,
						" AND statut_",nom_statut,".id_statut_",nom_statut," = histo_",nom_statut,".id_statut_",nom_statut,
						" AND ",nom_statut,".id_",nom_statut,"=",id_obj," order by date_chg_statut desc limit 1);");
		prepare stmt from @maRequete;
		execute stmt;
        Deallocate prepare stmt;
		set id_trouve = @id;
        if (isnull(id_trouve)) then
			signal sqlstate 'EL000' set MYSQL_ERRNO=60050;
        end if;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_fournisseur_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_fournisseur_delete`( 
			in idfour int,
			out errcode integer,
			out errmsg varchar(255))
begin
	declare nbfour int;declare nbfk int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nbfour = (select count(*) from fournisseur where fournisseur.id_fournisseur = idfour);
        set nbfk = (select count(*) from histo_prix_fournisseur where histo_prix_fournisseur.id_fournisseur = idfour);
        
        if (nbfour = 0) then
			#le fournisseur n'existe pas
			signal sqlstate 'EL000' set MYSQL_ERRNO=60021;
        end if;
        if (nbfk <> 0) then
			#le fournisseur à déjà des références
			signal sqlstate 'EL000' set MYSQL_ERRNO=60013;
        end if;
        
		# delete fournisseur
		delete from fournisseur
		where fournisseur.id_fournisseur = idfour;

        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_fournisseur_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_fournisseur_insertion`( 
			in nom varchar(255),  
			in mail varchar(255),   
			in adresse varchar(255), 
			in code_postal varchar(25), 
			in ville varchar(255), 
			in pays varchar(255),
			out errcode integer,
			out errmsg varchar(255),
			out idfournisseur integer)
begin
	declare Etatmail int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null; set idfournisseur = -1;
        set Etatmail = fx_verif_mail(mail);
        
        case Etatmail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# creation fournisseur
				insert into fournisseur(nom_fournisseur, mail_fournisseur, adresse_fournisseur, code_postal_fournisseur, ville_fournisseur, pays_fournisseur)
				values (nom, mail, adresse, code_postal, ville, pays);
				set idfournisseur = last_insert_id();
			
			when 2 then
				#non renseigné (=null)
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003;
		end case;
	
        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_fournisseur_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ps_fournisseur_update`( 
			in idfour int,
			in nom varchar(255),  
			in mail varchar(255),   
			in adresse varchar(255), 
			in code_postal varchar(25), 
			in ville varchar(255), 
			in pays varchar(255),
			out errcode integer,
			out errmsg varchar(255))
begin
	declare Etatmail int; declare nbfour int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set nbfour = (select count(*) from fournisseur where fournisseur.id_fournisseur = idfour);
        set Etatmail = fx_verif_mail(mail);
        
        if (nbfour = 0) then
			#le fournisseur n'existe pas
			signal sqlstate 'EL000' set MYSQL_ERRNO=60021;
        end if;
        
        case Etatmail
			when 0 then 
				#format non respecté
				signal sqlstate 'EL000' set MYSQL_ERRNO=60001;
				
			when 1 then
				# mise à jour fournisseur
				update fournisseur
                set nom_fournisseur = nom, mail_fournisseur = mail, adresse_fournisseur = adresse, 
                code_postal_fournisseur = code_postal, ville_fournisseur = ville, pays_fournisseur = pays
				where fournisseur.id_fournisseur = idfour;
			
			when 2 then
				#non renseigné (=null)
				signal sqlstate 'EL000' set MYSQL_ERRNO=60003;
		end case;
	
        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_histoprixfournisseur_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_histoprixfournisseur_insertion`(in id_produit int,
									in id_fournisseur int,
									in prix decimal(15,3),
									out errcode integer,
									out errmsg varchar(255))
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;

		insert into histo_prix_fournisseur (prix_achat, date_chg_prix, id_fournisseur, id_produit)
		values (prix, now(), id_fournisseur, id_produit);
        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_ajoutproduit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`eclipse`@`localhost` PROCEDURE `ps_panier_ajoutproduit`(in idc int,
                                    in idp int,
                                    in quantity int,
                                    out errcode int,
                                    out errmsg varchar(1000))
begin
    declare existIdc int;
    declare comStt int;
	declare nbKey int;
    declare prixHT decimal(15,3);
    declare remise decimal(5,4);
    declare tva decimal(5,4);
    declare prixTTC decimal(15,3);
    declare newQty int;
    declare idprod int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;
    set newQty = 0;set prixHT = 0;set remise = 0;set tva = 0;set prixTTC = 0;set idprod = 0;

    set existIdc = (select count(*)
                    from commande
                    where id_commande = idc);
    if (existIdc <= 0) then
        # commande introuvable
        signal sqlstate 'EL000' set MYSQL_ERRNO=60043;
    end if;

    set comStt = (select id_statut_commande
                from histo_commande
                where id_commande = idc
    );
    if (isnull(comStt)) then
        # statut commande introuvable
        signal sqlstate 'EL000' set MYSQL_ERRNO=60044;
    end if;
    if (comStt > 2) then
        # commande déjà payé
        signal sqlstate 'EL000' set MYSQL_ERRNO=60045;
    end if;
    


    #détermination du nombres de ligne avec la clef (idc + idp)
    set nbKey = (   select count(*)
                    from commande_produit
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp );

    case nbKey
			when 0 then 
				# la ligne n'existe pas
                set newQty = quantity;

                if (newQty > 0) then
                                -- vérification de l'existance du produit
                    set idprod = (select count(*)
                                from produit
                                where id_produit = idp);
                    if (idprod = 0) then
                        # id produit introuvable
                        signal sqlstate 'EL000' set MYSQL_ERRNO=60042;
                    end if;
                    
                    set prixHT = (select prixht_produit
                                from produit
                                where id_produit = idp);
                    set prixHT = (if (isnull(prixHT),0,prixHT));
                    set tva = (select tva_produit
                                from produit
                                where id_produit = idp);
                    set tva = (if (isnull(tva),0,tva));
                    set remise = (select remise_eventuelle
                                from histo_produit
                                where id_produit = idp
                                order by date_chg_statut desc limit 1);
                    set remise = (if (isnull(remise),0,remise));
                    set prixTTC = (prixHT - remise) * (1 + tva);

                    insert into commande_produit(quantite_produit, prix_HT_unitaire_debut, remise_appliquee, tva_appliquee, prix_TTC_unitaire_final, id_commande, id_produit)
                    values (newQty, prixHT, remise, tva, prixTTC, idc, idp );
                else
                    # quantité négative
				    signal sqlstate 'EL000' set MYSQL_ERRNO=60041;
                end if;
			when 1 then
				# la ligne existe déjà
                set newQty =    (select quantite_produit
                                from commande_produit
                                where id_commande = idc
                                and id_produit = idp);
                set newQty = newQty + quantity;

                -- si quantité est négatif, on vérifie le total > 0
                if ((newQty) > 0) then
                    -- quantitée supérieure à zéro
                    update commande_produit
                    set commande_produit.quantite_produit = (newQty)
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp;
                else
                    -- quantitée inférieure à zéro
                    delete from commande_produit
                    where commande_produit.id_commande = idc
                    and commande_produit.id_produit = idp;
                end if;
			else 
				# la ligne est présente plusieur fois -> anormal
				signal sqlstate 'EL000' set MYSQL_ERRNO=60040;
		end case;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_getall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_panier_getall`(in idclient int,
                                out errcode int,
                                out errmsg varchar(1000))
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;

    select  t1.id_client, t1.id_commande, t1.remise_globale, t1.date_creation_commande, t1.date_chg_statut, t1.id_statut_commande,
            t2.quantite_produit, t2.prix_HT_unitaire_debut, t2.remise_appliquee, t2.tva_appliquee, t2.prix_TTC_unitaire_final, t2.id_produit,
            t3.nom_produit, t3.prixht_produit, t3.stock_inventaire_produit, t3.stock_minimum, t3.stock_objectif, t3.tva_produit, t3.id_type_produit
    from vw_histo_panier t1, commande_produit t2, produit t3
    where t1.id_client = idclient
    and t1.id_commande = t2.id_commande
    and t2.id_produit = t3.id_produit
    and t1.id_statut_commande > 2;

	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_getcommandefromclient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_panier_getcommandefromclient`(in idclient int, 
                                    out errcode int,
                                    out errmsg varchar(1000))
begin
  declare idcommande int;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;set idcommande = -1;

    set idcommande = (select id_commande
                    from commande
                    where id_client = idclient
                    order by date_creation_commande desc limit 1);

    if (isnull(idcommande) or (idcommande = -1)) then
			signal sqlstate 'EL000' set MYSQL_ERRNO=60060;
    end if;

		select id_commande, remise_globale, date_creation_commande, id_client
    from commande
    where id_client = idclient
    order by date_creation_commande desc limit 1;


	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_getlistcommandeproduit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`eclipse`@`localhost` PROCEDURE `ps_panier_getlistcommandeproduit`(in idcommande int, 
                                    out errcode int,
                                    out errmsg varchar(1000))
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    Start transaction;
		set errcode = 0;set errmsg = null;

		select 	commande_produit.quantite_produit,
            commande_produit.prix_HT_unitaire_debut, 
            commande_produit.remise_appliquee, 
            commande_produit.tva_appliquee, 
            commande_produit.prix_TTC_unitaire_final,
            produit.id_produit, 
            produit.nom_produit, 
            produit.prixht_produit, 
            produit.stock_inventaire_produit, 
            produit.stock_minimum, 
            produit.stock_objectif, 
            produit.tva_produit, 
            produit.id_type_produit
    from commande_produit, produit
    where id_commande = idcommande
    and commande_produit.id_produit = produit.id_produit;
    
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_panier_update`(in idc int,
                                in idp int,
                                in quantity int,
                                in remise decimal(5,4),
                                out errcode int,
                                out errmsg varchar(1000))
begin
    declare newremise decimal(5,4);
    declare prixTTC decimal(15,3);
    declare prixHT decimal(15,3);
    declare tva decimal(5,4);
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;

    set newremise = (select remise_appliquee
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set prixHT = (select prix_HT_unitaire_debut
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set tva = (select tva_appliquee
                    from commande_produit
                    where id_produit = idp
                    and id_commande = idc);
    set newremise = (if (isnull(remise),newremise,remise));
    set prixTTC = (prixHT * (1 - newremise)) * (1 + tva);
    
	start transaction;
    # initialisation des variables
    set errcode = 0; set errmsg = null;
    if (quantity <= 0) then
        # commande introuvable
        delete from commande_produit
        where id_commande = idc
        and id_produit = idp;
    else
        update commande_produit
        set commande_produit.quantite_produit = quantity,
            commande_produit.remise_appliquee = newremise,
            commande_produit.prix_TTC_unitaire_final = prixTTC
        where commande_produit.id_commande = idc
        and commande_produit.id_produit = idp;
    end if;

	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_panier_validation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_panier_validation`(
	in idc int,
	out errcode int,
	out errmsg varchar(1000))
begin
declare isError boolean;
declare fin_lecture_ligne int default 0;
declare _quantity int (11);
declare _idp int (11);   
declare _qtyDispo int (11); 
declare listeCP cursor for 	select commande_produit.quantite_produit,
							commande_produit.id_produit
							from commande_produit
							where commande_produit.id_commande = idc;
                            
declare continue handler for not found set fin_lecture_ligne = 1;
declare continue handler for 65000
begin
	insert into tmp_panier values (_idp, _qtyDispo);
	set isError = true;
end;
declare exit handler for sqlexception
begin
	get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
	set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
	rollback;
end;
start transaction;
	drop temporary table if exists tmp_panier ;
	create temporary table tmp_panier(
			tmp_idp int (11),
			tmp_quantityDispo int (11));
commit;
        
start transaction;
	set errcode = 0; set errmsg = null; set isError = false;
	open listeCP;
	fetch listeCP into _quantity, _idp;
	repeat
		set _qtyDispo = (SELECT produit.stock_inventaire_produit
		FROM produit
		WHERE produit.id_produit = _idp);
    
		update produit
		set produit.stock_inventaire_produit = (_qtyDispo - _quantity)
		where produit.id_produit = _idp;
        
        if ((_qtyDispo - _quantity) < 0) then
			signal sqlstate 'WL000' set MYSQL_ERRNO=65000, MESSAGE_TEXT = "quantity neg";
        end if;
            
	fetch listeCP into _quantity, _idp;
		until fin_lecture_ligne = 1
	end repeat;
	close listeCP;
    
    -- mise à jour du statut
    insert into histo_commande
    values (now(), 3, idc);
    
    if (isError) then
		select * from tmp_panier;
        rollback;
	else
		commit;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_produitgenreproduit_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_produitgenreproduit_insertion`(in id_produit int,
									in id_genreproduit int,
									out errcode integer,
									out errmsg varchar(255))
begin
    declare id_type_prod int;
    declare exit handler for 1062 # 1062 : Duplicate entry (relation type - genre déjà présente)
    begin
		declare nbmail int;
        set errcode = 60035;
        set errmsg = fx_donne_errmsg(errcode);
		rollback;
	end;
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;
        set id_type_prod = (select id_type_produit 
                            from produit
                            where produit.id_produit = id_produit);
        
        if (isnull(id_type_prod)) then
            signal sqlstate 'EL000' set MYSQL_ERRNO=60034, MESSAGE_TEXT = "erreur logiciel";
        end if;

        case (fx_verif_genre_type_produit(id_type_prod, id_genreproduit))
            when -2 then
                signal sqlstate 'EL000' set MYSQL_ERRNO=60032, MESSAGE_TEXT = "erreur logiciel";
            when -1 then
                signal sqlstate 'EL000' set MYSQL_ERRNO=60031, MESSAGE_TEXT = "erreur logiciel";
            when 0 then 
                signal sqlstate 'EL000' set MYSQL_ERRNO=60030, MESSAGE_TEXT = "erreur logiciel";
            when 1 then
                insert into produit_genre_produit(id_produit, id_genre_produit)
                values(id_produit, id_genreproduit);
            else
                signal sqlstate 'EL000' set MYSQL_ERRNO=60033, MESSAGE_TEXT = "erreur logiciel";
            end case;

        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_produit_insertion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`eclipse`@`localhost` PROCEDURE `ps_produit_insertion`(in nom_produit varchar(255), 
									in prixht_produit decimal(15,3), 
									in stock_inventaire_produit int, 
									in stock_minimum int, 
									in stock_objectif int, 
									in tva_produit decimal(5,4), 
									in id_type_produit int,
									out errcode integer,
									out errmsg varchar(255),
									out id_produit integer)
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null; set id_produit = -1;
		set @date_dispo_produit = now();

		insert into produit (nom_produit, prixht_produit, stock_inventaire_produit, stock_minimum, stock_objectif, tva_produit, id_type_produit)
		values (nom_produit, prixht_produit, stock_inventaire_produit, stock_minimum, stock_objectif, tva_produit, id_type_produit);
		set id_produit = last_insert_id();
        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ps_produit_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chatnoir`@`localhost` PROCEDURE `ps_produit_update`(in idproduit int,
                                    in nom_produit varchar(255), 
									in prixht_produit decimal(15,3), 
									in stock_inventaire_produit int, 
									in stock_minimum int, 
									in stock_objectif int, 
									in tva_produit decimal(5,4), 
									in id_type_produit int,
									out errcode integer,
									out errmsg varchar(255))
begin
	declare exit handler for sqlexception
    begin
		get diagnostics condition 1 errcode = MYSQL_ERRNO, errmsg = message_text;
		set errmsg = (if(errcode >=60000,fx_donne_errmsg(errcode),errmsg));
		rollback;
    end;
    
	start transaction;
		set errcode = 0; set errmsg = null;

		update produit
        set produit.nom_produit = nom_produit, 
        produit.prixht_produit = prixht_produit, 
        produit.stock_inventaire_produit = stock_inventaire_produit, 
        produit.stock_minimum = stock_minimum, 
        produit.stock_objectif = stock_objectif, 
        produit.tva_produit = tva_produit, 
        produit.id_type_produit = id_type_produit
		where produit.id_produit = idproduit;

        commit;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_histo_panier`
--

/*!50001 DROP VIEW IF EXISTS `vw_histo_panier`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`chatnoir`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_histo_panier` AS select `t2`.`id_client` AS `id_client`,`t2`.`remise_globale` AS `remise_globale`,`t2`.`date_creation_commande` AS `date_creation_commande`,`t1`.`id_commande` AS `id_commande`,`t1`.`id_statut_commande` AS `id_statut_commande`,`t1`.`date_chg_statut` AS `date_chg_statut` from (`histo_commande` `t1` join `commande` `t2`) where ((`t1`.`id_commande` = `t2`.`id_commande`) and (`t1`.`date_chg_statut` = (select max(`t3`.`date_chg_statut`) from `histo_commande` `t3` where (`t3`.`id_commande` = `t1`.`id_commande`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-20 15:18:34
