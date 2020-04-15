
if( require(showtext) )
{

  ## set chunk options to use showtext
  knitr::opts_chunk$set(fig.showtext=TRUE, dpi=300)

  #sysfonts::font_paths( "/System/Library/Fonts" )
  sysfonts::font_paths( list.dirs("assets/css", recursive = TRUE) )
  
  font_add("roboto_condensed",
           regular = "RobotoCondensed-Regular.ttf", 
           bold = "RobotoCondensed-Bold.ttf",
           italic = "RobotoCondensed-Italic.ttf",
           bolditalic = "RobotoCondensed-BoldItalic.ttf"
  )
  font_add("roboto",
           regular = "Roboto-Regular.ttf", 
           bold = "Roboto-Bold.ttf",
           italic = "Roboto-Italic.ttf",
           bolditalic = "Roboto-BoldItalic.ttf"
  )
  
  ## Add hooks so that I can choose fonts in the chunk options         
  knitr::knit_hooks$set(
    roboto = function(before, options, envir)
      if (before) par(family = "roboto"),
    roboto_condensed = function(before, options, envir)
      if (before) par(family = "roboto_condensed")
  )
  
  knitr::opts_chunk$set(roboto_condensed = TRUE)
  
}

