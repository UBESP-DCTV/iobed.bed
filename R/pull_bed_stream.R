#' Pull the stream from the IOBED connection
#'
#' @param con
#'
#' @return
#' @export
#'
#' @examples
pull_bed_stream <- function(con, close = TRUE) {
  if (!isOpen(con)) {
    usethis::ui_stop("
  {usethis::ui_field('con')} must be an open connection.
    You can create it by {usethis::ui_code('con <- bed_connection()')}
    Next, open it by {usethis::ui_code('open(con)')}
    ")
  }

  withr::defer(
    if (close) close(con)
  )

  serial::read.serialConnection(con) |>
    rawToChar(multiple = TRUE)
}
