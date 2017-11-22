# relationships between categorical variables
It's often important to evaluate the relationship between variables.  Let's consider how to perform **cross-tabulation** in Stata

```version 15
webuse citytemp2
tabulate region agecat
```

```
    Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |        46         83         37 |       166 
   N Cntrl |       162         92         30 |       284 
     South |       139         68         43 |       250 
      West |       160         73         23 |       256 
-----------+---------------------------------+----------
     Total |       507        316        133 |       956 
```
In this particular example, we get categories of age by census region.  Because we listed "region" first and "agecat" second, we get the former in the rows and the latter in the columns.  What if we want to add a chi-square analysis?  The code is simple:

```tabulate region agecat, chi2```

``` Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |        46         83         37 |       166 
   N Cntrl |       162         92         30 |       284 
     South |       139         68         43 |       250 
      West |       160         73         23 |       256 
-----------+---------------------------------+----------
     Total |       507        316        133 |       956 

          Pearson chi2(6) =  61.2877   Pr = 0.000
```

We can see from our output that the chi square statistic for 6 degrees of freedom is 61.29, and that in this case our results reach statistical significance, *p* = <0.001.  

In order to figure out how many degrees of freedom in a table like this, simply take **(R-1)(C-1)**, where R = number of rows in the table, and C = number of columns.  In this example we get **(4-1)(3-1)** or **6**.

If we want to add row frequencies to our table, it is straightforward:

```tabulate region agecat, chi2 row```

```
----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

    Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |        46         83         37 |       166 
           |     27.71      50.00      22.29 |    100.00 
-----------+---------------------------------+----------
   N Cntrl |       162         92         30 |       284 
           |     57.04      32.39      10.56 |    100.00 
-----------+---------------------------------+----------
     South |       139         68         43 |       250 
           |     55.60      27.20      17.20 |    100.00 
-----------+---------------------------------+----------
      West |       160         73         23 |       256 
           |     62.50      28.52       8.98 |    100.00 
-----------+---------------------------------+----------
     Total |       507        316        133 |       956 
           |     53.03      33.05      13.91 |    100.00 

          Pearson chi2(6) =  61.2877   Pr = 0.000

```

To perform a similar analysis, but with expected frequencies added, type the following:

```tabulate region agecat, expected row```
```
+--------------------+
| Key                |
|--------------------|
|     frequency      |
| expected frequency |
|   row percentage   |
+--------------------+

    Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |        46         83         37 |       166 
           |      88.0       54.9       23.1 |     166.0 
           |     27.71      50.00      22.29 |    100.00 
-----------+---------------------------------+----------
   N Cntrl |       162         92         30 |       284 
           |     150.6       93.9       39.5 |     284.0 
           |     57.04      32.39      10.56 |    100.00 
-----------+---------------------------------+----------
     South |       139         68         43 |       250 
           |     132.6       82.6       34.8 |     250.0 
           |     55.60      27.20      17.20 |    100.00 
-----------+---------------------------------+----------
      West |       160         73         23 |       256 
           |     135.8       84.6       35.6 |     256.0 
           |     62.50      28.52       8.98 |    100.00 
-----------+---------------------------------+----------
     Total |       507        316        133 |       956 
           |     507.0      316.0      133.0 |     956.0 
           |     53.03      33.05      13.91 |    100.00 
```

The *expected* shows us what frequencies we would expect if the rows and columns were truly independent.  

It's important to have some sense of *how* significant our results are.  To do this, we compute Ø (phi), which is computed by taking the square root of the quantity (chi-square statistic/N). Stata performs a variation of this, called Cramér's V.  Results of 0-0.19 are considered weak, 0.2-0.49 are moderate, and > 0.5 are strong.  

```tabulate region agecat, chi V```

```
    Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |        46         83         37 |       166 
   N Cntrl |       162         92         30 |       284 
     South |       139         68         43 |       250 
      West |       160         73         23 |       256 
-----------+---------------------------------+----------
     Total |       507        316        133 |       956 

          Pearson chi2(6) =  61.2877   Pr = 0.000
               Cramér's V =   0.1790
```

Here we see that our results are indeed significant, but the V level shows us it is a fairly weak association.  

Note that when we have ordered (as opposed to nominal) categorical comparisons to make, we can add on other measures of association like Kruskal's gamma and Kendall's tau-b.

It is useful to also learn the immediate form of the tab command, which is called with **tabi** in the command line.  For example:

```tabi 30 18 \ 18 14```

```
        |          col
       row |         1          2 |     Total
-----------+----------------------+----------
         1 |        30         18 |        48 
         2 |        18         14 |        32 
-----------+----------------------+----------
     Total |        48         32 |        80 

           Fisher's exact =                 0.645
   1-sided Fisher's exact =                 0.371
```

So if we needed to compute measures of association but did not have access to the data set, this is a reasonable solution.  

# comparing categorical to quantitative variables

```sysuse auto```

```table rep78 foreign, c(mean mpg) format(%9.2f) center```

```
------------------------------
Repair    |
Record    |      Car type     
1978      | Domestic   Foreign
----------+-------------------
        1 |   21.00           
        2 |   19.12           
        3 |   19.00     23.33 
        4 |   18.44     24.89 
        5 |   32.00     26.33 
------------------------------
```

Though it is possible to do it all from the command line, *table* is a good example of a Stata command that is easier to access through the GUI interface.  In this case, simply go to **Statistics > Summaries, tables, and tests > Other tables > Flexible table of summary statistics**

Finally, let's look a bit at power calculations.  

```webuse citytemp2, clear```

We need to load a different data set, but Stata will freak out that in doing so we will inadvertently erase our data, necessitating the *clear* in the above command

```set seed 431```

A seed determines where our random sample generation will start.

```sample 10```

This tells Stata to sample 10% of the data.

```tabulate region agecat, lrchi2 row```

```
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

    Census |              agecat
    Region |     19-29      30-34        35+ |     Total
-----------+---------------------------------+----------
        NE |         5          8          3 |        16 
           |     31.25      50.00      18.75 |    100.00 
-----------+---------------------------------+----------
   N Cntrl |        11         13          3 |        27 
           |     40.74      48.15      11.11 |    100.00 
-----------+---------------------------------+----------
     South |         6          6          4 |        16 
           |     37.50      37.50      25.00 |    100.00 
-----------+---------------------------------+----------
      West |        17         14          6 |        37 
           |     45.95      37.84      16.22 |    100.00 
-----------+---------------------------------+----------
     Total |        39         41         16 |        96 
           |     40.62      42.71      16.67 |    100.00 

 likelihood-ratio chi2(6) =   2.5402   Pr = 0.864
```
Note that our results are no longer statistically significant.  How much would we have to increase our sample size to power the study properly enough to see a difference that may be there?  One helpful method for determining this is found in a user-created package in Stata.

```search chi2power```and follow the instructions to install the "ado" package.  Now we can run the *chi2power* command right after repeating the above *tabulate* command.

```chi2power, startf(1) endf(10) incr(1)```

```
alpha = .05
sample size factor = 1.00 power = 0.1777 for n = 96
sample size factor = 2.00 power = 0.3415 for n = 192
sample size factor = 3.00 power = 0.5073 for n = 288
sample size factor = 4.00 power = 0.6522 for n = 384
sample size factor = 5.00 power = 0.7663 for n = 480
sample size factor = 6.00 power = 0.8496 for n = 576
sample size factor = 7.00 power = 0.9068 for n = 672
sample size factor = 8.00 power = 0.9441 for n = 768
sample size factor = 9.00 power = 0.9674 for n = 864
sample size factor = 10.00 power = 0.9815 for n = 960
```

The *startf(1)* command tells Stata to compute the power for our current N of 96.  The *endf(10)* command tells Stata to do a power analysis where the percentage in each cell is the same but there up to 10 times as many observations.  The *incr(1)* command just tells Stata to do this analysis in increments of 1 - 1X the starting sample size then 2X then 3X . . . although the way up to 10X.  

In this case, to reach a power of >80% (85%) we would need a sample size of 576.  This has clear implications for study design and funding.  




