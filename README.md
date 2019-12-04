## RcompileSlides

Creates an Rstudio addin to compile slide desks to HTML and PDF using [`pagedown::chrome_print`](https://rdrr.io/cran/pagedown/man/chrome_print.html). Requires Google Chrome to be installed.

Also contains a collection of additional css files that I've created to make presentations look different/better. These are included with an Rmarkdown template called "Morey presentation".

To install, run:
```
devtools::install_github(repo = "richarddmorey/RcompileSlides", dependencies = TRUE)
```
You may need to install the `devtools` R package first.

