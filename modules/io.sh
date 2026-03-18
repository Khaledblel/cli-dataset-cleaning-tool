#!/bin/bash

charger_dataset() {
    read -p "Entrez le chemin du fichier CSV : " chemin
    
    # Vérifie si le fichier existe (-f)
    if test -f "$chemin"; then
        CURRENT_FILE="$chemin"
        echo "Succès : Fichier '$CURRENT_FILE' chargé dans la variable globale."
    else
        echo "Erreur : Le fichier '$chemin' est introuvable."
    fi
}
