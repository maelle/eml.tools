
[![Build status](https://ci.appveyor.com/api/projects/status/fju06tfixss6dce8?svg=true)](https://ci.appveyor.com/project/masalmon/eml-tools) [![Build Status](https://travis-ci.org/maelle/eml.tools.svg?branch=master)](https://travis-ci.org/maelle/eml.tools) [![codecov](https://codecov.io/gh/maelle/eml.tools/branch/master/graph/badge.svg)](https://codecov.io/gh/maelle/eml.tools)

Package in construction for using EML (Ecological Metadata Language) in data analysis, currently only one function. For creating a new EML, see the [rOpenSci `EML` package](https://github.com/ropensci/EML).

Translating factors into their meanings.
========================================

``` r
library("eml.tools")
data("animals_eml")
data("animals_data")
animals_data
```

    ##    animal age      size
    ## 1       A   A 49.611134
    ## 2       A   A 50.278625
    ## 3       A   A 49.091633
    ## 4       A   A 50.653891
    ## 5       A   A 52.433416
    ## 6       A   B 80.771200
    ## 7       A   B 79.417788
    ## 8       A   B 80.365853
    ## 9       A   B 81.824793
    ## 10      A   B 79.341818
    ## 11      B   A 10.604038
    ## 12      B   A 11.280307
    ## 13      B   A 10.278707
    ## 14      B   A 11.399420
    ## 15      B   A  9.764245
    ## 16      B   B 21.982885
    ## 17      B   B 20.164679
    ## 18      B   B 19.719429
    ## 19      B   B 18.717014
    ## 20      B   B 19.311718

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = FALSE)
```

    ##    animal age      size
    ## 1       A   A 49.611134
    ## 2       A   A 50.278625
    ## 3       A   A 49.091633
    ## 4       A   A 50.653891
    ## 5       A   A 52.433416
    ## 6       A   B 80.771200
    ## 7       A   B 79.417788
    ## 8       A   B 80.365853
    ## 9       A   B 81.824793
    ## 10      A   B 79.341818
    ## 11      B   A 10.604038
    ## 12      B   A 11.280307
    ## 13      B   A 10.278707
    ## 14      B   A 11.399420
    ## 15      B   A  9.764245
    ## 16      B   B 21.982885
    ## 17      B   B 20.164679
    ## 18      B   B 19.719429
    ## 19      B   B 18.717014
    ## 20      B   B 19.311718

``` r
eml_translate_factors(df = animals_data, eml = animals_eml, keep = TRUE)
```

    ##    animal age      size
    ## 1       A   A 49.611134
    ## 2       A   A 50.278625
    ## 3       A   A 49.091633
    ## 4       A   A 50.653891
    ## 5       A   A 52.433416
    ## 6       A   B 80.771200
    ## 7       A   B 79.417788
    ## 8       A   B 80.365853
    ## 9       A   B 81.824793
    ## 10      A   B 79.341818
    ## 11      B   A 10.604038
    ## 12      B   A 11.280307
    ## 13      B   A 10.278707
    ## 14      B   A 11.399420
    ## 15      B   A  9.764245
    ## 16      B   B 21.982885
    ## 17      B   B 20.164679
    ## 18      B   B 19.719429
    ## 19      B   B 18.717014
    ## 20      B   B 19.311718
