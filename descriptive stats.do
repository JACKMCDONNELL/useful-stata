* set version to Stata 15.  Doing this becomes important as newer and better versions of the software come out
version 15

* COMPUTING A MEAN (FANCY)
webuse systolic

ameans systolic 
/// gives you arithmetic, geometric, harmonic means

ameans systolic, add(7) 
///same as above, but adds 7

* UNORDERED CATEGORIES
sysuse auto, clear
tab rep78
tab foreign
/// generates frequency tables

tab1 rep78 foreign
/// shortcut for above 

///note the difference between tab and tab1 above

tab foreign rep78

/// note that the above gives you a two-way table of frequency counts

* to get more information, download "fre" ado-file and help file
ssc install fre

fre rep78 foreign

/// note that this gives you more information, particularly about missing values

* getting Stata to report both numbers and value labels
numlabel _all, add
/// this adds the labels
numlabel _all, remove 
///this removes the labels

* ORDERED CATEGORIES
numlabel _all, add
tab1 rep78
sum rep78, detail
/// note that using sum, detail gives you all sorts of useful info on measures of central distribution and spread

* QUANTITATIVE VARIABLES 

/// let's generate a vertical box plot
sysuse bplong
graph box bp, over(when) over(sex) ytitle("Systolic blood pressure") title("Response to Treatment, by Sex") subtitle("(120 Preoperative Patients)" " ") note("Source:  Fictional Drug Trial, StataCorp, 2003")

/// how about a horizontal box plot
sysuse nlsw88, clear
graph hbox wage, over(ind, sort(1)) nooutside ytitle("") title("Hourly wage, 1988, woman aged 34-46", span) subtitle(" ") note("Source:  1988 data from NLS, U.S. Dept of Labor, Bureau of Labor Statistics", span)

/// note that the graphics above could more easily be accomplished using the GUI

* SORTING

/// we can sort by various factors and then summarize

by race, sort:  sum married 

* GETTING COMPACT TABLE OF SUMMARY STATISTICS
/// use tabstat

sysuse auto
tabstat price weight mpg rep78, by(foreign)
