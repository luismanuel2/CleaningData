---
title: "CodeBook.md"
output: html_document
---
Codebook explaining the different variables for data cleaning project.



## variables

 - data_x      : contains joined train and test observations
 - dat_y     : contains joined the activites for train and test observations
 - dat_sub  : contains joined list of subjects from train and test observations
 - data   : contains total set of observations combined with activity labels and subject numbers
 - avg : stores the final result grouped by activity and subject with average value of all features for each group.

## transformations
  - data_x with all features is filtered based on the given columns for mean and std values. 
  - dat_lab is return by the utility function as integer values. These values are transformed to text label 
  - data is prepared by doing column bind of observations, activity labels and subject numbers