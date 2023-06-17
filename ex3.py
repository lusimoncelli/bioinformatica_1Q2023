import sys
from Bio import AlignIO
from Bio.Align import MultipleSeqAlignment
from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import os


seqs = []
path = sys.argv[1]

with open(path+'/blast.out', "r") as f:
    data = f.read()
    queries = data.split("Query: ")[1:]  # split the data by "Query" and discard the first element
    
    for query in queries:
        seqs += [query.split("\n")[0]] # get the first line of each query
top_seqs = []

for i in range(11):
	top_seqs += [SeqRecord(Seq(seqs[i]), id= str(i))]
	
print(len(top_seqs))

SeqIO.write(top_seqs, "Secuencias.fasta", "fasta")

os.system("/home/ITBADC/guvarela/Documentos/muscle5.1.linux_intel64 -align Secuencias.fasta -output Ejercicio3/MSA.fasta")

