# Automated ACMG/AMP Variant Pathogenicity Classification for STK11 (Peutz-Jeghers Syndrome): A Reproducible Bayesian Pipeline

**Lena Traczuk**<sup>1,†</sup>, **Dawid Fleischer**<sup>2,†</sup>

<sup>1</sup> Department of Bioinformatics, Warsaw University of Technology, Warsaw, Poland  
<sup>2</sup> Institute of Bioorganic Chemistry, Polish Academy of Sciences, Poznan, Poland  
<sup>†</sup> These authors contributed equally to this work.  

---

## Abstract

Automated, standardized, and reproducible variant classification is critical for clinical genetics. Here, we present **stk11-peutz-pipeline**, an automated Snakemake workflow implementing the Tavtigian Bayesian point framework for the classification of variants in the *STK11* gene (associated with Peutz-Jeghers syndrome). The pipeline integrates variant normalization, VEP v115, SpliceAI, gnomAD v4.1.0, and ClinVar. Analyzing 1209 real ClinVar variants, the pipeline identified 168 clinically actionable (Pathogenic or Likely Pathogenic) variants, demonstrating 65.5% concordance with the commercial Franklin by Genoox platform.

---

## Introduction

Peutz-Jeghers syndrome is a rare autosomal dominant disorder characterized by gastrointestinal hamartomatous polyps and an increased risk of various cancers, caused by mutations in the *STK11* gene [1]. Accurate classification of *STK11* variants according to the ACMG/AMP guidelines [2] is critical for patient surveillance and genetic counseling.

We present an automated, containerized pipeline that implements the Tavtigian Bayesian point system [3] with ClinGen-recommended gene-specific calibrations for *STK11* variant interpretation.

---

## Materials and Methods

The pipeline is implemented in Snakemake [4]. Variants are normalized with BCFtools [5], annotated with VEP v115 [6] (incorporating REVEL [7] and BayesDel [8]), and splicing effects are predicted with SpliceAI [9]. Population frequencies are retrieved from gnomAD v4.1.0 [10] and clinical records from ClinVar [11].

ACMG criteria are mapped to points: PVS1 (+8), PS (+4), PM (+2), PP (+1), BP (-1), BM (-2), BS (-4), BA (-8). The final classification thresholds are: Pathogenic (>= 10), Likely Pathogenic (6-9), VUS (0-5), Likely Benign (-1 to -5), Benign (<= -6).

---

## Results and Discussion

We analyzed **1209 real ClinVar variants** in the *STK11* gene. The pipeline classified 126 as Pathogenic, 42 as Likely Pathogenic, 347 as VUS, 163 as Likely Benign, and 531 as Benign. A total of **168 variants (13.9%)** were classified as clinically actionable (Pathogenic or Likely Pathogenic).

Comparison with the commercial Franklin by Genoox platform showed **65.5% concordance**, with discordances primarily driven by conservative splicing predictions (SpliceAI) and in silico predictor (REVEL) thresholds in our pipeline.

---

## References

1. Hearle, N., et al. (2006). Frequency and spectrum of cancers in Peutz-Jeghers syndrome. *Clinical Cancer Research*, 12(10), 3209-3215.
2. Richards, S., et al. (2015). Standards and guidelines for the interpretation of sequence variants. *Genetics in Medicine*, 17(5), 405-424.
3. Tavtigian, S. V., et al. (2020). Modeling the ACMG/AMP variant classification guidelines as a Bayesian classification framework. *Genetics in Medicine*, 22(3), 617-626.
4. Mölder, F., et al. (2021). Sustainable data analysis with Snakemake. *F1000Research*, 10, 490.
5. Danecek, P., et al. (2021). Twelve years of SAMtools and BCFtools. *GigaScience*, 10(2), giab008.
6. McLaren, W., et al. (2016). The Ensembl Variant Effect Predictor. *Genome Biology*, 17(1), 122.
7. Ioannidis, N. M., et al. (2016). REVEL: An Ensemble Method for Predicting the Pathogenicity of Rare Missense Variants. *American Journal of Human Genetics*, 99(4), 877-885.
8. Feng, B. J. (2017). Analysis of Functional Impact of Missense Variants Using BayesDel. *Human Mutation*, 38(10), 1234-1245.
9. Jaganathan, K., et al. (2019). Predicting Splicing from Primary Sequence with Deep Learning. *Cell*, 176(3), 535-548.
10. Karczewski, K. J., et al. (2020). The mutational constraint spectrum quantified from variation in 141,456 humans. *Nature*, 581(7809), 434-443.
11. Landrum, M. J., et al. (2018). ClinVar: improving access to variant interpretations and supporting evidence. *Nucleic Acids Research*, 46(D1), D1062-D1067.
