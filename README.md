# ProjectL38

pipeline created with galaxy workflow
For workflow_1 a gtf and fasta file needs to be uploaded. 
After feature counts the tool extract dataset needs to be used, to extract al datasets in featurecounts(not visible in the workflow) and these can be renamed and used for workflow_2, where the files are made for limma. 
The counts file created with the featurecounts is changed to txt file after creating it. 

In Rstudio: 

make 3 folders: Counts, meta, scripts
upload your Counts file, meta file and the scripts (Limmavoom.R, Function.R)

Open script limmavoom.R and install required packages. 
also need to install: glimma, edgeR

Glimma:
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Glimma")

edgeR:
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("edgeR")

After running Limma, load the Riboseq_control-RNAseq_control_up and Riboseq_sample-RNAseq_sample_up in Venny 2.1.0 (https://bioinfogp.cnb.csic.es/tools/venny/) 
Paste the results back in galaxy as tabular with GeneID as header. name = geneID_upregulation
and to the same for the downregulation: Riboseq_control-RNAseq_control_down, Riboseq_sample-RNAseq_sample_down
