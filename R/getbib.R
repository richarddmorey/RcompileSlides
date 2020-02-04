
#' Title
#'
#' @param file_path Where to save the bib file
#' @param refresh_days How old the existing file can be before it is refreshed
#' @param copy_to_current Copy the file to the current directory for backup?
#' @param URL URL of the bib file 
#' @param convert_from NULL to not use iconv; otherwise string giving encoding
#' @param convert_to string giving encoding; only used if `convert_from` is non-null
#'
#' @return Returns a path to the bib file
#' @export
#'
#' @importFrom RCurl getURL
#' @examples
getbib <- function( file_path = "ref.bib", 
                    refresh_days = 0,
                    copy_to_current = FALSE, 
                    URL = "http://drsmorey.org/bibtex/bibfile.php",
                    convert_from = NULL,
                    convert_to = NULL )
{
  if( is.null( file_path ) ){
    file_path <- tempfile( fileext = ".bib" )
  }else if( file.exists( file_path ) ){
    file_age = difftime( Sys.time(), 
                         file.mtime( file_path ), 
                         units = "days" )
    if( file_age < refresh_days ) return( file_path )
  }
  
  bib_content = try( {
    RCurl::getURL( URL )
  }, silent = TRUE )
  
  if(inherits( bib_content, "try-error" ) & file.exists( file_path ) ){
      message( "Error retrieving bib file from ", URL, "; returning old file." )
  }else{
      stop( "Error retrieving bib file from ", URL, "; no old file to use." )
  }
  
  if( !is_null(convert_from) )
    bib_content = iconv( bib_content,
                         from = convert_from,
                         to = convert_to )
    
  cat( bib_content, file = file_path )
  
  if( copy_to_current )
    file.copy( file_path, getwd() )
  
  return( file_path )
}
  