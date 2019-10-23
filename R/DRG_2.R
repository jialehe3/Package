
library(tidyverse)
#' Title
#'
#' @param stat any statistics such as mean, median and sd
#'
#' @return values by drg code with the statistics used
#' @export
#'
#' @examples
DRG_stat <- function(stat){
  DRG %>%
    mutate(drgcode = substr(DRG.Definition,1,3)) %>%
    group_by(drgcode) %>%
    summarise(result1 = stat(Average.Total.Payments),result2 = stat(Average.Medicare.Payments))
}
