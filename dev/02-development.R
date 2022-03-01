autotestthat::auto_test_package_job()




use_r(basename(use_test("<function_name>")))



#'
#' Check cycles
#' ====================================================================
#'
#' Before pushes
#' --------------------------------------------------------------------
#'
usethis::use_tidy_description()
spelling::spell_check_package()
spelling::update_wordlist()



#'
#' Before pull requests
#' --------------------------------------------------------------------
#'
lintr::lint_package()

usethis::use_version()
