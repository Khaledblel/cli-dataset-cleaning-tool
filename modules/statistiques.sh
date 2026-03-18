#!/bin/bash

afficher_statistiques() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    total=$(wc -l < "$CURRENT_FILE")
    non_vides=$(grep -c "." "$CURRENT_FILE")
    nulls=$(grep -c "NULL" "$CURRENT_FILE")

    echo "--- Statistiques de $CURRENT_FILE ---"
    echo "Nombre total de lignes : $total"
    echo "Nombre de lignes non vides : $non_vides"
    echo "Nombre de lignes contenant 'NULL' : $nulls"
    echo "---------------------------------------"
}

generer_rapport() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    total=$(wc -l < "$CURRENT_FILE")
    date_actuelle=$(date)
    
    if test -z "$POURCENTAGE_TRAIN"; then
        ratio="Non effectué"
    else
        ratio="$POURCENTAGE_TRAIN / $((100 - POURCENTAGE_TRAIN))"
    fi

    # Création du rapport
    > dataset_report.txt
    echo "Nombre total des données : $total" >> dataset_report.txt
    echo "Pourcentage train/test : $ratio" >> dataset_report.txt
    echo "Date : $date_actuelle" >> dataset_report.txt

    echo "Succès : Rapport généré sous le nom 'dataset_report.txt'."
}
