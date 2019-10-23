DRG <- read.csv("/Users/hejiale/data_science_1/data_science_1/DRG_data.csv")
save(DRG, file = "/Users/hejiale/data_science_1/DRG/data/DRG.RData")
library(tidyverse)
#' Title
#'
#' @param i 1 for total payments and 2 for medicare payments
#'
#' @return output logged boxplot
#' @export
#'
#' @examples
DRG_plot <- function(i){
  a <- c("Average.Total.Payments","Average.Medicare.Payments")
  b <- c(11,12)
  DRG %>%
    mutate(drgcode = substr(DRG.Definition,1,3)) %>%
    group_by(drgcode) %>%
    ggplot()+
    geom_boxplot(aes(y=log(DRG[,b[i]]),x = drgcode))+
    labs(title = "boxplot of logged average medicare payments by DRG code")+
    ylab(paste("logged ", a[i]))+
    xlab("DRG code")+
    theme(axis.text.x = element_text(angle = 90))
}

