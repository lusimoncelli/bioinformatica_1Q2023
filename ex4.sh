#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 10
else 
	echo 'Empiezo'
fi


cd Ejercicio1
mv NM_014244-4.fas ..
cd ..

touch ex4out.txt

mkdir Ejercicio4

if [[ -f "ex4.py" && -f "prosite.dat" ]]; then
	python3 ex4.py prosite.dat NM_014244-4.fas ex4out.txt
	mv ex4out.txt Ejercicio4
	mv prosite.dat Ejercicio4
	mv NM_014244-4.fas Ejercicio1
else
	echo "Falta el archivo ex4.py ó prosite.dat"
	exit 11
fi 
