import sys
import os

if len(sys.argv) != 4:
    print("Wrong arguments amount")
    exit(1)

prosite = sys.argv[1]
file = sys.argv[2]
out = sys.argv[3]


os.system("transeq -sequence " + file + " -outseq Ejercicio4/transeq.txt")

os.system("patmatmotifs -sequence Ejercicio4/transeq.txt -outfile out -full -auto")



