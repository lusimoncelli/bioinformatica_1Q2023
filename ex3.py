import sys
import subprocess
from Bio import AlignIO
from Bio.Align import MultipleSeqAlignment
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import os


seqs = []
path = sys.argv[1]
path2 = sys.argv[2]

with open(path+'/blast.out', "r") as f:
    data = f.read()
    queries = data.split("sbjct: ")[1:]  # split the data by "Query" and discard the first element
    
    for query in queries:
        seqs += [query.split("\n")[0]] # get the first line of each query
top_seqs = []

for i in range(11):
	top_seqs += [SeqRecord(Seq(seqs[i]), id= str(i))]
	

SeqIO.write(top_seqs, "Secuencias.fasta", "fasta")

command = "/muscle5.1.linux_intel64 -align Secuencias.fasta -output MSA.fasta"
os.system(path2+command)


