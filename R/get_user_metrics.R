#' Get a list of a user's metrics
#'
#' @param user_id The ID of the user to get metrics info for.
#'
#' @return A list containing information about the user's metrics
#' @importFrom assertthat assert_that is.scalar is.string
#' @importFrom httr content
#' @export
#'
#' @examples
#' library(numerous)
#' u <- get_user_metrics(user_id = "321654987654321")
#' 
get_user_metrics <- function(user_id)
{
    assert_that(is.scalar(user_id))
    assert_that(is.string(user_id))
    
    response <- numerous_GET(path=paste("users", user_id, "metrics", sep='/'))
    
    # TODO: handle pagination?
    rval <- content(response)
    rval$metrics
}