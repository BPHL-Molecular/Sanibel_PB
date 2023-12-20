<h1 align="center">Sanibel_PB</h1>

## What to do
The Nextflow pipeline is used to analyze bacterial genome data from PacBio. It has similar functions with Sanibel pipeline, such as identifying clonal complex and serotype of Neisseria and H.influenzae species, AMR detection, identifying the species based on sequencing data, finding plasmid, and so on.  



![Picture2](https://github.com/BPHL-Molecular/Sanibel_PB/assets/16695937/99ca9277-5f79-45c3-8be5-bda09157c428)


## Prerequisites
Nextflow is needed. The detail of installation can be found in https://github.com/nextflow-io/nextflow.

Python3 is needed. The package "pandas" should be installed by ``` pip3 install pandas ``` if not included in your python3.

Singularity/APPTAINER is needed. The detail of installation can be found in https://singularity-tutorial.github.io/01-installation/.

SLURM is needed.

## Recommended conda environment installation
   ```bash
   conda create -n SANIBEL -c conda-forge python=3.10 pandas
   ```
   ```bash
   conda activate SANIBEL
   ```
## How to run

### Option1, your data file names directly come from Illumina output: 
1. put your data files into directory /fastqs. Your data file's name should look like "XZA22002292-XS-ASX550430-220701_S143_L001_R1_001.fastq.gz". 
2. open file "params.yaml", set the two parameters absolute paths. They should be ".../.../fastqs" and ".../.../output". 
3. get to the top directory of the pipeline, run 
```bash
sbatch ./sanibel_illumina.sh
```
### Option2, your data file names do not directly come from Illumina output: 
1. put your data files into directory /fastqs. Your data file's name should look like "XZA22002292_1.fastq.gz", "XZA22002292_2.fastq.gz" 
2. open file "params.yaml", set the two parameters absolute paths. They should be ".../.../fastqs" and ".../.../output". 
3. get into the directory of the pipeline, run 
```bash
sbatch ./sanibel.sh
```

## By Docker
By default, the pipeline uses singularity to run containers and is wrapped by SLURM. If you want to use docker to run the containers, you should use the command below:
If your data file names do not directly come from Illumina output,
```bash
sbatch ./sanibel_docker.sh
```
If your data file names directly come from Illumina output,
```bash
sbatch ./sanibel_illumina_docker.sh
```

## Version updates
    https://github.com/BPHL-Molecular/Sanibel.wiki.git
    
#### Note1: some sample data files can be found in directory /fastqs/sample_data. If you want to use these data for pipeline test, please copy them to the directory /fastqs.
#### Note2: If you want to get email notification when the pipeline running ends, please input your email address in the line "#SBATCH --mail-user=<EMAIL>" in the batch file that you will run (namely, sanibel.sh, sanibel_illumina.sh, sanibel_docker.sh, or sanibel_illumina_docker.sh). 

