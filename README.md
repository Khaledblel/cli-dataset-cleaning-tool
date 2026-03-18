# CLI Dataset Cleaning Tool

Un outil en ligne de commande (CLI) écrit en Bash pour automatiser le nettoyage et la préparation de jeux de données CSV.

## 🚀 Fonctionnalités

Cet outil propose un menu interactif pour effectuer les tâches suivantes :
- **Chargement** : Importer un fichier CSV pour traitement.
- **Statistiques** : Afficher un résumé statistique du dataset.
- **Nettoyage** :
  - Supprimer les lignes vides.
  - Supprimer les lignes non annotées (données manquantes).
  - Supprimer les doublons.
- **Préparation** :
  - Diviser le dataset en ensembles d'entraînement (Train) et de test (Test).
  - Organiser automatiquement les fichiers dans des dossiers dédiés.
- **Rapport** : Générer un rapport final des modifications effectuées.

## 🛠️ Installation et Utilisation

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/Khaledblel/cli-dataset-cleaning-tool.git
   cd cli-dataset-cleaning-tool
   ```

2. **Accorder les permissions d'exécution** :
   ```bash
   chmod +x main.sh
   chmod +x modules/*.sh
   ```

3. **Lancer l'outil** :
   ```bash
   ./main.sh
   ```

## 📁 Structure du Projet

- `main.sh` : Point d'entrée principal de l'application.
- `modules/` : Contient les scripts spécialisés (IO, Statistiques, Nettoyage, Division).
- `titanic.csv` : Exemple de dataset pour tester l'outil.

## ⚖️ Licence

Ce projet est sous licence MIT.
