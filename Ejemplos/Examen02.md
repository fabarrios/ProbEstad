Examen02
================

## Segundo Parcial.  

### Lic. Tecnología, ENESj.  

Coughlin et al. examined the breast and cervical screening practices of Hispanic and non-Hispanic women in counties that approximate the 
U.S. southern border region. The study used data from the Behavioral Risk Factor Surveillance System surveys of adults age 18 years or
older conducted in 1999 and 2000. The table below reports the number of observations of Hispanic and non-Hispanic women who had received 
a mammogram in the past 2 years cross-classified with marital status.  

| Marital Status                                 | Hispanic | Non-Hispanic | Total |
|:-----------------------------------------------|:--------:|:------------:|:-----:|
| Currently Married                              |   319    |     738      | 1057  |
| Divorced or Separated                          |   130    |     329      |  459  |
| Widowed                                        |    88    |     402      |  490  |
| Never Married or Living As an Unmarried Couple |    41    |      95      |  136  |
| Total                                          |   578    |     1564     | 2142  |


We select at random a subject who had a mammogram. What is the probability that she is divorced or separated?  

``` r
459/2142
```

    ## [1] 0.2142857

We select at random a subject who had a mammogram and learn that she is
Hispanic. With that information, what is the probability that she is
married?

``` r
319/578
```

    ## [1] 0.5519031

We select at random a subject who had a mammogram. What is the
probability that she is non-Hispanic and divorced or separated?

``` r
329/2142
```

    ## [1] 0.1535948

We select at random a subject who had a mammogram. What is the
probability that she is Hispanic or she is widowed?

``` r
578/2142 + 490/2142 - 88/2142
```

    ## [1] 0.4575163

We select at random a subject who had mammogram. What is the probability
that she is not married?

``` r
1 - (1075/2142)
```

    ## [1] 0.4981326


Coughlin et al. estimated the percentage of women living in border counties along the southern United States with Mexico (designated
counties in California, Arizona, New Mexico, and Texas) who have less than a high school education to be 18.7. Assume the corresponding 
probability is .19. Suppose that we select three women at random. Find the probability that the number with less than a high-school 
education is:

Exactly zero

``` r
dbinom(0, 3, .19)
```

    ## [1] 0.531441

Exactly one

``` r
dbinom(1, 3, .19)
```

    ## [1] 0.373977

More than one

``` r
pbinom(1, 3, .19, lower.tail =  F)
```

    ## [1] 0.094582

Two or fewer

``` r
pbinom(2, 3, .19, lower.tail = T)
```

    ## [1] 0.993141

Two or three

``` r
pbinom(3, 3, .19, lower.tail = T) - pbinom(1, 3, .19, lower.tail = T)
```

    ## [1] 0.094582

Exactly three

``` r
dbinom(3, 3, .19)
```

    ## [1] 0.006859


In a certain population an average of 13 new cases of esophageal cancer are diagnosed each year. If the annual incidence of
esophageal cancer follows a Poisson distribution, find the probability that in a given year, the number of newly diagnosed
cases of esophageal cancer will be:

Exactly 10

``` r
dpois(10, 13)
```

    ## [1] 0.08587015

At least eight

``` r
ppois(7, 13, lower.tail = F)
```

    ## [1] 0.9459718

No more than 12

``` r
ppois(12, 13, lower.tail = T)
```

    ## [1] 0.4631047

Between nine and 15, inclusive

``` r
ppois(15, 13, lower.tail = T) - ppois(8, 13, lower.tail = T)
```

    ## [1] 0.663849

Fewer than seven

``` r
ppois(6, 13, lower.tail = T)
```

    ## [1] 0.02588692


If the total cholesterol values for a certain population are approximately normally distributed with a mean of 200 mg/100 ml and
a standard deviation of 20 mg/100 ml, find the probability that an individual picked at random from this population will have a
cholesterol value:

Between 180 and 200 mg/100 ml

``` r
pnorm(200, mean = 200, sd = 20, lower.tail = T) - pnorm(180, mean = 200, sd = 20, lower.tail = T)
```

    ## [1] 0.3413447

Greater than 225 mg/100 ml

``` r
pnorm(225, mean = 200, sd = 20, lower.tail = F)
```

    ## [1] 0.1056498

Less than 150 mg/100 ml

``` r
pnorm(150, mean = 200, sd = 20, lower.tail = T)
```

    ## [1] 0.006209665

Between 190 and 210 mg/100 ml

``` r
pnorm(210, mean = 200, sd = 20, lower.tail = T) - pnorm(190, mean = 200, sd = 20, lower.tail = T)
```

    ## [1] 0.3829249
