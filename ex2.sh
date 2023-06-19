#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 10
else 
	echo 'Empiezo'
fi

cd Ejercicio1
path=$(pwd)
cd ..
mkdir Ejercicio2

touch blast.out

if [ -f "ex2.py" ]; then
	echo "Ejecuto el .py"
	python3 ex2.py $path blast.out

	mv blast.out Ejercicio2

	echo "Termino el .py"
else
	echo "Falta el archivo ex2.py"
	exit 9
fi

