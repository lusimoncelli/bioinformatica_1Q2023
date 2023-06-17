#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 6
else 
	echo 'Empiezo'
fi

mkdir Ejercicio1
cd genes
mv ADAMTS2.gb ../Ejercicio1

cd ..

if [ls ex1.py | wc -l]; then
	echo "Ejecuto el .py"
	
	chmod 777 ex1.py
	mv ex1.py Ejercicio1
	cd Ejercicio1

	python3 ex1.py ADAMTS2.gb
	
	mv ex1.py ..
	mv ADAMTS2.gb ../genes

	echo "Termino el .py"
else
	echo "Falta el archivo ex1.py"
	exit 7
fi


