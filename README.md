
Package in construction for using eml in data analysis.

First goal: having a function for translating factors into their meanings.

``` r
library("eml.tools")
data("animals_eml")
data("animals_data")
animals_data
```

    ## # A tibble: 20 × 3
    ##    animal    age      size
    ##    <fctr> <fctr>     <dbl>
    ## 1       A      A 51.119830
    ## 2       A      A 52.302203
    ## 3       A      A 48.086704
    ## 4       A      A 49.038384
    ## 5       A      A 48.751160
    ## 6       A      B 78.598164
    ## 7       A      B 80.896794
    ## 8       A      B 77.397638
    ## 9       A      B 80.028543
    ## 10      A      B 80.010429
    ## 11      B      A 11.683763
    ## 12      B      A  8.769121
    ## 13      B      A 11.657606
    ## 14      B      A  9.925747
    ## 15      B      A 10.999829
    ## 16      B      B 20.154136
    ## 17      B      B 20.402627
    ## 18      B      B 18.221789
    ## 19      B      B 18.683263
    ## 20      B      B 20.603651

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
```

    ## # A tibble: 20 × 3
    ##         size     animal      age
    ##        <dbl>      <chr>    <chr>
    ## 1  51.119830 monstercat juvenile
    ## 2  52.302203 monstercat juvenile
    ## 3  48.086704 monstercat juvenile
    ## 4  49.038384 monstercat juvenile
    ## 5  48.751160 monstercat juvenile
    ## 6  78.598164 monstercat    adult
    ## 7  80.896794 monstercat    adult
    ## 8  77.397638 monstercat    adult
    ## 9  80.028543 monstercat    adult
    ## 10 80.010429 monstercat    adult
    ## 11 11.683763 monsterdog juvenile
    ## 12  8.769121 monsterdog juvenile
    ## 13 11.657606 monsterdog juvenile
    ## 14  9.925747 monsterdog juvenile
    ## 15 10.999829 monsterdog juvenile
    ## 16 20.154136 monsterdog    adult
    ## 17 20.402627 monsterdog    adult
    ## 18 18.221789 monsterdog    adult
    ## 19 18.683263 monsterdog    adult
    ## 20 20.603651 monsterdog    adult

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
```

    ## # A tibble: 20 × 5
    ##    animal   age      size animal_meaning age_meaning
    ##     <chr> <chr>     <dbl>          <chr>       <chr>
    ## 1       A     A 51.119830     monstercat    juvenile
    ## 2       A     A 52.302203     monstercat    juvenile
    ## 3       A     A 48.086704     monstercat    juvenile
    ## 4       A     A 49.038384     monstercat    juvenile
    ## 5       A     A 48.751160     monstercat    juvenile
    ## 6       A     B 78.598164     monstercat       adult
    ## 7       A     B 80.896794     monstercat       adult
    ## 8       A     B 77.397638     monstercat       adult
    ## 9       A     B 80.028543     monstercat       adult
    ## 10      A     B 80.010429     monstercat       adult
    ## 11      B     A 11.683763     monsterdog    juvenile
    ## 12      B     A  8.769121     monsterdog    juvenile
    ## 13      B     A 11.657606     monsterdog    juvenile
    ## 14      B     A  9.925747     monsterdog    juvenile
    ## 15      B     A 10.999829     monsterdog    juvenile
    ## 16      B     B 20.154136     monsterdog       adult
    ## 17      B     B 20.402627     monsterdog       adult
    ## 18      B     B 18.221789     monsterdog       adult
    ## 19      B     B 18.683263     monsterdog       adult
    ## 20      B     B 20.603651     monsterdog       adult
