
if( require(showtext) )
{

  ## set chunk options to use showtext
  knitr::opts_chunk$set(fig.showtext=TRUE, dpi=300)
  
  ## Needed for the location of Candara on my system
  font_paths("/System/Library/Fonts")
  
  ## Add two fonts, Avenir and Candara
  font_add("bigmisterc",
           regular = "bigmisterc.ttf")
  font_add("avenir", 
           regular = "Avenir.ttc",
           bold = "Avenir.ttc")
  font_add("candara",
           regular = "Candara.ttf", 
           bold = "Candara Bold.ttf",
           italic = "Candara Italic.ttf",
           bolditalic = "Candara Bold Italic.ttf"
  )
  font_add("frutiger",
           regular = "Frutiger.ttf", 
           bold = "Frutiger_bold.ttf",
           italic = "Frutiger_Italic.ttf",
           bolditalic = "Frutiger_Bold_Italic.ttf"
  )
  font_add("frutiger_light",
           regular = "Frutiger_Light.ttf", 
           bold = "Frutiger.ttf",
           italic = "Frutiger_Light_Italic.ttf",
           bolditalic = "Frutiger_Italic.ttf"
  )
  font_add("corbel",
           regular = "Corbel.ttf", 
           bold = "Corbel Bold.ttf",
           italic = "Corbel Italic.ttf",
           bolditalic = "Corbel Bold Italic.ttf"
  )
  font_add("roboto_condensed",
           regular = "RobotoCondensed-Regular.ttf", 
           bold = "RobotoCondensed-Bold.ttf",
           italic = "RobotoCondensed-Italic.ttf",
           bolditalic = "RobotoCondensed-BoldItalic.ttf"
  )
  ## Add hooks so that I can choose fonts in the chunk options         
  knitr::knit_hooks$set(
    avenir = function(before, options, envir)
      if (before) par(family = "avenir"),
    candara = function(before, options, envir)
      if (before) par(family = "candara"),
    corbel = function(before, options, envir)
      if (before) par(family = "corbel"),
    bigmisterc = function(before, options, envir)
      if (before) par(family = "bigmisterc"),
    frutiger = function(before, options, envir)
      if (before) par(family = "frutiger"),
    frutiger_light = function(before, options, envir)
      if (before) par(family = "frutiger_light"),
    roboto_condensed = function(before, options, envir)
      if (before) par(family = "roboto_condensed")
  )
  
  knitr::opts_chunk$set(roboto_condensed = TRUE)
  
}

