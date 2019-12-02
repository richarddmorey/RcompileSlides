# Variable, global to package's namespace. 
# This function is not exported to user space and does not need to be documented.
MYPKGOPTIONS <- settings::options_manager(
  wait = 2,
  marginTop = 0,
  marginBottom = 0,
  marginLeft = 0,
  marginRight = 0,
  printBackground = TRUE,
  paperHeight = 11,
  aspect = 4/3,
  widescreen_aspect = 11/7,
  notes_slides = FALSE,
  pdfjam_offset = "-7cm 0cm",
  pdfjam_delta = "0cm .5cm",
  pdfjam_scale = "0.8",
  pdfjam_nup = "1x2",
  pdfjam_frame = "true",
  pdfjam_noautoscale = "false",
  pdfjam_suffix = "notes"
)

# User function that gets exported:

#' Set or get options for my package
#' 
#' @param ... Option names to retrieve option values or \code{[key]=[value]} pairs to set options.
#'
#' @section Supported options:
#' The following options are supported:
#' \itemize{
#'  \item{\code{wait}}{(\code{numeric};2) Amount of time in seconds to wait for HTML to render before printing PDF }
#'  \item{\code{printBackground}}{(\code{logical};TRUE) Print the HTML background images/color to PDF?}
#'  \item{\code{marginTop}}{(\code{numeric};0) Top margin to add to PDF slides}
#'  \item{\code{marginBottom}}{(\code{numeric};0) Bottom margin to add to PDF slides}
#'  \item{\code{marginLeft}}{(\code{numeric};0) Left margin to add to PDF slides}
#'  \item{\code{marginRight}}{(\code{numeric};0) Right margin to add to PDF slides}
#'  \item{\code{paperHeight}}{(\code{numeric};11) Width of the slides in inches (height because landscape)}
#'  \item{\code{aspect}}{(\code{numeric};4/3) Aspect ratio of non-widescreen slides}
#'  \item{\code{widescreen_aspect}}{(\code{numeric};11/7) Aspect ratio of widescreen slides}
#'  \item{\code{notes_slides}}{(\code{logical};FALSE) Compile notes slides when using the add-in? }
#'  \item{\code{pdfjam_offset}}{(\code{character};"-7cm 0cm") Amount to shift to the right and down}
#'  \item{\code{pdfjam_delta}}{(\code{character};"0cm .5cm") Amount of horizontal and vertical padding}
#'  \item{\code{pdfjam_scale}}{(\code{character};"0.8") Size by which to scale the slides }
#'  \item{\code{pdfjam_nup}}{(\code{character};"1x2") Layout (columns by rows, because landscape)}
#'  \item{\code{pdfjam_frame}}{(\code{character};"true") Add a frame around the slides?}
#'  \item{\code{pdfjam_noautoscale}}{(\code{character};"false") activate/deactivate autoscaling}
#'  \item{\code{pdfjam_suffix}}{(\code{character};"notes") Suffix to add to notes pdf file name }
#' }
#'
#' For the pdfjam options, see \url{https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam121/}
#' and \url{http://texdoc.net/texmf-dist/doc/latex/pdfpages/pdfpages.pdf}.
#'
#' @export
#' @importFrom settings stop_if_reserved options_manager
pkg_options <- function(...){
  # protect against the use of reserved words.
  settings::stop_if_reserved(...)
  MYPKGOPTIONS(...)
}