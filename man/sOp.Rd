\name{sOp}
\alias{\%s\%}
\title{String concatenation operator}
\description{\code{\%s\%} concatenates 2 strings}
\usage{x \%s\% y}
\arguments{	\item{x}{ string}
	\item{y}{ another string}}
\value{	none}
\author{Jose' Gama}
\examples{
# create two strings
\dontrun{
t1 <- 'Hello'
t2 <- 'World'
# concatenate several strings with \%s\%
t3 <- t1 \%s\% ' ' \%s\% t2
print(t3)
print(t3 \%s\% '!')
}
}
\keyword{programming}
