# Graph Matching / Quadratic Assignment Problem for unlabeled sensing
MATLAB code for the graph matching algorithm applied to the unlabeled sensing (ULS) problem [1]. The algorithm is applied to the setup when the unknown permutation is r-local. This code was written by Ahmed Ali Abbasi as part of a larger research project on ULS, and counts towards the partial fulfilment of research requirement for the PhD program at ECE department, Tufts University. The code was checked by Professor [Abiy Tasissa](http://sites.tufts.edu/atasissa/) and Professor  [Shuchin Aeron](http://www.ece.tufts.edu/~shuchin/).  

## Instructions
* To reproduce any of the results in [1], run the corerresponding file in the `figures` folder. For example, to reproduce Fig. 3(c), run  the `main.m` in the `figures\gw_vs_qap` folder. To reproduce Fig.4, Fig.5, Fig. 6, set parameters (n,r,d,m) and run the  `main.m` file in  `figures\r_plots` folder. 

* The code for benchmark Gromov-Wasserstein algorithm is contained in the folder `code\gw`. This code was forked from the repository for the paper [2].

* For linux systems, replace ' \ ' at the beginning of the the main.m files in the `figures` folder by ' / '. 

## MATLAB files description
`make_r_local_permutation.m`: inputs are r, n; returns  an r-local permutation of size nxn with each block of size rxr. 

`proj_r_by_r`: input cost matrix C; return permutation P such that P = argmin <C,P>.

`munkres.m`: the minimization P = argmin <C,P> is by the Hungarian assignment algorithm.


## References
[1]. Ahmed Ali Abbasi, Abiy Tasissa, and Shuchin Aeron. R-local unlabeled sensing: A novel graph matching approach for multiview unlabeled sensing under local permutations. IEEE Open Journal of Signal Processing, 2:309–317, 2021.
[URL](https://ieeexplore.ieee.org/document/9440727)

[2]. Peyré, Gabriel, Marco Cuturi, and Justin Solomon. "Gromov-Wasserstein averaging of kernel and distance matrices." International Conference on Machine Learning. PMLR, 2016.


## Feedback
Please email any feedback to <a href="mailto:ahmed.abbasi@tufts.edu">Ahmed Abbasi</a>.
