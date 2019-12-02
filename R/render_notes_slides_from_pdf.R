
render_notes_slides_from_pdf <- function( fn_pdf ){
  
  if(!file.exists(fn_pdf))
    stop("PDF file not found: ", fn_pdf)
  
  vers <- try({system("pdfjam --version", intern = TRUE)})
  if(inherits(vers, "try-error"))
    stop("pdfjam not found in system path.")
  
  out_pdf = paste0(
    tools::file_path_sans_ext(fn_pdf),
    "_", pkg_options()$pdfjam_suffix,
    ".pdf"
  )
  
  cmd <- paste0(
  'pdfjam ', fn_pdf,
  ' --landscape ',
  ' --nup '         , pkg_options()$pdfjam_nup,
  ' --frame '       , pkg_options()$pdfjam_frame,
  ' --noautoscale ' , pkg_options()$pdfjam_noautoscale,
  ' --delta "'      , pkg_options()$pdfjam_delta,  '"',
  ' --offset "'     , pkg_options()$pdfjam_offset, '"',
  ' --scale '       , pkg_options()$pdfjam_scale,
  ' --suffix '      , pkg_options()$pdfjam_suffix,
  ' --outfile '     , out_pdf )
  
  system( cmd )

}