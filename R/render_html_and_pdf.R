

#' Render an Rmarkdown presentation to HTML and PDF
#'
#' @param notes_slides Create a PDF with space for notes?
#' @return Returns a list with the output file paths
#' @export
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom tools file_path_sans_ext
#' @importFrom rmarkdown render yaml_front_matter
#' @importFrom pagedown chrome_print
#'
render_html_and_pdf <-
function( notes_slides = pkg_options()$notes_slides){
  ctx <- rstudioapi::getActiveDocumentContext()
  rmd_filename <- ctx$path
  fn_extn <- tools::file_ext(rmd_filename)
  fn_base <- tools::file_path_sans_ext(rmd_filename)
  
  stopifnot(fn_extn %in% c("Rmd", "rmd"))
  out_html <- rmarkdown::render( rmd_filename )
  
  yaml <- rmarkdown::yaml_front_matter( rmd_filename )
  if( !("ioslides_presentation" %in% names(yaml$output)) )
    stop("Output must be ioslides_presentation.")

  paperHeight <- pkg_options()$paperHeight
  widescreen <- yaml$output$ioslides_presentation$widescreen
  
  if(is.null(widescreen)){
    paperWidth = paperHeight / pkg_options()$aspect
  }else{
    paperWidth = paperHeight / pkg_options()$widescreen_aspect
  }
  
  out_extn <- tools::file_ext(out_html)
  stopifnot(out_extn == "html")
  
  out_pdf <- pagedown::chrome_print(out_html,
                         wait = pkg_options()$wait,
                         options = list(
                           landscape = TRUE,
                           paperHeight = paperHeight,
                           paperWidth = paperWidth,
                           marginTop = pkg_options()$marginTop,
                           marginBottom = pkg_options()$marginBottom,
                           marginLeft = pkg_options()$marginLeft,
                           marginRight = pkg_options()$marginRight,
                           printBackground = pkg_options()$printBackground)
  )
  
  if(notes_slides)
    render_notes_slides_from_pdf( out_pdf )
  
  invisible( c(html = out_html, pdf = out_pdf) )
}
