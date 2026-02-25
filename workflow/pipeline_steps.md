Step 1: Data Acquisition

RNA-seq count data was downloaded from GEO dataset GSE291036.

Step 2: Metadata Preparation

A metadata table was created to define control and TP53 mutant samples.

Step 3: Data Loading

Count matrix and metadata were imported into R.

Step 4: Data Preprocessing

Low-expression genes were filtered and sample information was validated.

Step 5: Differential Expression Analysis

DESeq2 was used to identify differentially expressed genes between control and TP53 mutant samples.

Step 6: Visualization

Plots generated:

PCA plot

Volcano plot

Heatmap

Step 7: Biological Interpretation

Upregulated and downregulated pathways were analyzed.