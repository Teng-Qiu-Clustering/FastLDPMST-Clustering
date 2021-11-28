# FastLDPMST: an efficient density-based clustering method for large-size datasets.
Cluster analysis is widely studied and used in diverse
fields. Despite that
many clustering methods have been proposed, it is rare for a clustering
method to perform well simultaneously on the following characteristics:  
* effectiveness (in terms of accuracy);
* efficiency (in terms of speed);
* robustness (in terms of noise and parameter sensitivity);
* user-friendliness (in terms of the number of user-specified parameters,
interpretability, and reproducibility of the results, etc.). 

This work contributes to the field of clustering by providing a new solution (i.e., FastLDPMST) which largely improves the efficiency of LDP-MST, without sacrificing the merits of LDP-MST in effectiveness, robustness, and user-friendliness. 
FastLDPMST achieves a good balance among effectiveness, efficiency, robustness, and user-friendliness, and thus it could
have a certain degree of practical value in this big data era.

# Quick start
**Demo1.m** and **Demo2.m** were successfully tested on Matlab2018 (on a computer with a 3 GHz Intel i5 processor and 32 GB RAM). 

Note: 

1) for **Demo 1**, one can choose different datasets (**shown in the datasets section**) to test.

2) for **Demo 2**, the clustering results may be different in different runs, because the test datasets in Demo2 are randomly sampled from some density functions (i.e., the test datasets are different in different runs). Note that the proposed method is not sensitive to the initialization (i.e., for the same dataset, the proposed method will show the same result in different runs. This can be demonstrated by Demo 1). 

3) **One can also choose to directly run the code in my code ocean: https://codeocean.com/capsule/3297972/tree**

# Figures

![Fig.1](https://github.com/Teng-Qiu-Clustering/FastLDPMST/blob/main/LDPMST-vs-FastLDPMST_on_TB_SF_CC_CG_Flower.png)
**Fig.1**: Comparison between LDP-MST and FastLDPMST on multiple datasets sampled from five different density functions (TB, SF, CC, CG, and Flower). The first and second rows compare the runtime (in seconds) and clustering accuracy
(ARI scores) of the two methods on a set of datasets with the numbers of samples varying from N=2^14 to N=2^24 (**> 16 million**). For instance, the test datasets with N=2^15 samples are displayed in the third row, where each point represents a sample; the corresponding clustering results of FastLDPMST are shown in the fourth row, where different colors on the points in each dataset indicate different clusters they are assigned to). The NMI scores and the visualization of the clustering results of LDP-MST are omitted here, as both methods obtain almost the same performance. ARI: adjusted Rand index (its value ranges
from -1 to 1; higher values
indicate higher clustering accuracy). 
 
 
 **** 
 
 ![Fig.2](https://github.com/Teng-Qiu-Clustering/FastLDPMST/blob/main/LDPMST-vs-FastLDPMST_on_GSC.png)
**Fig.2**: Comparison between LDP-MST (2nd column) and FastLDPMST (3rd column)
on two challenging datasets (1st column). Each point represents a 2-dimensional sample. Different colors (in 2nd and 3rd columns) on points indicate different clustering labels assigned by the clustering methods. 
 
 
