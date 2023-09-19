# Cancer-Hierarchical-Classification-Tool
In view of the lineage relationship between tumors and the specificity of tumor methylation pattern, the tumor hierarchy classifier was developed by machine learning algorithm, which realized the accurate classification of primary tumors (AUC=95%) and provided a proof of concept for hierarchical classification in the field of tumor diagnosis.

## Experimental settings
In this study, the UPGMA unsupervised clustering algorithm was first used to reveal the similarity between tumors, and a two-layer classification structure was constructed on this basis. Information-rich methylation markers were screened out by statistical learning method, and then a component model of classification structure was constructed by machine learning algorithm to achieve accurate classification of primary tumors (AUC=95%)

## Run
'''
run CHCT.ipynb
'''
Sample data is provided in 'data/'
