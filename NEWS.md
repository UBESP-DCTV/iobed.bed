# iobed.bed (development version)

-   Added `bed_connection()` (powered by `{serial}`) to create a serial connection to the IOBED bed.
-   Added support for `{withr}` for testing local environments, and `{purrr}` for functional programming (under *Suggests* packages, for the moment).

# iobed.bed 0.0.0.9000

-   Added support for `{tibble}`.
-   Setup GitHub Actions for CI/CD including test and lint checks, and `{pkgdown}` deploy.
-   Activated `{renv}` for the project.
-   Added Git/GitHub support.
-   Added TDD environment powered by `{testthat}`, `{checkmate}`, and `{CorradoLanera/autotestthat}`.
-   Added `README.Rmd` and `README.md` to provide an home page for the project.
-   Added a `NEWS.md` file to track changes to the package.
