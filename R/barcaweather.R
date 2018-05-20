#' Obtain the temperature for any day in the coming week in Barcelona
#'
#' The darksky api, among other functions, allows one to retrieve the temperature
#' of any day in the coming week. This might be useful in helping one to plan
#' events, or to prepare what kind of clothing to wear.
#'
#' This package uses the darksky api to get the temperature for any day in
#' the coming week. The temperature is calculated by taking the mean between the
#' daily maximum and minimum temperatures.
#'
#' @import httr
#' @param day an integer number of days from today for which temperature is desired
#' @param metric a boolean that determines whether the temperature returned
#' is in celsius (metric = TRUE) or fahrenheit (metric = FALSE)
#' @param private_key private key for use with darksky api
#'
#'
#' @return a float that represents the temperature for the given day
#' @export
#'
#' @examples
#' weather_tmr <- "1"
#' barcaweather(weather_tmr) # returns the weather for tomorrow in fahrenheit
#'

barcaweather <- function(day, metric = FALSE, private_key = '019b0ffe039ab1061724964decc1a73e'){

  week <- seq(0,7)
  measurement <- 'fahrenheit'
  num_days <- 'days'

  # ensures that only values of day within the coming week are accepted
  if (day < 0 | day > 7){
    return('invalid value for day entered')
  }

  # ensures that only integer values of day are accepted
  if (!(sum(day == week) > 0)){
    return('input has to be an integer specifying how many days from today')
  }

  url_barca <- 'https://api.darksky.net/forecast/019b0ffe039ab1061724964decc1a73e/41.394161,%202.177252'

  tst <- httr::GET(url = url_barca)
  weather <- httr::content(tst)

  # calculate temperature
  high <- weather$daily$data[[day]]$temperatureHigh
  low <- weather$daily$data[[day]]$temperatureLow
  temp <- 0.5*(high + low)

  if (metric == TRUE){
    temp <- (5/9) * (temp - 32)
    measurement <- 'celsius'
  }

  if (day == 1){
    num_days <- 'day'
  }


  return(paste0('The weather ', day, ' ', num_days, ' from now is ', temp, ' ', measurement))
}
