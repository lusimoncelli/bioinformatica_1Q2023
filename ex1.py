from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import sys

secuencia=SeqIO.read(sys.argv[1],"gb")
longitud_minima=100

i=1

for cadena,nuc in [(+1,secuencia.seq),(-1,secuencia.seq.reverse_complement())]:
    for marco in range(3):
        longitud=3*((len(secuencia)-marco)//3)

        for proteina in nuc[marco:marco+longitud].translate().split("*"):
            if len(proteina) >= longitud_minima:
                ORF_seq= SeqRecord(proteina)
                ORF_seq.id=secuencia.name
                ORF_seq.description= "ORF%d" %i
                SeqIO.write(ORF_seq,"%s-%d.fas" %(secuencia.name,i),'fasta')
                i+=1
