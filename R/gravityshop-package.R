#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

#' gravityshop: A package with templates and data useful to teach a workshop on spatial interaction modelling using `R`
#'
#' @docType package
#' @name gravityshop-package
#' @author Antonio Paez, School of Earth, Environment and Society, McMaster University \email{paezha@@mcmaster.ca}
#' @references \url{https://github.com/paezha/gravityshop}
NULL

##############################################
##                DATA SETS                 ##
##############################################


##############################################
##                TEMPLATES                 ##
##############################################

#' Spatial Interaction Modelling Workshop Session 1 Template (Italian Edition).
#'
#' Template for creating a computational notebook for Session 1 of the Italian
#' edition of the workshop.
#'
#' @format An R Markdown file
#'
#' @keywords datasets
#' @name gs_session_1
#' @export
gs_session_1 <- function(){
  writeLines("This template is available for use when creating a new R Markdown document;\n please select gs_session_1 from the menu")
}
