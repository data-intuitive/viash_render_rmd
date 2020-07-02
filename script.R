### VIASH START
par <- list(
  input = "test/README.Rmd",
  output = "test/README.md",
  format = "github"
)
resources_dir <- "."
### VIASH END

if (is.null(par$format)) {
  par$format <- tools::file_ext(par$output)
}
output_format <- switch(
  tolower(par$format),
  md = rmarkdown::md_document(),
  github = rmarkdown::github_document(html_preview = FALSE),
  html = rmarkdown::html_document(),
  pdf = rmarkdown::pdf_document(),
  odt = rmarkdown::odt_document(),
  rtf = rmarkdown::rtf_document(),
  word = rmarkdown::word_document(),
  latex = rmarkdown::latex_document(),
  context = rmarkdown::context_document(),
  stop("Unknown file format, specify with --format")
)

rmarkdown::render(
  par$input,
  output_format = output_format,
  output_file = basename(par$output),
  output_dir = dirname(par$output)
)
