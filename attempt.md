# Perinatal Factors Impact Prognosis in Neonatal HIE – Methods and Analysis

## Overview

With this study, I evaluate the impact of perinatal risk factors on outcomes in neonatal hypoxic-ischemic encephalopathy (HIE). Many previous studies have examined how potential risk factors are associated with the development of HIE in the neonate, but very few have characterized the relative effect of each of these factors on short-term prognosis. In addition to evaluating basic statistics covering difference in demographics between those who get cooling therapy and those who don’t (a proxy for disease severity),  I will use the 2012 HCUP KID database to examine how well-known risk factors of HIE translate into immediate patient outcomes – 1) inpatient length of stay (**LOS**) and 2) **infant death** in the neonatal period.
Data Source

I use the HCUP 2012 Kids’ Inpatient Database (KID) to perform this analysis. HCUP has several advantages here– it is a representative national sample with input from all payers and contains an exhaustive trove of inpatient diagnosis and procedure codes. Since I already had access to these data through the Cleveland Clinic and a valid Data Use Agreement through that means, I performed my analyses in Stata IC 15.1 on my personal computer.  
Study Population

My study population was newborns (admission occurred in first month of life) in the US diagnosed with HIE (ascertained by ICD9 codes) in 2012. I excluded all infants born before 35 weeks gestation, as whether such infants can even develop HIE is a matter of vigorous clinical debate. Any infants with metabolic disease were excluded, as well as infants with birth weight < 2000g. Additional exclusion criteria were neonatal coagulopathy, complex congenital heart disease, major congenital malformations, imperforate anus, suspected neuromuscular disorders, and known lethal chromosomal disorders. (Note that the above are common exclusion criteria for neonatal therapeutic hypothermia.) For infants who received cooling therapy, I excluded those who began cooling therapy after the first day of life (cooling therapy should be started in first 6 hours of life to be effective).

In this analysis, I started with 5,912 neonates (representing all the neonates in this year’s HCUP with HIE.) After the above exclusion criteria are applied, I was left with 2,164 neonates (154 of whom received cooling therapy).

