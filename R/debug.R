## vim:textwidth=128:expandtab:shiftwidth=4:softtabstop=4

#' Possibly print debugging information.
#'
#' This function is intended mainly for use within the package, but users may
#' also call it directly in their own code.  Within the package, the value
#' of `debug` is generally reduced by 1 on each nested function call, leading
#' to indented messages. Most functions start and end with a call to
#' [argoFloatsDebug()] that has `style="bold"` and `unindent=1`.
#'
#' @param debug an integer specifying the level of debugging. Values greater
#' than zero indicate that some printing should be done. Many functions
#' @param ... values to be printed, analogous to the `...` argument
#' list of [cat()].
#' @param style character value indicating special formatting, with `"plain"`
#' for normal text, `"bold"` for bold-faced text, `"italic"` for italicized
#' text, `"red"` for red text, `"green"` for green text, or `"blue"` for blue
#' text. These codes may not be combined.
#' @param showTime logical value indicating whether to preface message with
#' the present time. This can be useful for learning about which operations
#' are using the most time.
#' @param unindent integer specifying the degree of reverse indentation
#' to be done, as explained in the \dQuote{Details} section.
#'
#' @author Dan Kelley
#'
#' @importFrom utils flush.console
#'
#' @export
argoFloatsDebug <- function(debug=0, ..., style="plain", showTime=TRUE, unindent=0)
{
    debug <- if (debug > 2) 2 else max(0, floor(debug + 0.5))
    if (debug > 0) {
        n <- 3 - debug - unindent
        if (is.character(style) && style == "plain") {
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
        } else if (is.character(style) && style == "bold") {
            cat("\033[1m")
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
            cat("\033[0m")
        } else if (is.character(style) && style == "italic") {
            cat("\033[3m")
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
            cat("\033[0m")
        } else if (is.character(style) && style == "red") {
            cat("\033[31m")
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
            cat("\033[0m")
        } else if (is.character(style) && style == "green") {
            cat("\033[32m")
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
            cat("\033[0m")
        } else if (is.character(style) && style == "blue") {
            cat("\033[34m")
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
            cat("\033[0m")
        } else if (is.function(style)) {
            if (n > 0)
                cat(style(paste(rep("  ", n), collapse="")))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(style(...))
        } else { # fallback
            if (n > 0)
                cat(paste(rep("  ", n), collapse=""))
            if (showTime)
                cat(format(Sys.time(), "[%H:%M:%S] "))
            cat(...)
        }
        flush.console()
    }
    invisible()
}

