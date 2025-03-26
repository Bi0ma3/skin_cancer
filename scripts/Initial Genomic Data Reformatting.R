# This file has been created to clean and correctly format data from the 
# NCBI ALFA dataset, available from the source at: 
# https://useast.ensembl.org/Homo_sapiens/Variation/Population?oa=EFO:0004747;ph=108365;r=7:95305387-95306388;v=rs3917549;vdb=variation;vf=480831053#population_freq_EUR
# Script combines NCBI ALFA dataset and population names available at:
# https://www.ncbi.nlm.nih.gov/snp/docs/gsr/data_inclusion/#population

# The output of this script is a CSV file that gives allele frequencies for 
# variant rs3917549 with descriptive population locations.

# To use this file, change file locations to match your working directory.
#####

# Load necessary libraries
library(data.table)
library(tidyr)
library(dplyr)
library(stringr)

# Define file paths
genomicPath <- "C:/Users/maeso/OneDrive/Documents/ncbialfa-PopulationGenotypes-Homo_sapiens_Variation_Population_rs3917549.csv"
namesPath <- "C:/Users/maeso/OneDrive/Documents/population_names.csv"

# Read datasets
genomicDF <- fread(genomicPath, header = FALSE, skip = 1)  # Skip first row (metadata)
namesDF <- fread(namesPath, header = TRUE)

# Verify Column Names
print("Column names in genomicDF:")
print(colnames(genomicDF))

print("Column names in namesDF:")
print(colnames(namesDF))

# Rename genomicDF columns
colnames(genomicDF) <- c("Population_ID", "Remove", "Allele_Frequencies")

# Drop the empty column
genomicDF <- genomicDF[, -"Remove", with = FALSE]

# Extract allele frequency data into separate columns
genomicDF <- genomicDF %>%
  mutate(AA_Freq = sub(".*AA: ([0-9\\.]+) .*", "\\1", Allele_Frequencies),
         A_Freq = sub(".*A: ([0-9\\.]+) .*", "\\1", Allele_Frequencies)) %>%
  select(Population_ID, AA_Freq, A_Freq)

# Convert frequencies to numeric
genomicDF$AA_Freq <- as.numeric(genomicDF$AA_Freq)
genomicDF$A_Freq <- as.numeric(genomicDF$A_Freq)

# Clean BioSample_ID in genomicDF
genomicDF$BioSample_ID <- sub("ALFA:", "", genomicDF$Population_ID)
genomicDF$BioSample_ID <- str_trim(as.character(genomicDF$BioSample_ID))  # Trim spaces

# Clean namesDF and ensure Population_Name is properly formatted
namesDF <- namesDF %>%
  rename(Population_Name = Name) %>%
  mutate(BioSample_ID = str_trim(as.character(`BioSample ID`))) %>%
  select(BioSample_ID, Population_Name)

# Debug - Check Missing IDs Before Merging
missing_in_names <- setdiff(genomicDF$BioSample_ID, namesDF$BioSample_ID)
missing_in_genomic <- setdiff(namesDF$BioSample_ID, genomicDF$BioSample_ID)

print("IDs in genomicDF but missing in namesDF:")
print(missing_in_names)

print("IDs in namesDF but missing in genomicDF:")
print(missing_in_genomic)

# Merge cleaned datasets
genomicfinalDF <- merge(genomicDF, namesDF, by = "BioSample_ID", all.x = TRUE, all.y = FALSE)

# Verify Merge Success
print("Number of NA values in Population_Name after merge:")
print(sum(is.na(genomicfinalDF$Population_Name)))  # Should be 0 or minimal

# Reorder Columns for Clarity
genomicfinalDF <- genomicfinalDF %>% select(BioSample_ID, Population_Name, AA_Freq, A_Freq)

# Save Cleaned Dataset
write.csv(genomicfinalDF, "C:/Users/maeso/OneDrive/Documents/cleaned_ncbi_alfa.csv", row.names = FALSE)

# Display first few rows of final dataset
head(genomicfinalDF)

> 
### Edit log #### 
# MWarner 2025-03-21 1600hrs - Initial code written.