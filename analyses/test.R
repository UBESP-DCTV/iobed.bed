library(iobed.bed)

# At the beginning of the simulation
con <- bed_connection()


# At the end of the simulation
stream <- pull_bed_stream(con)
stream_table <- tidy_iobed_stream(stream)


# Store the resulting table
today_now <- Sys.time()
patient_id <- "1234"
filename <- paste0(today_now, "-", patient_id, "-malvestio.rds")

readr::write_rds(stream_table, filename)
