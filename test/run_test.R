# assume tidyverse is installed
options(tidyverse.quiet = TRUE)

library(tidyverse)
library(testthat, warn.conflicts = FALSE)

test_that("Checking whether output is correct", {
  out <- processx::run("./render_rmd", c(
    "--input", "README.Rmd",
    "--output", "output.md",
    "--format", "github"
  ))

  expect_equal(out$status, 0)
  expect_true(file.exists("output.md"))

  lines <- read_lines("output.md")
  expect_true(any(grepl("Hello", lines)))
})

