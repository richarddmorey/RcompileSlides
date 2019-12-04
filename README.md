## RcompileSlides

Creates an Rstudio addin to compile slide desks to HTML and PDF using [`pagedown::chrome_print`](https://rdrr.io/cran/pagedown/man/chrome_print.html). Requires Google Chrome to be installed.

Also contains a collection of additional css and javascript files that I've created to make presentations look different/better. These are included with an Rmarkdown template called "Morey presentation".

To install, run:
```{r}
devtools::install_github(repo = "richarddmorey/RcompileSlides", dependencies = TRUE)
```
You may need to install the `devtools` R package first.

To turn on note slides compilation, you'll need [`pdfjam`](https://github.com/DavidFirth/pdfjam) installed, and to set the appropriate `Rcompileslides` option before using the addin:

```{r}
RcompileSlides::pkg_options(notes_slides = TRUE)
```
