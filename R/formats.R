#' @importFrom rmarkdown output_format knitr_options pandoc_options html_document includes
#' @export
ZZ_html_format = function(...) {
  # if you don't use roxygen2 (see above), you need to either
  # library(rmarkdown) or use rmarkdown::
  pkg_resource<-function(...) {
	system.file(..., package="ZZFirstTemplate")
	}
  header<-pkg_resource("rmarkdown/resource/header.html")
  template<-pkg_resource("rmarkdown/templates/zz-template/skeleton/template.html")
#  html_document(..., 
#				template=template,
#				#pandoc_args = c("--include-in-header", header) # this cause extra "--include-in-header"
#				includes = includes(in_header=header) # this cause extra "--include-in-header", too, caused by misspelling filename. Fixed
#				)
  output_format(
    knitr = knitr_options(opts_chunk = list(dev = 'png')),
    pandoc = pandoc_options(to = "html", args=c("--include-in-header", header, "--template", template)),
    clean_supporting = FALSE
  )
}
