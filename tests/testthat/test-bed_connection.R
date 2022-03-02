test_that("bed_connection works", {
  withr::with_connection(
    # setup
    list(con = bed_connection()),

    # tests
    expect_class(con, "serialConnection")
  )
})
