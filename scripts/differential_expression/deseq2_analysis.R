# Load the DESeq2 package 
library(DESeq2) 
# Load normalized counts from CSV file 
normalized_counts <- 
read.csv("C:/Users/akank/OneDrive/Desktop/boot/normalized_counts.csv", row.names = 1) 
# Load the rounded integer normalized counts 
integer_counts <- 
read.csv("C:/Users/akank/OneDrive/Desktop/boot/integer_normalized_counts.csv", row.names 
= 1) 
# Load metadata from Excel file 
library(readxl) 
metadata <- read_excel("C:/Users/akank/OneDrive/Desktop/boot/metadata.xlsx") 
metadata <- as.data.frame(metadata) 
# Ensure rownames of metadata match the column names of the normalized counts 
rownames(metadata) <- metadata$sample 
# Create DESeq2 dataset 
dds <- DESeqDataSetFromMatrix(countData = integer_counts, colData = metadata, design = ~ 
Condition) 
# Perform pre-filtering to remove rows with very low counts (optional) 
dds <- dds[rowSums(counts(dds)) > 1, ] 
# Run DESeq2 
dds <- DESeq(dds) 
# Get results (log2 fold changes and p-values) 
results_DESeq2 <- results(dds) 
# Obtain results 
res <- results(dds) 
# Filter results based on log2FoldChange 
resFiltered <- res[abs(res$log2FoldChange) > 1, ]  # Adjust cutoff as needed 
# Save results 
write.csv(as.data.frame(resFiltered), "DEG_foldchange_results.csv") 
# Load the results file 
deg_results <- read.csv("C:/Users/akank/OneDrive/Desktop/boot/DEG_foldchange_results.csv", 
row.names = 1) 
# Filter significant genes: adjusted p-value < 0.05 
significant_genes <- subset(deg_results, padj < 0.05) 
# View the significant genes 
head(significant_genes) 
# Save the significant genes to a new CSV file 
write.csv(significant_genes, "significant_genes.csv") 
# Filter upregulated genes: adjusted p-value < 0.05 and log2FoldChange > 1 
upregulated_genes <- subset(deg_results, padj < 0.05 & log2FoldChange > 1) 
# View the upregulated genes 
head(upregulated_genes) 
# Save the upregulated genes to a new CSV file 
write.csv(upregulated_genes, "upregulated_genes.csv") 
# Filter downregulated genes: adjusted p-value < 0.05 and log2FoldChange < -1 
downregulated_genes <- subset(deg_results, padj < 0.05 & log2FoldChange < -1) 
# View the downregulated genes 
head(downregulated_genes) 
# Save the downregulated genes to a new CSV file 
write.csv(downregulated_genes, "downregulated_genes.csv")