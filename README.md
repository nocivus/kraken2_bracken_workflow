# kraken2_bracken_workflow
Rudimentary shell-script for metagenome analysis using kraken2 and bracken.   

This script takes multiple paired readings as input and uses [Kraken2](https://github.com/DerrickWood/kraken2), [Bracken](https://github.com/jenniferlu717/Bracken) and [KrakenTools](https://github.com/jenniferlu717/KrakenTools) to generate Bracken report-files and Krona plots for the submitted samples.

The script follows a reduced workflow of the one presented in [Lu J, Rincon N, Wood DE, et al. Metagenome analysis using the Kraken software suite. Nat Protoc. 2022;17(12):2815-2839. doi:10.1038/s41596-022-00738-y](https://pmc.ncbi.nlm.nih.gov/articles/PMC9725748/)

The samples used were published in [Worp, N., Nieuwenhuijse, D.F., Izquierdo-Lara, R.W. et al. Unveiling the global urban virome through wastewater metagenomics. Nat Commun 16, 10707 (2025).](https://doi.org/10.1038/s41467-025-65208-x)

Pavian example reports were generated for 21 samples from the above study taken in Ecuador.

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

## Run

**analyse_script.sh** has to be located in the .../\{src\} directory for the script to function.

Then `bash ./analyse_script.sh`

## Sample Reports

### Krona plot

<img width="1394" height="896" alt="grafik" src="https://github.com/user-attachments/assets/c3c53832-32d0-45e4-b8ef-77a42d8608b6" />

ERR14789028.krona.html

### Pavian plots & report

Pavian plots and reports were created from the Bracken .breport files using the [Pavian shiny app.](https://fbreitwieser.shinyapps.io/pavian/)


<img width="840" height="594" alt="grafik" src="https://github.com/user-attachments/assets/6823d8a6-d63f-4b08-b43d-5560379ef71c" />

sample_set-report_pavian.html


