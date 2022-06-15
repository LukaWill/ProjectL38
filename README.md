# ProjectL38

pipeline created with galaxy workflow
For workflow_1 a gtf and fasta file needs to be uploaded. 
After feature counts the tool extract dataset needs to be used, to extract al datasets in featurecounts(not visible in the workflow) and these can be renamed and used for workflow_2, where the files are made for limma. 
The counts file created with the featurecounts is changed to txt file after creating it. 

In Rstudio: 

make 3 folders: Counts, meta, scripts
upload your Counts file, meta file and the scripts

Open script limmavoom.R and install required packages. 
also need to install: glimma, edgeR
