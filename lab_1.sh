#!/bin/bash

#pobiera 3 argumenty: SOURCE_DIR, RM_LIST, TARGET_DIR o wartościach domyślnych: 
# lab_uno, 
# 2remove, 
# bakap
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

# jeżeli TARGET_DIR nie istnieje, to go tworzymy
if [[ -d "$TARGET_DIR" ]] 
then
	echo "Juz istnieje TARGET_DIR"	
else 
	mkdir -p "$TARGET_DIR"
	echo "Stworzono TARGET_DIR"
fi


# iterujemy się po zawartości pliku RM_LIST i 
# tylko jeżeli plik o takiej nazwie występuje w katalogu SOURCE_DIR, 
# to go usuwamy
for item in $(cat "$RM_LIST"); do 
	if [[ -e "$SOURCE_DIR/$item" ]]; then
		rm -rf "$SOURCE_DIR/$item"
		echo "Usunieto plik o takiej samej nazwie: $item"
	fi
done


# jeżeli jakiegoś pliku nie ma na liście, ale:
# ale jest plikiem regularnym, to przenosimy go do TARGET_DIR
# ale jest katalogiem, to kopiujemy go do TARGET_DIR z zawartością
COUNTER_FILES=0
for file in "$SOURCE_DIR"/*; do
	if [[ -f "$file" ]]; then
		mv "$file" "$TARGET_DIR/"
		echo "$file przesunieto"
	elif [[ -d "$file" ]]; then
		cp -r "$file" "$TARGET_DIR/"
		echo "$file skopiowano"
	else
		COUNTER_FILES=$((COUNTER_FILES+1))
	fi
done

# jeżeli po zakończeniu operacji są jeszcze jakieś pliki w katalogu SOURCE_DIR to
# piszemy np. „jeszcze coś zostało” na konsolę oraz
# jeżeli co najmniej 2 pliki, to wypisujemy: „zostały co najmniej 2 pliki”\
# jeżeli więcej niż 4, to wypisujemy: „zostało więcej niż 4 pliki” 
# (UWAGA: 4, to też więcej niż 2)
# jeżeli nie więcej, niż 4, ale co najmniej 2, to też coś piszemy
# Jeżeli nic nie zostało, to informujemy o tym słowami np. „tu był Kononowicz”

if [[ ${COUNTER_FILES} -gt 0 ]]; then
	echo "Jeszcze sa inne pliki"
	if [[ ${COUNTER_FILES} -ge 2 ]]; then
		echo "zostały co najmniej 2 pliki"
		if [[ ${COUNTER_FILES} -lt 4 ]] ; then
			echo "zostały co najmniej 2 pliki, ale nie wiecej niz 4"
		fi
	fi
		
	if [[ ${COUNTER_FILES} -gt 4 ]]; then
		echo "Zostało więcej niż 4 pliki"
	fi	
else
	echo "Nic nie ma innego w katalogu"		
fi 
		
# po wszystkich spakuj katalog TARGET_DIR i nazwij bakap_DATA.zip, 
# gdzie DATA to dzień uruchomienia skryptu w formacie RRRR-MM-DD
DATA=$(date -I)
zip -r "bakap_${DATA}.zip" "$TARGET_DIR"
echo "Katalog jest spakowany"







		
		







	




