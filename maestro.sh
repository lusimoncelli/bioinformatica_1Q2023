#!/bin/bash

filename="$(date +'%Y%m%d').log"
touch "$filename"

if pidof -x $0 -o $$; then
  echo "Process already running" >>"$filename"
  exit 10
else 
	echo 'Empiezo'
fi

mkdir genes
cd genes

accesion_number="NM_014244.5"
output_file="ADAMTS2.gb"

url="https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?db=nuccore&dopt=gbwithparts&val=${accesion_number}&extrafeat=null&fmt_mask=0&retmode=text&withmarkup=on&log$=seqview&maxdownloadsize=1000000"
wget -O "${output_file}" "${url}"

cd ..

#Ejercicio 1
if [ -f "ex1.sh" ]; then
	echo "Ejecuto el ejercicio 1" >> "$filename"
	
	chmod 777 ex1.sh
	source ex1.sh

	echo "Termino el ejercicio 1" >> "$filename"
else
	echo "Falta el archivo ex1.sh" >> "$filename"
	exit 2001
fi >> "$filename"

#Ejercicio 2
if [ -f "ex2.sh" ]; then
	echo "Ejecuto el ejercicio 2" >> "$filename"
	
	chmod 777 ex2.sh
	source ex2.sh

	echo "Termino el ejercicio 2" >> "$filename"
else
	echo "Falta el archivo ex2.sh" >> "$filename"
	exit 2002
fi >> "$filename"

#Ejercicio 3
if [ -f "ex3.sh" ]; then
	echo "Ejecuto el ejercicio 3" >> "$filename"
	
	chmod 777 ex3.sh
	source ex3.sh

	echo "Termino el ejercicio 3" >> "$filename"
else
	echo "Falta el archivo ex3.sh" >> "$filename"
	exit 2003
fi >> "$filename"
