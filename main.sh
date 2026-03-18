#!/bin/bash

source ./modules/io.sh
source ./modules/statistiques.sh
source ./modules/nettoyage.sh
source ./modules/division.sh

# Variables globales
export CURRENT_FILE=""
export POURCENTAGE_TRAIN=""

while true; do
    echo "======================================"
    echo "        GESTION DES DONNÉES           "
    echo "======================================"
    echo "1. Charger un dataset"
    echo "2. Afficher statistiques du dataset"
    echo "3. Supprimer lignes vides"
    echo "4. Supprimer lignes non annotées"
    echo "5. Supprimer doublons simples"
    echo "6. Diviser en Train/Test"
    echo "7. Organiser dossiers train/test"
    echo "8. Générer rapport"
    echo "9. Quitter"
    echo "======================================"
    
    read -p "Veuillez choisir une option (1-9) : " choix
    
    case $choix in
        1) charger_dataset ;;
        2) afficher_statistiques ;;
        3) supprimer_vides ;;
        4) supprimer_non_annotees ;;
        5) supprimer_doublons ;;
        6) diviser_train_test ;;
        7) organiser_dossiers ;;
        8) generer_rapport ;;
        9) 
            echo "Fermeture de l'outil. Au revoir !"
            exit 0 
            ;;
        *) 
            echo "Erreur : Choix invalide. Veuillez réessayer." 
            ;;
    esac
    echo ""
done
