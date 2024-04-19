#!/bin/bash

DIR=${1:-zadanie2}

#UWAGA 1 - sprawdzenie istnienie katalogow
if [ ! -d "$DIR" ]; then
    echo "Nie istnieje taki katalog"
    exit 1
	#UWAGA 2 - sprawdzenie podania argumentu
	if [ "$#" -ne 1 ]; then
		 echo "Argumenty nie jest podany"
		 return 1
	fi
fi


for item in "$DIR"/*; do
    if [ -f "$item" ]; then
        extension="${item##*.}"
        case "$extension" in
            bak)
                chmod 600 "$item"  
                ;;
            txt)
                chmod 664 "$item"  
                ;;
            exe)
                chmod 755 "$item"
                ;;
        esac
    elif [ -d "$item" ]; then
        extension="${item##*.}"
        case "$extension" in
            bak)
                chmod 711 "$item" 
                ;;
            tmp)
                chmod 700 "$item" 
                ;;
        esac
    fi
done
	


