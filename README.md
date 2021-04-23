# SPrnaseq <img src="https://raw.githubusercontent.com/systemPipeR/SPrnaseq/master/inst/extdata/SPrnaseq.png" align="right" height="139" />

<!-- badges: start -->
![R-CMD-check](https://github.com/systemPipeR/SPrnaseq/workflows/R-CMD-check/badge.svg)
[![Lifecycle: stable](https://lifecycle.r-lib.org/articles/figures/lifecycle-stable.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
<!-- badges: end -->

### Introduction

[_systemPipeR_](http://www.bioconductor.org/packages/devel/bioc/html/systemPipeR.html)
is an R/Bioconductor package for building and running automated *end-to-end*
analysis workflows for a wide range of research applications, including next-generation 
sequencing (NGS) experiments, such as RNA-Seq, ChIP-Seq, VAR-Seq and Ribo-Seq.
Important features include a uniform workflow interface across different data analysis 
applications, automated report generation, and support for running both R and command-line software,
such as NGS aligners or peak/variant callers, on local computers or compute
clusters. The latter supports interactive job submissions and batch submissions
to queuing systems of clusters. Efficient handling of complex sample sets and
experimental designs is facilitated by a well-defined sample annotation
infrastructure which improves reproducibility and user-friendliness of many
typical analysis workflows in the NGS area.

#### Installation 
To install the package, please use the _`BiocManager::install`_ command:
```
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("systemPipeR/SPrnaseq", build_vignettes=TRUE, dependencies=TRUE)
```
To obtain the *systemPipeR* and *systemPipeRdata*, please run as follow:
```
if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("systemPipeR")
BiocManager::install("systemPipeRdata")
```

#### Usage

To test workflows quickly or design new ones from existing templates, users can
generate with a single command workflow instances fully populated with sample data 
and parameter files required for running a chosen workflow.

Load one of the available workflows into your current working directory. 
The following does this for the _`systemPipeR/SPrnaseq`_ workflow template. 
The name of the resulting workflow directory can be specified under the _`mydirname`_ argument. The default _`NULL`_  uses the name of the chosen workflow. An error is issued if a directory of the same name and path exists already. 

```r
library("systemPipeRdata") 
genWorkenvir(workflow="systemPipeR/SPrnaseq", mydirname=NULL)
setwd("SPrnaseq")
```

On Linux and OS X systems the same can be achieved from the command-line of a terminal with the following commands.

```bash
$ Rscript -e "systemPipeRdata::genWorkenvir(workflow='systemPipeR/SPrnaseq', mydirname=NULL)"
```
