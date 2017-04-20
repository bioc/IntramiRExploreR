# IntramiRExploreR

##Introduction

IntramiRExploreR uses 2 distinct statistical correlation methods, Distance and Pearson correlation to find targets for microRNAs in ***D.melanogaster***(Fruit flies), using the Affymetrix platform microarray data (Affymetrix platform 1 and Affymetrix platform 2) available in the Gene Expression omnibus (GEO) database. Gene Ontology cluster analysis using FGNet (bioconductor) package and regulatory network visualisation using igraphs, are some of the built in functions in the package.

###Installing the package

**IntramiEExploreR** is currently available from the github repository. Installation method would be as the following:

```{r}
library("devtools")
devtools::install_github("sbhattacharya3/IntramiRExploreR")
library("IntramiRExploreR")
```
IntramiRExploreR has dependency on  R version (>= 3.1.2). To use the DAVID functionality for Gene Ontology functional classification (called from **GetGOS_ALL** function), user has to install the **RDAVIDWebService** package using the link below:
http://stackoverflow.com/questions/31480579/r-david-webservice-sudden-transport-error-301-error-moved-permanently.

###Usage 

####Target Prediction using 3 available Target Database

**miRtargets** function extracts target genes for a  miRNA (or a list of miRNAs) of interest, from 3 dqatabases: **TargetScan**,**Pita** and **Miranada**. 

```{r}
miR="dme-miR-12"
a <- miRtargets(miR,algo=c("TargetScan"),Text=FALSE)
a[1:10,]
```

**mRNA_Pred** function extracts miRNAs that target a single or a list of genes of interest, from 3 dqatabases: **TargetScan**,**Pita** and **Miranada**. 

```{r}
genes="Ank2"
a<-mRNA_Pred(genes,algo=c("Miranda"),outpath,Image=FALSE,Text=FALSE)
a[1:10,]
```

Visualisation in the form of Venndiagrams, showing number of genes in multiple selected databases can be obtained using **Image=TRUE** option and can be saved in user specified path.

####Target Prediction using expression data

Statistically predicted targets for a given miRNA of interest can be obtained using **miRTargets_Stat** function.

```{r}
miR="dme-miR-12"
a<-miRTargets_Stat(miR,method=c("Both"),Platform=c("Affy1"))
a[1:10,]
```
The input to the function are single or multiple miRNAs, the Statitical method which predicts the target, and the platform. The method chosen here is "Both" which is an union of both the **Pearson** and the **Distance** correlation method. The platform is chosen as **Affy1** (Affymetrix platform1).  The  output from the function is targets that are statistically significant, the score associated to each target, the GEO accession IDS where the miRNA and the Targets are correlated and the function of the target genes from the flybase.

Similarly, **genes_Stat** is used to obtain statistically relevant miRNAs that target a gene of interest.

```{r}
gene ="Ank2"
a<-genes_Stat(gene,method=c("Both"),Platform=c("Affy1"))
a[1:10,]
```
**genes_Stat** has similar output format as **miRTargets_Stat**, the only difference is that it outs the miRNA function from flybase, instead of the genes.

####Visualisation

**Visualisation** function has three output formats:
a)**text**: Output miRNA targets result obtained from **miRTargets_Stat**, in text format.
b)**Cytoscqape**: Output in the format of cytoscape input files.
c)**igraphs**: Output  miRNA:Target gene results in the form of network.

The main differnce between the results of **miRTargets_Stat** and **Visualisation** is that in the **Visualisation** function one can select the number of targets, he/she wants to see, sorted in a descending order based on the score 

```{r}
miR=c("dme-miR-12","dme-miR-283")
Visualisation(miR,mRNA_type=c("GeneSymbol"),method=c("Both"),platform=c("Affy1"),thresh=20)
```
####Gene Ontology

**GetGOS_ALL** function outputs functional network clusters, using FGNet. topGO and DAVID are the 2 available GO methods. 
```{r}
miR="dme-miR-12"
a<-miRTargets_Stat(miR,method=c("Both"),Platform=c("Affy1"),outpath,Text=FALSE)
genes<-a$Targets_FBID
GetGOS_ALL(genes,GO=c("topGO"),term=c("GO_BP"),path="C://",filename="test")
```
###License

The **IntramiRExploreR** package is licensed under the GPLv2 (<http://www.gnu.org/licenses/gpl.html>).
