# Set the working directory 
setwd("C:/Users/akank/OneDrive/Desktop/BOOT_2") 
# Load the significant genes file (assuming it's a CSV file) 
significant_genes <- read.csv("significant_genes.csv") 
# Sort the data by adjusted p-value (padj) in ascending order 
# If you have a different column for significance, change accordingly 
sorted_genes <- significant_genes[order(significant_genes$padj), ] 
# Extract the top 50 significant genes 
top_50_genes <- head(sorted_genes, 50) 
# View the top 50 genes 
print(top_50_genes) 
# If you want to save the top 50 genes as a CSV file 
write.csv(top_50_genes, "top_50_significant_genes.csv", row.names = FALSE) 
# Install required packages if not already installed 
if (!require("pheatmap")) install.packages("pheatmap") 
# Load the required library 
library(pheatmap) 
# Set the working directory 
setwd("C:/Users/akank/OneDrive/Desktop/BOOT_2") 
# Load the top 50 significant genes file 
top_50_genes <- read.csv("top_50_significant_genes.csv") 
# Assuming the gene names/IDs are in the first column (e.g., 'GeneID'), modify accordingly 
# Set row names as gene IDs 
rownames(top_50_genes) <- top_50_genes$GeneID  # Replace 'GeneID' with the actual 
column name for gene IDs 
# Assuming the file has normalized expression values for each sample in columns, 
# Modify the column range to match the actual columns with expression values (e.g., 3:6) 
expression_data <- top_50_genes[, 3:6]  # Adjust column numbers as needed 
# Save the heatmap as a PNG file with gene IDs 
png("heatmap_top_50_genes.png", width = 1200, height = 1000, res = 150) 
pheatmap(expression_data,  
scale = "row",  # Scale by row (z-score normalization) 
         show_rownames = TRUE,  # Show gene IDs as row names 
         show_colnames = TRUE,  # Show sample names as column names 
         clustering_distance_rows = "euclidean",  
         clustering_distance_cols = "euclidean",  
         clustering_method = "complete",  
         color = colorRampPalette(c("blue", "white", "red"))(50), # Color scheme 
         main = "Heatmap of Top 50 Significant Genes") 
dev.off()