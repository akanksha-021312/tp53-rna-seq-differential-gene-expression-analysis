# Load required libraries 
library(ggplot2) 
library(ggrepel) 
# Set file paths 
input_file <- "C:/Users/akank/OneDrive/Desktop/BOOT_2/DEG_foldchange_results.csv" 
output_file <- "C:/Users/akank/OneDrive/Desktop/BOOT_2/deg_results/volcano_plot.png" 
# Load DESeq2 results 
deg_results <- read.csv(input_file, row.names = 1) 
# Ensure proper column names exist 
if (!("log2FoldChange" %in% colnames(deg_results)) || !("padj" %in% colnames(deg_results))) { 
stop("The required columns (log2FoldChange, padj) are missing in the input file.") 
} 
# Convert -log10(padj) for better visualization 
deg_results$logP <- -log10(deg_results$padj) 
# Define significance thresholds 
log2FC_threshold <- 1 
pval_threshold <- 0.05 
# Categorize genes as Upregulated, Downregulated, or Not Significant 
deg_results$Significance <- "Not Significant" 
deg_results$Significance[deg_results$log2FoldChange > log2FC_threshold & deg_results$padj 
< pval_threshold] <- "Upregulated" 
deg_results$Significance[deg_results$log2FoldChange < -log2FC_threshold & 
deg_results$padj < pval_threshold] <- "Downregulated" 
# Select top genes for labeling 
top_genes <- deg_results[deg_results$padj < 0.01 & abs(deg_results$log2FoldChange) > 2, ] 
# Plot Volcano Plot 
volcano_plot <- ggplot(deg_results, aes(x = log2FoldChange, y = logP, color = Significance)) + 
geom_point(alpha = 0.6, size = 2) +  # Scatter plot points 
scale_color_manual(values = c("Upregulated" = "red", "Downregulated" = "blue", "Not 
Significant" = "gray")) + 
geom_vline(xintercept = c(-log2FC_threshold, log2FC_threshold), linetype = "dashed", color = 
"black") +  
geom_hline(yintercept = -log10(pval_threshold), linetype = "dashed", color = "black") +  
geom_text_repel(data = top_genes, aes(label = rownames(top_genes)), size = 4, 
max.overlaps = 15) + # Gene labels 
labs(title = "Volcano Plot of Differential Expression", x = "Log2 Fold Change", y = "-Log10 
Adjusted P-value") + 
theme_minimal() 
# Save the plot as PNG 
ggsave(output_file, plot = volcano_plot, width = 8, height = 6, dpi = 300) 
# Show the plot 
print(volcano_plot)