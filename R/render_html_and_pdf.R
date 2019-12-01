

#' Render an Rmarkdown presentation to HTML and PDF
#'
#' @return Returns a list with the output file paths
#' @export
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom tools file_path_sans_ext
#' @importFrom rmarkdown render
#' @importFrom pagedown chrome_print
#'
render_html_and_pdf <-
function(){
  ctx <- rstudioapi::getActiveDocumentContext()
  rmd_filename <- ctx$path
  fn_extn <- tools::file_ext(rmd_filename)
  fn_base <- tools::file_path_sans_ext(rmd_filename)
  
  stopifnot(fn_extn %in% c("Rmd", "rmd"))
  out_html <- rmarkdown::render( rmd_filename )
  
  out_extn <- tools::file_ext(out_html)
  stopifnot(out_extn == "html")
  
  out_pdf <- pagedown::chrome_print(out_html,
                         wait = 2,
                         options = list(
                           landscape = TRUE,
                           paperHeight = 11,
                           paperWidth = 8.25,
                           marginTop = 0,
                           marginBottom = 0,
                           marginLeft = 0,
                           marginRight = 0,
                           printBackground = TRUE)
  )
  invisible( c(html = out_html, pdf = out_pdf) )
}
