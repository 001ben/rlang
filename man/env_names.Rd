% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/env-binding.R
\name{env_names}
\alias{env_names}
\alias{env_length}
\title{Names and numbers of symbols bound in an environment}
\usage{
env_names(env)

env_length(env)
}
\arguments{
\item{env}{An environment.}
}
\value{
A character vector of object names.
}
\description{
\code{env_names()} returns object names from an enviroment \code{env} as a
character vector. All names are returned, even those starting with
a dot. \code{env_length()} returns the number of bindings.
}
\section{Names of symbols and objects}{


Technically, objects are bound to symbols rather than strings,
since the R interpreter evaluates symbols (see \code{\link[=is_expression]{is_expression()}} for a
discussion of symbolic objects versus literal objects). However it
is often more convenient to work with strings. In rlang
terminology, the string corresponding to a symbol is called the
\emph{name} of the symbol (or by extension the name of an object bound
to a symbol).
}

\section{Encoding}{


There are deep encoding issues when you convert a string to symbol
and vice versa. Symbols are \emph{always} in the native encoding (see
\code{\link[=set_chr_encoding]{set_chr_encoding()}}). If that encoding (let's say latin1) cannot
support some characters, these characters are serialised to
ASCII. That's why you sometimes see strings looking like
\code{<U+1234>}, especially if you're running Windows (as R doesn't
support UTF-8 as native encoding on that platform).

To alleviate some of the encoding pain, \code{env_names()} always
returns a UTF-8 character vector (which is fine even on Windows)
with unicode points unserialised.
}

\examples{
env <- env(a = 1, b = 2)
env_names(env)
}
