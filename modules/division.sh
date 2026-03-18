#!/bin/bash

diviser_train_test() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    read -p "Demander pourcentage train (ex: 80) : " POURCENTAGE_TRAIN
    
    # Calcul du nombre de lignes
    total=$(wc -l < "$CURRENT_FILE")
    nb_train=$((total * POURCENTAGE_TRAIN / 100))
    nb_test=$((total - nb_train))

    # head et tail pour diviser
    head -n "$nb_train" "$CURRENT_FILE" > train.csv
    tail -n "$nb_test" "$CURRENT_FILE" > test.csv

    echo "Division terminée : $nb_train pour Train, $nb_test pour Test."
}

organiser_dossiers() {
    # Vérifie que les fichiers ont bien été générés
    if test ! -f "train.csv" || test ! -f "test.csv"; then
        echo "Erreur : Les fichiers train.csv et test.csv n'existent pas. Faites la division d'abord."
        return
    fi

    # Création des dossiers et déplacement
    mkdir -p train test
    mv train.csv train/
    mv test.csv test/

    echo "Succès : Dossiers 'train' et 'test' créés et fichiers déplacés."
}
