# Optimality-Bias
Data, analyses, and manuscript of a study on optimality bias

## Study Summary

### Motivation
Experts seem to be blamed for making suboptimal decisions, even when they base their decisions on all of the available, existing evidence. We have found suggestive evidence in the past that this is largely due an overassessment of expert's cognitive abilities. In this study, we are hoping to test this hypothesis by examining the differential judgments of people making optimal vs. suboptimal decisions based on their level of expertise (i.e., whether they are an expert or non-expert).

### Methods
We will conduct a survey that presents a scenario manipulated to (i) either have an expert or non-expert as the decision maker and (ii) either have the person make the optimal or suboptimal decision. We will then ask participants for their blame of the person, their attributions of the person's mental states, and the features of their decision.

### Dataset
Our dataset includes two blame variables, two mentalistic attribution variables, and one decision-features variable, as well as the group variables. There are also multiple demographic variables and comprehension checks.

## Dataset in Depth
There is one dataset (primary input file) for this study: "S2_clean". The independent variables are the group variables: "choice" (where 1 = optimal decision, 2 = suboptimal decision) and "expert" (where 1 = expert decision maker, 2 = non-expert decision maker). The dependent variables are all measured from 1-9, with 1 being the "lowest" on the variable's dimensions and 9 being the "highest." These dependent variables are listed above, coded as bl1, bl2, pk1, pk2, exp, respectively. These variables are separated based on the two types of scenarios ("isl" for "island case" and "ship" for "ship case").

# Cleaning
We removed most of the datasheet's columns since they are irrelevant for our visualizations and/or main analyses. Groups have been ordered first by the choice made by the decision maker, then by the decision maker's expertise status. All IV's and DV's have their own columns, and have been re-organized to be ordered first by measure (pkc, exp, then blc) then by vignette (isl, ship, then both). This should make it easier to read and use the data. For the visualization, data will be clustered by expertise status and grouped by choice. An example has been provided in an image file.