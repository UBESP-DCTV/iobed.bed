#' Tidy version of IOBED stream
#'
#' Get a stream pulled by [pull_bed_stream] and tidy it in a tibble
#'
#' @param stream (chr) a stream from the IOBED connection
#'
#' @return a [tibble][tibble::tibble-package]
#' @export
#'
#' @examples
#' sample_stream <- c(
#'   "2", "9", "6", " ", " ", " ", " ", "1", "9", "5", " ", " ",
#'   " ", "2", "2", "9", " ", " ", " ", " ", "2", "7", "7", " ", " ",
#'   " ", " ", "3", "8", " ", " ", " ", " ", " ", "1", "6", ":", "4",
#'   "2", ":", "3", "8", "\n", "\n", "", "2", "9", "6", " ", " ",
#'   " ", " ", "1", "9", "5", " ", " ", " ", "2", "2", "9", " ", " ",
#'   " ", " ", "2", "7", "7", " ", " ", " ", " ", "3", "8", " ", " ",
#'   " ", " ", " ", "1", "6", ":", "4", "2", ":", "3", "9", "\n",
#'   "\n", "", "2", "9", "6", " ", " ", " ", " ", "1", "9", "5"
#' )
#'
#' tidy_iobed_stream(sample_stream)
#'
tidy_iobed_stream <- function(stream) {

}
