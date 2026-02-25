# Differential Gene Expression Analysis of TP53 Mutation in Pancreatic Cancer

This project investigates how TP53 mutations alter gene expression and contribute to therapeutic resistance in pancreatic cancer using RNA-seq data.

The dataset was obtained from the Gene Expression Omnibus.

Dataset accession: GSE291036

## Research Objective

To identify differentially expressed genes associated with TP53 mutation and therapy resistance.

## Dataset

Samples analyzed: 4 RNA-seq samples
Control samples: GSM8827850, GSM8827851
TP53 mutant samples: GSM8827854, GSM8827855

Cell line: MiaPaCa-2 pancreatic cancer cell line

## Analysis Workflow

Download GEO dataset
↓
Prepare metadata
↓
Load count data in R
↓
Data preprocessing
↓
DESeq2 analysis
↓
Identify significant genes
↓
Visualization (PCA, volcano, heatmap)
↓
Biological interpretation

## Tools Used

R
DESeq2
GEOquery
ggplot2
pheatmap
RStudio

## Differential Expression Criteria

Significant genes: Adjusted p-value < 0.05
Upregulated genes: log2FoldChange > 1
Downregulated genes: log2FoldChange < -1

## Key Findings
Expression Patterns

Principal component analysis shows clear separation between control and TP53 mutant samples, indicating strong transcriptional changes.

### Upregulated Pathways

Cell cycle progression
MAPK signaling
Drug resistance pathways

### Downregulated Pathways

Apoptosis
Tumor suppression mechanisms
DNA damage response

These results suggest that TP53 mutation may drive cancer progression and therapy resistance through transcriptional reprogramming.

## Visualizations

Volcano plot
Heatmap of top differentially expressed genes
PCA plot

## Skills Demonstrated

RNA-seq analysis in R
Differential gene expression analysis
Statistical genomics
Biological data visualization
Cancer transcriptomics
