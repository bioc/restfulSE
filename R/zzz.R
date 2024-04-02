.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s. Please see rhdf5client as replacement.", pkgname, "3.20")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}
