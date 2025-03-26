# skin_cancer

**Exploring the Geographic Distribution of Skin Cancer-Related Gene Activity and Its Correlation with Environmental and Demographic Factors**

## Project Overview

This project examines the geographic variability of allele frequencies for a skin cancer susceptibility gene—specifically the TP53 variant **rs3917549**—and investigates how these genetic patterns correlate with environmental factors such as **UV radiation**, **ozone depletion**, and **regional demographics**. 

Our aim is to identify regional patterns of genetic risk and environmental exposure to better understand population-level vulnerability to skin cancer. This work can support precision medicine, public health policy, and genetic epidemiology efforts.

## Objectives

- Analyze allele frequency data for rs3917549 from the 1000 Genomes Project.
- Integrate environmental and geospatial data, including UV radiation and ozone depletion levels.
- Incorporate demographic and regional population data.
- Visualize spatial patterns and perform statistical analysis to identify correlations and trends.
- Ensure all data and analyses are reproducible, documented, and openly available.

## Repository Structure

skin_cancer/
│
├── data/                # Cleaned datasets (e.g., allele frequencies, UV index)
├── notebooks/           # Jupyter notebooks for data exploration and analysis
├── scripts/             # Python scripts for data processing and visualization
├── figures/             # Plots, maps, and visualizations
├── results/             # Final outputs, statistics, or summary files
├── README.md            # Project documentation (this file)
└── requirements.txt     # Required Python packages for environment setup


## Key SNP Under Investigation

- **Gene:** TP53
- **Variant ID:** rs3917549
- **Relevance:** Associated with skin cancer susceptibility in population-based studies
- **Source:** Ensembl / 1000 Genomes Project  
  [Link to variant](https://www.ensembl.org/Homo_sapiens/Variation/Explore?r=17:7571720-7571720;v=rs3917549)

## Data Sources

| Dataset Type     | Source                                     | Format       |
|------------------|--------------------------------------------|--------------|
| Genomic Data     | Ensembl / 1000 Genomes Project             | CSV, TSV     |
| Environmental    | NASA Earth Observations, NSRDB             | NetCDF, HDF5 |
| Geospatial       | Natural Earth                              | SHP, GeoJSON |
| Derived Data     | Regression models, statistical summaries   | CSV, JSON    |

## Tools & Technologies

- **Languages:** Python, R  
- **Environments:** Jupyter Notebook, Anaconda, RStudio  
- **Key Python Libraries:** pandas, geopandas, matplotlib, seaborn, scikit-learn  
- **Version Control:** Git, GitHub  
- **Cloud Storage:** Google Drive (internal collaboration)

## Data Standards & Metadata

- **Genomic Metadata Standard:** MIxS  
- **Geospatial Metadata:** ISO 19115  
- **General Metadata:** Dublin Core (DCMI)  
- **Documentation Formats:** Markdown (`.md`), JSON, CSV  

Each dataset is accompanied by:
- A README file explaining structure and use
- A data dictionary defining variables and units
- A changelog tracking all updates and modifications
- Inline code documentation in `.py` and `.ipynb` files

## Current Status

This project is in active development.

- [x] Data collection and cleaning (allele frequency, UV index, demographics)
- [x] Documentation and metadata creation
- [ ] Spatial visualization of gene distribution
- [ ] Correlation and regression analyses
- [ ] Final presentation and publication draft

## Example Visualizations

_(To be added soon: maps of allele frequencies, UV index overlays, regression plots)_

## Authors

- Mae Warner  
- Viana Nguyen  
- Bradley Bobbett  
- Rita Wilde

## Contributions

This is a collaborative academic research project. We welcome feedback and collaboration from the scientific and data science community. Please open an issue or submit a pull request if you wish to contribute.

## Data Sharing & Licensing

- All scripts and derived data are shared under the **MIT License** (or as specified).
- Original datasets (e.g., from Ensembl, NASA) are referenced but **not redistributed**. Users must access them from the original source.
- Please cite this repository and the original data providers in any reuse of the materials.

## Citation

If you use any part of this repository in your work, please cite as:

> Warner, M., Nguyen, V., Bobbett, B., & Wilde, R. (2025). *Exploring the Geographic Distribution of Skin Cancer-Related Gene Activity*. GitHub. https://github.com/your-username/skin_cancer

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
