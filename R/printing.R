# Package-level print buffer
.print_buffer <- new.env(parent = emptyenv())

#' @exportS3Method
print.freq_y2 <- function(x, n, ...) {
  NextMethod()
}


#' Print with n = Inf
#'
#' @description
#' This function prints the most recently displayed frequency tibble with print(n = Inf)
#' @export
print_freq_inf <- function() {
  print(.print_buffer$last_freq, n = Inf)
}
