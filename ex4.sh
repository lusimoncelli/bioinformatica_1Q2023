#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 10
else 
	echo 'Empiezo'
fi


cd genes
mv ADAMTS2.gb ..
cd ..

touch ex4out.txt

mkdir Ejercicio4

if [[ -f "ex4.py" && -f "prosite.dat" ]]; then
	python3 ex4.py prosite.dat ADAMTS2.gb
	patmatmotifs output_protein.fasta -outfile ex4out.txt
	mv ADAMTS2.fasta Ejercicio4
	mv output_protein.fasta Ejercicio4
	mv ex4out.txt Ejercicio4
	mv prosite.dat Ejercicio4
	mv ADAMTS2.gb genes
else
	echo "Falta el archivo ex4.py ó prosite.dat"
	exit 11
fi 
