#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 10
else 
	echo 'Empiezo'
fi

cd Ejercicio2
path=$(pwd)
cd ..
mkdir Ejercicio3

if [ls ex3.py | wc -l && ls muscle5.1.linux_intel64 | wc -l]; then
	echo "Ejecuto el .py"
	python3 ex3.py $path 
	mv MSA.fasta Ejercicio3
	echo "Termino el .py"
else
	echo "Falta el archivo ex3.py ó muscle"
	exit 11
fi

