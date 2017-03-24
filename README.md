
[![Build status](https://ci.appveyor.com/api/projects/status/fju06tfixss6dce8?svg=true)](https://ci.appveyor.com/project/masalmon/eml-tools) [![Build Status](https://travis-ci.org/maelle/eml.tools.svg?branch=master)](https://travis-ci.org/maelle/eml.tools) [![codecov](https://codecov.io/gh/maelle/eml.tools/branch/master/graph/badge.svg)](https://codecov.io/gh/maelle/eml.tools)

Package in construction for using EML (Ecological Metadata Language) in data analysis, currently only one function. For creating a new EML, see the [rOpenSci `EML` package](https://github.com/ropensci/EML).

Translating factors into their meanings
=======================================

When the EML only has one table
===============================

``` r
library("eml.tools")
data("animals_eml")
data("animals_data")
animals_data
```

    ##    animal age      size
    ## 1       A   A 50.902957
    ## 2       A   A 48.834863
    ## 3       A   A 51.521256
    ## 4       A   A 50.919211
    ## 5       A   A 50.801015
    ## 6       A   B 80.519204
    ## 7       A   B 80.889112
    ## 8       A   B 79.751250
    ## 9       A   B 80.310155
    ## 10      A   B 79.971646
    ## 11      B   A 10.609813
    ## 12      B   A  9.782217
    ## 13      B   A  9.753498
    ## 14      B   A 10.371456
    ## 15      B   A 10.487272
    ## 16      B   B 20.630848
    ## 17      B   B 19.361207
    ## 18      B   B 18.735406
    ## 19      B   B 19.214350
    ## 20      B   B 21.500681

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
```

    ## # A tibble: 20 × 3
    ##         size     animal      age
    ##        <dbl>      <chr>    <chr>
    ## 1  50.902957 monstercat juvenile
    ## 2  48.834863 monstercat juvenile
    ## 3  51.521256 monstercat juvenile
    ## 4  50.919211 monstercat juvenile
    ## 5  50.801015 monstercat juvenile
    ## 6  80.519204 monstercat    adult
    ## 7  80.889112 monstercat    adult
    ## 8  79.751250 monstercat    adult
    ## 9  80.310155 monstercat    adult
    ## 10 79.971646 monstercat    adult
    ## 11 10.609813 monsterdog juvenile
    ## 12  9.782217 monsterdog juvenile
    ## 13  9.753498 monsterdog juvenile
    ## 14 10.371456 monsterdog juvenile
    ## 15 10.487272 monsterdog juvenile
    ## 16 20.630848 monsterdog    adult
    ## 17 19.361207 monsterdog    adult
    ## 18 18.735406 monsterdog    adult
    ## 19 19.214350 monsterdog    adult
    ## 20 21.500681 monsterdog    adult

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
```

    ## # A tibble: 20 × 5
    ##    animal   age      size animal_meaning age_meaning
    ##     <chr> <chr>     <dbl>          <chr>       <chr>
    ## 1       A     A 50.902957     monstercat    juvenile
    ## 2       A     A 48.834863     monstercat    juvenile
    ## 3       A     A 51.521256     monstercat    juvenile
    ## 4       A     A 50.919211     monstercat    juvenile
    ## 5       A     A 50.801015     monstercat    juvenile
    ## 6       A     B 80.519204     monstercat       adult
    ## 7       A     B 80.889112     monstercat       adult
    ## 8       A     B 79.751250     monstercat       adult
    ## 9       A     B 80.310155     monstercat       adult
    ## 10      A     B 79.971646     monstercat       adult
    ## 11      B     A 10.609813     monsterdog    juvenile
    ## 12      B     A  9.782217     monsterdog    juvenile
    ## 13      B     A  9.753498     monsterdog    juvenile
    ## 14      B     A 10.371456     monsterdog    juvenile
    ## 15      B     A 10.487272     monsterdog    juvenile
    ## 16      B     B 20.630848     monsterdog       adult
    ## 17      B     B 19.361207     monsterdog       adult
    ## 18      B     B 18.735406     monsterdog       adult
    ## 19      B     B 19.214350     monsterdog       adult
    ## 20      B     B 21.500681     monsterdog       adult

When the EML only has several tables
====================================

This is the case if the EML documents a database. In this case, we need to use the entityName of the table for which we want to perform the translation.

``` r
library("eml.tools")
data("animals_db_eml")
data("animals_data")
animals_data
```

    ## # A tibble: 20 × 3
    ##    animal    age      size
    ##    <fctr> <fctr>     <dbl>
    ## 1       A      A 50.902957
    ## 2       A      A 48.834863
    ## 3       A      A 51.521256
    ## 4       A      A 50.919211
    ## 5       A      A 50.801015
    ## 6       A      B 80.519204
    ## 7       A      B 80.889112
    ## 8       A      B 79.751250
    ## 9       A      B 80.310155
    ## 10      A      B 79.971646
    ## 11      B      A 10.609813
    ## 12      B      A  9.782217
    ## 13      B      A  9.753498
    ## 14      B      A 10.371456
    ## 15      B      A 10.487272
    ## 16      B      B 20.630848
    ## 17      B      B 19.361207
    ## 18      B      B 18.735406
    ## 19      B      B 19.214350
    ## 20      B      B 21.500681

``` r
eml_translate_factors(df = animals_data,
                      eml = animals_db_eml,
                      which_table = "english_animals",
                      keep = FALSE)
```

    ## # A tibble: 20 × 3
    ##         size     animal      age
    ##        <dbl>      <chr>    <chr>
    ## 1  50.902957 monstercat juvenile
    ## 2  48.834863 monstercat juvenile
    ## 3  51.521256 monstercat juvenile
    ## 4  50.919211 monstercat juvenile
    ## 5  50.801015 monstercat juvenile
    ## 6  80.519204 monstercat    adult
    ## 7  80.889112 monstercat    adult
    ## 8  79.751250 monstercat    adult
    ## 9  80.310155 monstercat    adult
    ## 10 79.971646 monstercat    adult
    ## 11 10.609813 monsterdog juvenile
    ## 12  9.782217 monsterdog juvenile
    ## 13  9.753498 monsterdog juvenile
    ## 14 10.371456 monsterdog juvenile
    ## 15 10.487272 monsterdog juvenile
    ## 16 20.630848 monsterdog    adult
    ## 17 19.361207 monsterdog    adult
    ## 18 18.735406 monsterdog    adult
    ## 19 19.214350 monsterdog    adult
    ## 20 21.500681 monsterdog    adult

``` r
eml_translate_factors(df = animals_data,
                      eml = animals_db_eml,
                      which_table = "english_animals",
                      keep = TRUE)
```

    ## # A tibble: 20 × 5
    ##    animal   age      size animal_meaning age_meaning
    ##     <chr> <chr>     <dbl>          <chr>       <chr>
    ## 1       A     A 50.902957     monstercat    juvenile
    ## 2       A     A 48.834863     monstercat    juvenile
    ## 3       A     A 51.521256     monstercat    juvenile
    ## 4       A     A 50.919211     monstercat    juvenile
    ## 5       A     A 50.801015     monstercat    juvenile
    ## 6       A     B 80.519204     monstercat       adult
    ## 7       A     B 80.889112     monstercat       adult
    ## 8       A     B 79.751250     monstercat       adult
    ## 9       A     B 80.310155     monstercat       adult
    ## 10      A     B 79.971646     monstercat       adult
    ## 11      B     A 10.609813     monsterdog    juvenile
    ## 12      B     A  9.782217     monsterdog    juvenile
    ## 13      B     A  9.753498     monsterdog    juvenile
    ## 14      B     A 10.371456     monsterdog    juvenile
    ## 15      B     A 10.487272     monsterdog    juvenile
    ## 16      B     B 20.630848     monsterdog       adult
    ## 17      B     B 19.361207     monsterdog       adult
    ## 18      B     B 18.735406     monsterdog       adult
    ## 19      B     B 19.214350     monsterdog       adult
    ## 20      B     B 21.500681     monsterdog       adult
