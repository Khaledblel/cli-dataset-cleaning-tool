#!/bin/bash

supprimer_vides() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    # Compter avant
    avant=$(wc -l < "$CURRENT_FILE")

    fichier_propre="sans_vides_$CURRENT_FILE"
    > "$fichier_propre"

    while read line; do
        if test -n "$line"; then
            echo "$line" >> "$fichier_propre"
        fi
    done < "$CURRENT_FILE"

    # Compter après
    apres=$(wc -l < "$fichier_propre")
    supprimees=$((avant - apres)) # calcul de différence

    CURRENT_FILE="$fichier_propre"
    echo "Succès : $supprimees lignes vides ont été supprimées."
    echo "Nouveau total : $apres lignes."
}

supprimer_non_annotees() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    # Compter avant
    avant=$(wc -l < "$CURRENT_FILE")
    
    
    grep -v "NULL" "$CURRENT_FILE" > annotated.csv
    
    # Compter après
    apres=$(wc -l < "annotated.csv")
    supprimees=$((avant - apres))

    CURRENT_FILE="annotated.csv"
    echo "Succès : $supprimees lignes contenant 'NULL' ont été supprimées."
    echo "Nouveau total : $apres lignes."
}

supprimer_doublons() {
    if test -z "$CURRENT_FILE"; then
        echo "Erreur : Aucun dataset chargé."
        return
    fi

    # compter avant
    avant=$(wc -l < "$CURRENT_FILE")
    sort -u "$CURRENT_FILE" > sans_doublons.csv
    
    # compter après
    apres=$(wc -l < "sans_doublons.csv")
    supprimees=$((avant - apres))

    CURRENT_FILE="sans_doublons.csv"
    echo "Succès : $supprimees doublons ont été supprimés."
    echo "Nouveau total : $apres lignes."
}
