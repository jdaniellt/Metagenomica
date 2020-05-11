## Metagenomica

This repository contains a * script * (**on bin directory**) to evaluate data obtained with the Illumina MiSeq platform. Our data correspond to 24 samples obtained from the soil in native (N), mixed (M), Quercus (Q) and Juniperus (J) forest.

The last output file is a OTUs table in *.biom* format (**on data directory**) where a min_lenght of 200 pb was specified, as a filter to set the minimum length of the sequences to be considered in the alignment.

### Comparación de resultados empleando un min_lenght de 200 vs min_lenght de 300:

En comparación con el archivo .biom que contiene un min_lenght de secuencias de 300 bp, el archivo .biom con un min_lenght de secuencias de 200 bp quizás represente una ventaja sobre el primero (de 300 pb), ya que no se están eliminando secuencias que tengan > 200 pb y que podrían brindar información de las muestras de suelo; esta información no se aprovecharía si eligiéramos la opción de min_lenght 300 bp, ya que estamos siendo muy estrictos en la selección de longitud de secuencias y sólo estamos eligiendo aquellas que se secuenciaron completamente (lenght of reads 300 pb).
