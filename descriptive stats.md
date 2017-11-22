The first thing to do is to set the version to Stata 15.  Doing this becomes important as newer and better versions of the software come out

```version 15```

# computing a mean

`webuse systolic`

The above loads the "systolic" standard stata dataset into the computer's memory.

`ameans systolic` 
  
```Variable |    Type             Obs        Mean       [95% Conf. Interval]
-------------+---------------------------------------------------------------
    systolic | Arithmetic           58    18.87931        15.51349   22.24513 
             |  Geometric           54    15.54611        12.04562   20.06386 
             |   Harmonic           54    8.103544        5.410787   16.13174 
-----------------------------------------------------------------------------
```
Note that the above gives you **arithmetic**, **geometric**, and **harmonic means**.  Typically the **arithmetic** mean is what we use in statistics, but there are times when the others are useful.

```ameans systolic, add(7)```

Performs the same operation as above, but adds 7 to the means.

``` Variable |    Type             Obs        Mean       [95% Conf. Interval]
-------------+---------------------------------------------------------------
    systolic | Arithmetic           58    25.87931        22.51349   29.24513 *
             |  Geometric           58     21.1562        17.25143    25.9448 *
             |   Harmonic           58    13.03886        8.747185   25.59825 *
-----------------------------------------------------------------------------
(*) 7 was added to the variables prior to calculating the results.
```

# unordered categories

```sysuse auto, clear
tab rep78
```

```
     Repair |
Record 1978 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |          2        2.90        2.90
          2 |          8       11.59       14.49
          3 |         30       43.48       57.97
          4 |         18       26.09       84.06
          5 |         11       15.94      100.00
------------+-----------------------------------
      Total |         69      100.00



tab foreign
-> tabulation of foreign  

   Car type |      Freq.     Percent        Cum.
------------+-----------------------------------
   Domestic |         52       70.27       70.27
    Foreign |         22       29.73      100.00
------------+-----------------------------------
      Total |         74      100.00
```

By using the above, we are generating **frequency tables**.  Here's a nice shortcut to get the same info.  Note the difference between *tab* and *tab1*.

```tab1 rep78 foreign```

```
-> tabulation of rep78  

     Repair |
Record 1978 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |          2        2.90        2.90
          2 |          8       11.59       14.49
          3 |         30       43.48       57.97
          4 |         18       26.09       84.06
          5 |         11       15.94      100.00
------------+-----------------------------------
      Total |         69      100.00

-> tabulation of foreign  

   Car type |      Freq.     Percent        Cum.
------------+-----------------------------------
   Domestic |         52       70.27       70.27
    Foreign |         22       29.73      100.00
------------+-----------------------------------
      Total |         74      100.00
```

To get a two-way table of frequency count, use *tab* and put the two variables you want.

```tab foreign rep78```

```

           |                   Repair Record 1978
  Car type |         1          2          3          4          5 |     Total
-----------+-------------------------------------------------------+----------
  Domestic |         2          8         27          9          2 |        48 
   Foreign |         0          0          3          9          9 |        21 
-----------+-------------------------------------------------------+----------
     Total |         2          8         30         18         11 |        69 
```

If you want even more information, consider downloading the "fre" ado-file and its component help file. The main advantage to *fre* is the information it provides on missing values.

```ssc install fre```

```fre rep78 foreign```

```
rep78 -- Repair Record 1978
-----------------------------------------------------------
              |      Freq.    Percent      Valid       Cum.
--------------+--------------------------------------------
Valid   1     |          2       2.70       2.90       2.90
        2     |          8      10.81      11.59      14.49
        3     |         30      40.54      43.48      57.97
        4     |         18      24.32      26.09      84.06
        5     |         11      14.86      15.94     100.00
        Total |         69      93.24     100.00           
Missing .     |          5       6.76                      
Total         |         74     100.00                      
-----------------------------------------------------------

foreign -- Car type
----------------------------------------------------------------
                   |      Freq.    Percent      Valid       Cum.
-------------------+--------------------------------------------
Valid   0 Domestic |         52      70.27      70.27      70.27
        1 Foreign  |         22      29.73      29.73     100.00
        Total      |         74     100.00     100.00           
----------------------------------------------------------------
```

# getting Stata to report both numbers and value labels

Here are some useful commands for number labels.  

```numlabel _all, add```

```numlabel _all, remove```

These commands are pretty self-explanatory.  Try running one of our analyses above both ways.  

# summarizing ordered categoricals

```numlabel _all, add```

```tab1 rep78```

```-> tabulation of rep78  

     Repair |
Record 1978 |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |          2        2.90        2.90
          2 |          8       11.59       14.49
          3 |         30       43.48       57.97
          4 |         18       26.09       84.06
          5 |         11       15.94      100.00
------------+-----------------------------------
      Total |         69      100.00
```
```sum rep78, detail
  Repair Record 1978
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            2              1
10%            2              2       Obs                  69
25%            3              2       Sum of Wgt.          69

50%            3                      Mean           3.405797
                        Largest       Std. Dev.      .9899323
75%            4              5
90%            5              5       Variance       .9799659
95%            5              5       Skewness      -.0570331
99%            5              5       Kurtosis       2.678086

```

The *sum, detail* command gives you all sorts of useful info on measures of central distribution and spread.  Note that in Stata, the kurtosis of a normal distribution is set at 3

# quantitative variables 

First, let's generate a vertical box plot.

```sysuse bplong
graph box bp, over(when) over(sex) ytitle("Systolic blood pressure") title("Response to Treatment, by Sex") subtitle("(120 Preoperative Patients)" " ") note("Source:  Fictional Drug Trial, StataCorp, 2003")
```

![SBP Graph](https://github.com/JACKMCDONNELL/useful-stata/blob/6c655f6936b67ce6f3575ba74363e0d6a2576787/Graph_1.jpg)

To generate a horizontal box plot, use the example code below.

```sysuse nlsw88, clear
graph hbox wage, over(ind, sort(1)) nooutside ytitle("") title("Hourly wage, 1988, woman aged 34-46", span) subtitle(" ") note("Source:  1988 data from NLS, U.S. Dept of Labor, Bureau of Labor Statistics", span)
```

![Hourly Wages](https://github.com/JACKMCDONNELL/useful-stata/blob/6c655f6936b67ce6f3575ba74363e0d6a2576787/Graph_2.jpg)

Of course, the graphics above could be much more easily be accomplished using the graphical interface rather than typing the above in.

# sorting

We can sort by various factors and then summarize.  Continuing on with the data currently loaded into memory, we type

```by race, sort:  sum married```

```

-----------------------------------------------------------------------------------------------------------
-> race = white

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
     married |      1,637    .7025046     .457296          0          1

-----------------------------------------------------------------------------------------------------------
-> race = black

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
     married |        583    .4699828    .4995268          0          1

-----------------------------------------------------------------------------------------------------------
-> race = other

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
     married |         26    .6923077    .4706787          0          1

```

# getting compact table of summary stats

Lastly, let's look at getting a compact table of summary stats, using the *tabstat* command

```
sysuse auto
tabstat price weight mpg rep78, by(foreign)
```

```Summary statistics: mean
  by categories of: foreign (Car type)

 foreign |     price    weight       mpg     rep78
---------+----------------------------------------
Domestic |  6072.423  3317.115  19.82692  3.020833
 Foreign |  6384.682  2315.909  24.77273  4.285714
---------+----------------------------------------
   Total |  6165.257  3019.459   21.2973  3.405797
--------------------------------------------------
```
