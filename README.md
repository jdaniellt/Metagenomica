## Metagenomica

This repository contains a * script * (**on bin directory**) to process and evaluate raw data obtained with the Illumina MiSeq. The data correspond to 24 samples obtained from the soil in native (N), mixed (M), Quercus (Q) and Juniperus (J) forest.

The final output file is a OTUs table in *.biom* format (**on data directory**) where a min_lenght of 200 pb was specified, as a filter to set the minimum length of the sequences to be considered in the alignment.

####  Comparison of results of the *.biom* file with a min_lenght of 200 vs min_lenght of 300:

Very different results are obtained when using a min_lenght of 200 vs 300. When a minimum length of 200 pb is established, 1257 taxa are obtained in 12 samples, and 7 taxonomic ranks are recovered; while with a minimum length of 300, only 215 taxa are obtained in 7 samples, but 7 taxonomic ranks are also recovered. Since the maximum length of our *reads* is 300 pb, it is clear that establishing a minimum length of 300 will not be the right thing, since we would be accepting many low quality sequences, since most of the sequences are not 300 bp or close to that value. So a more conservative filter like 200 bp would be ideal, and it is a value that many authors tend to follow: set 100 bp less than the maximum obtained. If the objective is to evaluate the diversity of a community or between communities, a fundamental element is to have taxonomic certainty in our study units, so if we select a min_lenght of 200 we would gain greater certainty and therefore the results of our diversity analyzes will have greater validity. Finally, it is necessary to carry out previous analyzes on the quality of the reads before taking the decision of which is the optimal min_lenght for our data.

