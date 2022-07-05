# CRAN mirror ----
r <- getOption("repos")
r["CRAN"] <- "https://cloud.r-project.org"
r["INLA"] <- "https://inla.r-inla-download.org/R/stable"
options(repos = r)

# Install packages ----

# CRAN
install.packages(
  c("devtools", "tidyverse", "tinytex", "languageserver"),
  dependencies = TRUE
)
install.packages(
  c("TMB"),
  dependencies = TRUE
)

# GitHub
remotes::install_github(
  c("r4ss/r4ss", "nwfsc-assess/nwfscSurvey", "pbs-assess/sdmTMB"),
  dependencies = TRUE
)

# INLA
install.packages(
  "INLA",
  dependencies = TRUE
)
