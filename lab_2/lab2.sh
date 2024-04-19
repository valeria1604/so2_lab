#!/bin/bash

DIR_1=${1:-nr1}
DIR_2=${2:-nr2}

#UWAGA 1 - sprawdzenie istnienie katalogow
if [ ! -d "$DIR_1" ] || [ ! -d "$DIR_2" ]; then
    echo "Nie istnieja takie katalogi"
    exit 1
	#UWAGA 2 - sprawdzenie podania dwoch argumentow
	if [ "$#" -ne 2 ]; then
		 echo "Argumenty nie sa podane"
		 return 1
	fi
fi


# zadanie 1
echo  "Pliki w katalogu nr 1"

for file in "$DIR_1"/*; do
	if [[ -f "$file" ]]; then
		echo "$file - plik regularny"
	elif [ -d "$file" ]; then
		echo "$file - katalog"
	elif [[ -L "$file" ]]; then
		echo "$file - dowiązanie symboliczne"
	else
		echo "Plik jest innego formatu"
	fi
done

# Utworzenie dowiązań symbolicznych dla plików regularnych w nr 2
echo "Utworzenie dowiązań symbolicznych dla plików regularnych w nr 2"
for file in "$DIR_2"/*; do
	if [[ -f "$file" ]]; then
		FILE_NAME=$(basename "$file")
		FILE_UPPER_NAME="${FILE_NAME%.*}"
		FILE_UPPER_NAME="${FILE_UPPER_NAME^^}"
		
		echo "Litery pliku sa zmienione na: $FILE_UPPER_NAME"
		ln -s "$DIR_2/$FILE_NAME" "$DIR_2/${FILE_UPPER_NAME}_ln.${FILE_NAME##*.}"
	fi
done

# Utworzenie dowiązań symbolicznych dla katalogow w nr 1
echo "Utworzenie dowiązań symbolicznych dla katalogow w nr 1"
for dir in "$DIR_1"/*; do
    if [ -d "$dir" ]; then
        DIR_NAME=$(basename "$dir")
        DIR_UPPER_NAME="${DIR_NAME%.*}"
		DIR_UPPER_NAME="${DIR_UPPER_NAME^^}"
		
		echo "Litery katalogu sa zmienione na: $DIR_UPPER_NAME"
        ln -s "$DIR_1/$DIR_NAME" "$DIR_1/${DIR_UPPER_NAME}_ln"
    fi
done
	
	


