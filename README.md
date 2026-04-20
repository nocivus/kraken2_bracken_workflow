# kraken2_bracken_workflow
First rudimentary shell-script for metagenome analysis using kraken2 and bracken.   

This script takes multiple paired readings as input and uses [Kraken2](https://github.com/DerrickWood/kraken2), [Bracken](https://github.com/jenniferlu717/Bracken) and [KrakenTools](https://github.com/jenniferlu717/KrakenTools) to generate Bracken report-files and Krona plots for the submitted samples.

The script follows a reduced workflow of the one presented in [Lu J, Rincon N, Wood DE, et al. Metagenome analysis using the Kraken software suite. Nat Protoc. 2022;17(12):2815-2839. doi:10.1038/s41596-022-00738-y](https://pmc.ncbi.nlm.nih.gov/articles/PMC9725748/)

The samples used were published in [Worp, N., Nieuwenhuijse, D.F., Izquierdo-Lara, R.W. et al. Unveiling the global urban virome through wastewater metagenomics. Nat Commun 16, 10707 (2025).](https://doi.org/10.1038/s41467-025-65208-x)

**Tested on Ubuntu 25.04 (arm64)**

## Installing required software:

### 1. Conda Package Manager

for install using Miniconda see: (https://www.anaconda.com/docs/getting-started/main)

### 2. Kraken2, Bracken, Krakentools

`conda install -c conda-forge -c bioconda kraken2 krakentools bracken`



## Required folder structure:

> .../\{src\}/  
>    |── database/        
>    |── reads/           
>    |── output/        

**.../\{src\}/database** contains the (pre-built) Kraken 2 & Bracken databases.   
**.../\{src\}/reads** contains the paired readings of the samples (..._1.fastq.gz & ..._2.fastq.gz)   
**.../\{src\}/output** will later contain the generated report files   

as for now, **kreport2krona.py** hast to be located in the src/ directory where **analyse_script.sh** is run

## Data preparation
### k-mer Database
Pre-built Kraken2 and Bracken databases can be found [here.](https://benlangmead.github.io/aws-indexes/k2)   
The Database has to be unzipped and stored in an extra directory inside ./database/   
Example: .../src/database/k2_viral_20260226

### Input
Sample readings from the Global Urban Virome study are available at the [European Nucleotide Archive.](https://www.ebi.ac.uk/ena/browser/view/PRJEB87273)    
Both paired reads of a sample (..._1.fastq.gz & ..._2.fastq.gz) must be stored inside ./reads/



