# 📊 Projet Data Warehouse - Base Chinook (Rétro-conception & Modélisation)

## 📌 Présentation du Projet
Ce projet s'inscrit dans le cadre de la conception et du déploiement d'un **Data Warehouse (DWH)** pour l'analyse des ventes et du comportement client basés sur la base de données **Chinook** (gestionnaire de magasin de musique en ligne).

L'objectif principal de la première phase est d'effectuer la **rétro-conception** de la base opérationnelle (OLTP) afin d'en extraire un modèle décisionnel (OLAP) optimisé pour le suivi des performances commerciales et de la rentabilité.

---

## 🛠️ Phase 1 : Rétro-conception et Création du DWH

### 1. Analyse de la Base Source (OLTP)
- **Base d'origine :** Base relationnelle `Chinook`.
- **Rétro-conception :** Identification des entités clés (clients, employés, factures, pistes/morceaux, albums, genres, artistes) et analyse des contraintes d'intégrité (clés primaires, clés étrangères).

### 2. Modélisation Décisionnelle (OLAP)
Passage du schéma relationnel normalisé à un **schéma en étoile (Star Schema)** / **en flocon (Snowflake Schema)** centré sur l'analyse des ventes.

- **Table de Faits :** 
  - `Fait_Ventes` / `Fact_Sales` (contient les mesures : montant total, quantité vendue, prix unitaire, réductions, etc.)
- **Tables de Dimensions :**
  - `Dim_Client` / `Dim_Customer` (historisation des informations clients, géographie)
  - `Dim_Piste` / `Dim_Track` (morceau, album, genre, média)
  - `Dim_Artiste` / `Dim_Artist`
  - `Dim_Temps` / `Dim_Date` (pour les analyses temporelles : année, trimestre, mois, jour de la semaine)

### 3. Implémentation du Data Warehouse
- **Conception du DDL (Data Definition Language) :** Création des tables dimensionnelles et de la table de faits.
- **Processus ETL / ELT :** Extraction des données OLTP, nettoyage/transformation (gestion des types de données, création des clés substitutives / *surrogate keys*) et chargement dans le Data Warehouse.

---

## 🏗️ Phase 2 : Architecture de la Chaîne Décisionnelle (DSA, ODS & DWH)

Pour structurer proprement le flux de données depuis la source OLTP jusqu'à la restitution, l'architecture globale repose sur trois couches successives :

### 1. Zone de Staging (DSA - Data Staging Area)
- **Rôle :** Zone tampon technique intermédiaire.
- **Fonctionnement :** Extraction brute des données de la base source Chinook sans transformation lourde, servant de point de départ sécurisé pour les traitements ultérieurs.

### 2. Operational Data Store (ODS)
- **Rôle :** Espace de stockage intermédiaire et de consolidation.
- **Fonctionnement :** Nettoyage, standardisation, déduplication et application des règles de gestion basiques sur les données avant d'alimenter l'entrepôt final.

### 3. Entrepôt de Données Final (DWH)
- **Rôle :** Stockage centralisé des données historisées et structurées selon le modèle dimensionnel (schéma en étoile).
- **Fonctionnement :** Intégration des clés substitutives (*surrogate keys*) et gestion de l'historisation pour permettre les analyses multidimensionnelles.

### 4. Alimentation et Flux ETL
- **Outils & Traitements :** Mise en place des flux et scripts d'orchestration via SQL Server pour automatiser le pipeline :
  - `Extraction` depuis la source OLTP vers la DSA.
  - `Transformation` et nettoyage au niveau de l'ODS.
  - `Chargement` (Load) des dimensions et des faits dans le DWH.

---

## 💻 Technologies & Outils Utilisés
- **SGBD Source & Cible :** SQL Server 
- **Modélisation :** Looping
- **ETL / Dataviz :** SQL Server, Power BI