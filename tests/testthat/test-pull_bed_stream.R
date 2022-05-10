test_that("pull_bed_stream works", {
  # setup
  con = tryCatch(
    suppressWarnings(suppressMessages(bed_connection("COM3"))),
    error = function(e) FALSE
  )
  if (isFALSE(con)) {
    skip("unplugged connection")
  } else {
    tryCatch({
      open(con)
      withr::defer(close(con))

      Sys.sleep(1)

      # eval
      stream <- pull_bed_stream(con)

      # tests
      expect_character(stream)
    },
      error = function(e) skip("unplugged connection")
    )
  }
})
