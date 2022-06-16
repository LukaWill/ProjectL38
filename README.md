# ProjectL38

pipeline created with galaxy workflow
For workflow_1 a gtf and fasta file needs to be uploaded. 
After feature counts the tool extract dataset needs to be used, to extract al datasets in featurecounts(not visible in the workflow) and these can be renamed and used for workflow_2, where the files are made for limma. 
The counts file created with the featurecounts is changed to txt file after creating it. 

In Rstudio: 

make 3 folders: Counts, meta, scripts
upload your Counts file, meta file and the scripts (Limmavoom.R, Function.R, random_numbers.R, and the 4 scripts for the plots)

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

Run limmavroom.R
After running Limma, load the Riboseq_control-RNAseq_control_up and Riboseq_sample-RNAseq_sample_up in galaxy with gx_put("filename").

Then copie the geneIDs in Venny 2.1.0 (https://bioinfogp.cnb.csic.es/tools/venny/).

Paste the results back in galaxy as tabular with GeneID as header. name = DEG_upregulation
and to the same for the downregulation: Riboseq_control-RNAseq_control_down, Riboseq_sample-RNAseq_sample_down. 

upload de DEG_AllContrast_ in galaxy and follow workflow_3 to create 1 DEG file and feature files with start and stop position. 

download the tabular files (3 UTR, Transcript, 5 UTR) to excel, change to xls and remove everything in column 3 except the geneID. (this can be done by text to columns(tab). Add header and Upload the xls files as tabular. 
The follow workflow_4 until all GeneID have an Length. Download it in excel and remove the .0 to make it an integer. Then create a pivottable for the maximum length for each geneID. Rename the header and save as .txt (max_3, max_5, max_transcript)


Run random_numbers.R 
change the random numbers into the same amount as upregulated DEGs and repeat for downregulated DEGs

Now the plot scripts can be performed(plot_3UTR, plot_5UTR, plot_transcript). 

Download the Riboseq_sample-RNAseq_sample_.csv file make it an txt file and upload it in galaxy. 
..........

For the uORF plot, first the plot was made in Descending order on highest Average Expression. Then the first 150 genes for upregulation/downregulation and Random genes where searched in Uorfligth(http://uorflight.whu.edu.cn/), And the uorfs with the highest length of each GeneID was put in an xls file. Here 50 genes where used for making the plot. 

Disclaimer: All data was performed in galaxy 2 times. THe first time without workflow. With this data the 150 genes were selected. But second time not all of those 150 genes where upregulated or downregulated DEGs. So only 50 of the first results where choosen and also 50 of the random genes. 






