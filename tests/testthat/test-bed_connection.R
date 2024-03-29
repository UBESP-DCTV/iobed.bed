test_that("bed_connection works", {
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

        # tests
        expect_class(con, "serialConnection")
      },
        error = function(e) skip("unplugged connection")
      )
    }
})
