#!/bin/bash

if pidof -x $0 -o $$; then
  echo "Process already running"
  exit 1
else 
	echo 'Empiezo'
fi


cd Ejercicio1
mv NM_014244-4.fas ..
cd ..

vi ex4out.txt

mkdir Ejercicio4
python3 ex4.py prosite.dat NM_014244-4.fas ex4out.txt
mv ex4out.txt Ejercicio4
