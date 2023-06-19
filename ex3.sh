#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 10
else 
	echo 'Empiezo'
fi

path=$(pwd)
mkdir Ejercicio3

if [[ -f "ex3.py" && -f "muscle5.1.linux_intel64" ]]; then
	echo "Ejecuto el .py"
	touch "MSA.fasta"
	python3 ex3.py $path 
	mv MSA.fasta Ejercicio3
	echo "Termino el .py"
else
	echo "Falta el archivo ex3.py ó muscle"
	exit 11
fi 

