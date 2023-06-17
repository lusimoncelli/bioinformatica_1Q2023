#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 8
else 
	echo 'Empiezo'
fi

cd Ejercicio1
path=$(pwd)
cd ..
mkdir Ejercicio2

touch blast.out

if [ls ex2.py | wc -l]; then
	echo "Ejecuto el .py"
	python3 ex2.py $path blast.out

	mv blast.out Ejercicio2

	echo "Termino el .py"
else
	echo "Falta el archivo ex2.py"
	exit 9
fi

