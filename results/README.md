# Results

This folder contains the processed outputs obtained from the differential gene expression analysis of TP53 mutation in pancreatic cancer.

---

## 1. DEG_foldchange_results.csv

This is the main DESeq2 output table.

Generated from:
- DESeq2 results
- log2FoldChange filtering

It contains columns such as:
- Gene ID
- baseMean
- log2FoldChange
- lfcSE
- stat
- pvalue
- padj

This file represents the **complete differential expression results** and serves as the primary dataset for further filtering and visualization.

---

## 2. significant_genes.csv

Contains genes that satisfy:

Adjusted p-value < 0.05

This file represents the **statistically significant differentially expressed genes (DEGs)** identified from the analysis.

These genes are considered biologically meaningful and are used for downstream interpretation and visualization.

---

## 3. upregulated_genes.csv

Genes that satisfy:
- padj < 0.05
- log2FoldChange > 1

These genes are **upregulated in TP53 mutant samples** compared to control samples.

They may be associated with:
- Cancer progression
- Cell proliferation
- Therapy resistance pathways

---

## 4. downregulated_genes.csv

Genes that satisfy:
- padj < 0.05
- log2FoldChange < -1

These genes are **downregulated in TP53 mutant samples** compared to control samples.

They may be involved in:
- Tumor suppression
- Apoptosis
- DNA damage response pathways

---

## 5. top_50_significant_genes.csv

This file contains the **top 50 most significant differentially expressed genes** ranked by adjusted p-value.

These genes were selected for:
- Heatmap visualization
- Expression pattern analysis
- Identification of strongly regulated genes

---

# Visualization Outputs

The visual representations generated during the analysis are stored in the **plots/** directory.

### Volcano Plot
File: `plots/volcano_plot.png`

This plot shows:
- Log2 fold change on the x-axis
- Statistical significance (-log10 adjusted p-value) on the y-axis

It helps identify:
- Highly upregulated genes
- Highly downregulated genes
- Overall distribution of differential expression.

---

### Heatmap of Top Differentially Expressed Genes
File: `plots/heatmap_top_50_genes.png`

This heatmap visualizes:
- Expression patterns of the top 50 significant genes
- Differences between control and TP53 mutant samples
- Clustering of genes and samples based on expression similarity.

---

# Summary of Results

This analysis identified genes that are significantly altered due to TP53 mutation in pancreatic cancer. The results provide insights into transcriptional changes associated with tumor progression and therapy resistance.

The processed result files in this folder can be used for:
- Functional enrichment analysis
- Pathway analysis
- Network analysis
- Further biological interpretation.
