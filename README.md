# Cancer-Hierarchical-Classification-Tool
Considering  the similarities between tumors, we used the idea of hierarchical classification that splits a complete multi-class problem into a set of smaller classification problems to build CHCT

## Experimental settings
In this study, the UPGMA unsupervised clustering algorithm was first used to reveal the similarity between tumors, and a two-layer classification structure was constructed on this basis. Information-rich methylation markers were screened out by statistical learning method, and then a component model of classification structure was constructed by machine learning algorithm to achieve accurate classification of primary tumors (AUC=95%)

## Run
```
  run CHCT.ipynb
```
Sample data is provided in `data/`

