version 15
webuse citytemp2
tabulate region agecat
tabulate region agecat, chi2
tabulate region agecat, chi2 row
tabulate region agecat, expected row
tabulate region agecat, chi V
tabi 30 18 \ 18 14
sysuse auto
table rep78 foreign, c(mean mpg) format(%9.2f) center
webuse citytemp2, clear
set seed 431
sample 10
tabulate region agecat, lrchi2 row
search chi2power
tabulate region agecat, lrchi2 row
chi2power, startf(1) endf(10) incr(1)
