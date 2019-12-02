## Create code for transparent background in ggplot
## https://stackoverflow.com/a/53858403/1129889

library(ggplot2)

MyTheme_transparent <- theme(
    panel.background = element_rect(fill = "transparent", color = NA), # bg of the panel
    plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
    panel.grid.major = element_blank(), # get rid of major grid
    panel.grid.minor = element_blank(), # get rid of minor grid
    legend.background = element_rect(fill = "transparent", color = NA), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent", color = NA), # get rid of legend panel bg
    legend.key = element_rect(fill = "transparent", color = NA), # get rid of key legend fill, and of the surrounding
    #axis.line = element_line(color = "black") # adding a black line for x and y axis
)
