#' Tidy version of IOBED stream
#'
#' Get a stream pulled by [pull_bed_stream] and tidy it in a tibble
#'
#' @param stream (chr) a stream from the IOBED connection
#'
#' @note If the first row is uncompleted it is ignored and a warning
#' is signaled (this should not happen!), on the other hand, if the
#' last row is not completed (almost always!) it is silently ignored.
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
  col_names <- c("sbl", "sbr", "sul", "sur", "peso", "time", "allarme")

  string <- stream |>
    stringr::str_c(collapse = "") |>
    stringr::str_replace_all("tipo uscita", " ") |>
    stringr::str_replace_all("(:\\d+)(\\n\\n)", "\\1 0\\2") |>
    stringr::str_replace_all("(\\n\\n)[^\\n]+$", "\\1")

  is_bad_first <- string |>
    stringr::str_detect(
      "^(\\d+ +){5}\\d+:\\d+:\\d+ +\\d\\n\\n",
      negate = TRUE
  )

  if (is_bad_first) {
    usethis::ui_warn("
    First row of {usethis::ui_field('stream')} is not complete.
    It is removed now from the table.
    ")
    string <- string |>
      stringr::str_remove("^[^\\n]+\\n\\n")
  }

  raw_tbl <- string |>
    readr::read_table(col_names = col_names, col_types = "iiiiici")

  # if and only if there are missing entries, the second to the last
  # value is missing
  good_rows <- !is.na(raw_tbl["allarme"])

  raw_tbl |>
    dplyr::filter(good_rows) |>
    dplyr::mutate(time = lubridate::hms(.data[["time"]]))
}
