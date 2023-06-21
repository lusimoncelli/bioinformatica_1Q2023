import sys
import os

if len(sys.argv) != 4:
    print("Wrong arguments amount")
    exit(1)

prosite = sys.argv[1]
gb = sys.argv[2]

os.system("seqret -sequence "+ gb + " -outseq ADAMTS2.fasta")

os.system("transeq -sequence ADAMTS2.fasta -outseq output_protein.fasta")



