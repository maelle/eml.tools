
[![Build status](https://ci.appveyor.com/api/projects/status/fju06tfixss6dce8?svg=true)](https://ci.appveyor.com/project/masalmon/eml-tools) [![Build Status](https://travis-ci.org/maelle/eml.tools.svg?branch=master)](https://travis-ci.org/maelle/eml.tools)

Package in construction for using EML in data analysis, currently only one function.

Translating factors into their meanings.
========================================

``` r
library("eml.tools")
data("animals_eml")
data("animals_data")
animals_data
```

    ##    animal age      size
    ## 1       A   A 49.637110
    ## 2       A   A 50.013253
    ## 3       A   A 49.808188
    ## 4       A   A 49.420364
    ## 5       A   A 47.030950
    ## 6       A   B 79.655797
    ## 7       A   B 78.758519
    ## 8       A   B 81.153179
    ## 9       A   B 80.859211
    ## 10      A   B 80.162062
    ## 11      B   A 10.782582
    ## 12      B   A 10.846742
    ## 13      B   A 10.193702
    ## 14      B   A  9.755727
    ## 15      B   A 10.322579
    ## 16      B   B 18.176724
    ## 17      B   B 20.554877
    ## 18      B   B 20.908847
    ## 19      B   B 19.552936
    ## 20      B   B 19.607218

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
```

    ## # A tibble: 20 × 3
    ##         size     animal      age
    ##        <dbl>      <chr>    <chr>
    ## 1  49.637110 monstercat juvenile
    ## 2  50.013253 monstercat juvenile
    ## 3  49.808188 monstercat juvenile
    ## 4  49.420364 monstercat juvenile
    ## 5  47.030950 monstercat juvenile
    ## 6  79.655797 monstercat    adult
    ## 7  78.758519 monstercat    adult
    ## 8  81.153179 monstercat    adult
    ## 9  80.859211 monstercat    adult
    ## 10 80.162062 monstercat    adult
    ## 11 10.782582 monsterdog juvenile
    ## 12 10.846742 monsterdog juvenile
    ## 13 10.193702 monsterdog juvenile
    ## 14  9.755727 monsterdog juvenile
    ## 15 10.322579 monsterdog juvenile
    ## 16 18.176724 monsterdog    adult
    ## 17 20.554877 monsterdog    adult
    ## 18 20.908847 monsterdog    adult
    ## 19 19.552936 monsterdog    adult
    ## 20 19.607218 monsterdog    adult

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
```

    ## # A tibble: 20 × 5
    ##    animal   age      size animal_meaning age_meaning
    ##     <chr> <chr>     <dbl>          <chr>       <chr>
    ## 1       A     A 49.637110     monstercat    juvenile
    ## 2       A     A 50.013253     monstercat    juvenile
    ## 3       A     A 49.808188     monstercat    juvenile
    ## 4       A     A 49.420364     monstercat    juvenile
    ## 5       A     A 47.030950     monstercat    juvenile
    ## 6       A     B 79.655797     monstercat       adult
    ## 7       A     B 78.758519     monstercat       adult
    ## 8       A     B 81.153179     monstercat       adult
    ## 9       A     B 80.859211     monstercat       adult
    ## 10      A     B 80.162062     monstercat       adult
    ## 11      B     A 10.782582     monsterdog    juvenile
    ## 12      B     A 10.846742     monsterdog    juvenile
    ## 13      B     A 10.193702     monsterdog    juvenile
    ## 14      B     A  9.755727     monsterdog    juvenile
    ## 15      B     A 10.322579     monsterdog    juvenile
    ## 16      B     B 18.176724     monsterdog       adult
    ## 17      B     B 20.554877     monsterdog       adult
    ## 18      B     B 20.908847     monsterdog       adult
    ## 19      B     B 19.552936     monsterdog       adult
    ## 20      B     B 19.607218     monsterdog       adult
