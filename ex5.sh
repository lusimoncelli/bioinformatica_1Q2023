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

vi ex5out.txt

mkdir Ejercicio5
python3 ex5.py prosite.dat NM_014244-4.fas ex5out.txt
mv ex5out.txt Ejercicio5