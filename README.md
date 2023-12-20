<h1 align="center">Sanibel_PB</h1>

## What to do
The Nextflow pipeline is used to analyze bacterial genome data from PacBio. It has similar functions with Sanibel pipeline, such as identifying clonal complex and serotype of Neisseria and H.influenzae species, AMR detection, identifying the species based on sequencing data, finding plasmid, and so on.  




![Picture4](https://github.com/BPHL-Molecular/Sanibel_PB/assets/16695937/4dc967f3-ba2d-4481-a6fa-f5712952a5fc)



## Prerequisites
Nextflow is needed. The detail of installation can be found in https://github.com/nextflow-io/nextflow. For HiPerGator users, its installation is not needed. 

Python3 is needed. The package "pandas" should be installed by ``` pip3 install pandas ``` if not included in your python3.

Singularity/APPTAINER is needed. The detail of installation can be found in https://singularity-tutorial.github.io/01-installation/. For HiPerGator users, its installation is not needed.

SLURM is needed. For HiPerGator users, its installation is not needed.

PacBio SMRTLINK stand-alone tools are needed. About how to install them, please see the file "How_to_install_smrtlink_tools.txt".

## Recommended conda environment installation
   ```bash
   conda create -n SANIBELPB -c conda-forge python=3.10 pandas
   ```
   ```bash
   conda activate SANIBELPB
   ```
## How to run

1. Rename your data files and make them looks like "bc2024bc2024.bam.pbi" and "bc2024bc2024.bam". You can use to the script "rename.sh" in the pipeline to rename your data files.
2. put the renamed data files (*.bam and *.bam.pbi) into the directory /pbbams.
3. open file "params.yaml", set the two parameters absolute paths. They should be ".../.../pbbams" and ".../.../output". 
4. get to the top directory of the pipeline, run 
```bash
sbatch ./sanibel_pb.sh
```

## By Docker
By default, the pipeline uses singularity to run containers and is wrapped by SLURM. If you want to use docker to run the containers, you should use the command below:

```bash
sbatch ./sanibel_pb_docker.sh
```
    
#### Note1: some sample data files can be found in directory /pbbams/sample_data. If you want to use these data for pipeline test, please copy them to the directory /pbbams.
#### Note2: If you want to get email notification when the pipeline running ends, please input your email address in the line "#SBATCH --mail-user=<EMAIL>" in the batch file that you will run (namely, sanibel_pb.sh or sanibel_pb_docker.sh). 

