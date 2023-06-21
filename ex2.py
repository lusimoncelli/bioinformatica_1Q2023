import sys
from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML
import os

path = sys.argv[1]
carpetas=os.listdir(path)
len_max=0

for j in range(len(carpetas)):
    objeto=SeqIO.read(path+"/"+carpetas[j],'fasta')
    seq_len=len(objeto.seq)
    if(seq_len>len_max):
    	len_max = seq_len
    	seq_max = carpetas[j]


print('La secuencia mas larga fue',seq_max, 'y tiene',len_max,'aminoacidos')

objeto = SeqIO.read(path+'/'+seq_max, 'fasta')
seq = objeto.seq

archivo_fasta=open(path+'/'+seq_max).read()
resultado=NCBIWWW.qblast("blastp","nr",archivo_fasta)
registro=NCBIXML.read(resultado)

E_value= 0.05
salida= "Alineamiento 0 \nsbjct: %s\n\n" %seq
i=1

for alineamiento in registro.alignments:
    for hsp in alineamiento.hsps:
        if hsp.expect < E_value:
            salida += "Alineamiento %d \n" %i
            salida += "Secuencia: %s \n" %alineamiento.hit_def.split('>')[0]
            salida += "Entrada: %s\n" %alineamiento.hit_id.split('|')[1]
            salida += "Longitud: %d\n" %alineamiento.length
            salida += "Puntaje: %d\n" %hsp.score
            salida += "Identidad: %d/%d (%.2f%%)\n" %(hsp.identities, hsp.align_length, (100* hsp.identities / hsp.align_length))
            salida += "E-value: %f\n" %hsp.expect
            salida += "Query: %s\n" %hsp.query
            salida += "Match: %s\n" %hsp.match
            salida += "sbjct: %s\n\n" %hsp.sbjct
            i+=1

archivo=open(sys.argv[2],"w")
archivo.write(salida)
archivo.close()

