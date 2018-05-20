# barcaweather

The goal of barcaweather is to tell you the temperature in Barcelona for any day in the coming week. This might be useful in helping one to plan events, or to prepare what kind of clothing to wear. This package uses the darksky api to get the temperature for any day in the coming week. The temperature is calculated by taking the mean between the daily maximum and minimum temperatures.

## Installation

You can install the released version of barcaweather from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("barcaweather")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
barcaweather(3, metric = "TRUE")
```

