import sys
import os

if len(sys.argv) != 4:
    print("Wrong arguments amount")
    exit(1)

prosite = sys.argv[1]
gb = sys.argv[2]
out = sys.argv[3]

os.system("seqret -sequence "+ gb + " -outseq ADAMTS2.fasta")

os.system("transeq -sequence ADAMTS2.fasta -outseq output_protein.fasta")
os.system("prosextract ./")
os.system("patmatmotifs -sequence output_protein.fasta -outfile " + out +" -full -auto")



