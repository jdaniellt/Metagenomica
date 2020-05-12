## Tutorial to process raw ITS2 data (fungi) generated with the Illumina MiSeq platform using the AMPtk program
## Author: José Daniel Lara-Tufiño
## Date: 12/05/20

### Connect to the cluster: CONABIO ssh -p 45789 cirio@200.12.166.164
### From our directory (previously created), we will work with the data that is in metagenomics/fastq.
#### 1. Pre-processing FASTQ files

##### Assemble the forward and reverse reads, and eliminate the primers and short sequences.

amptk illumina -i ../metagenomica/fastq -o amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 300 --min_len 200 --full_length --cleanup

##### -i, input folder with FASTQ files

##### -o, output name

##### -f, forward primer sequence (here: gITS7ngs)

##### -r, -reverse primer sequence (here: ITS4ngsUni)

##### -l, lenght of reads (here: 300 bp)

##### --min_len, minimum length to keep a sequence

##### --full_length, keep only full length sequences

##### --cleanup, remove intermediate files

#### 2. Clustering at 97% similarity with UPARSE
#En ese paso se hace un filtro de calidad (incluso de las secuencias chimericas) y se agrupan las secuencias en OTUs

amptk cluster -i amptk.demux.fq.gz -o cluster -m 2 --uchime_ref ITS

##### -i, input folder with paired sequences

##### -o, output name

##### -m, minimum number of reads for valid OTU to be retained (singleton filter)

##### --uchime_ref, run chimera filtering (ITS, LSU, COI, 16S, custom path)

### 3. Filtering the OTU table (index bleed)
####  Index bleed = reads assigned to the wrong sample during the Illumina sequencing process. It is frequent (!!) and also with a variable degree between several runs. In that step, an artificial positive control (mock) can be used to measure the degree of index bleed within a run. If the run did not include an artificial mock, this threshold can be defined manually (generally 0.005% is used).

amptk filter -i cluster.otu_table.txt -o filter -f cluster.cluster.otus.fa -p 0.005 --min_reads_otu 2

##### -i, input OTU table

##### -o, output name

##### -f, fasta file with reference sequence for each OTU

##### -p, % index bleed threshold between samples (if not calculated)

##### --min_reads_otu, minimum number of reads for valid OTU to be retained (singleton filter)

#### 4. Assign taxonomy to each OTU
#### AMPtk uses the sequence database [UNITE] (https://unite.ut.ee/) to assign the taxonomy of the OTU´s.

amptk taxonomy -i filter.final.txt -o taxonomy -f filter.filtered.otus.fa -m ../metagenomica/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

##### -i, input OTU table

##### -o, output name

##### -f, fasta file with reference sequence for each OTU

##### -m, mapping file with meta-data associated with the samples

##### -d, pre-installed database [ITS1, ITS2, ITS, 16S LSU, COI]

##### --tax_filter, remove OTUs that do not match filter, i.e. Fungi to keep only fungi
