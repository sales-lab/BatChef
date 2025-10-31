#' @importFrom basilisk BasiliskEnvironment
py_env <- BasiliskEnvironment(
  envname = "py_env",
  pkgname = "BatChef",
  packages = c("python=3.12.2",
               "scanpy=1.11.4",
               "scipy=1.16.2",
               "anndata=0.12.2",
               "scanorama=1.7.4",
               "leidenalg=0.10.2",
               "python-igraph=0.11.9",
               "bbknn=1.6.0",
               "scvi-tools=1.4.0")
)

print_basilisk_cache_paths <- function() {
  proc <- basiliskStart(py_env)
  on.exit(basiliskStop(proc))

  invisible(basiliskRun(proc, fun=function() {
    cfg <- reticulate::py_config()
    cat(sprintf("PYENV_CACHE_DIR=%s\n", cfg$base_exec_prefix))
    cat(sprintf("VIRTUALENV_CACHE_DIR=%s\n", cfg$virtualenv))
  }))
}
