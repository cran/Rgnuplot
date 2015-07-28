\name{GpplotFunction}
\alias{GpplotFunction}
\title{Plots an expression in one function call}
\description{\code{GpplotFunction} plots an expression without the need to define handles}
\usage{GpplotFunction(x, xlab='x', ylab='y', main='', type='l',...)}
\arguments{	\item{x}{ expression}
\item{xlab}{ label for the x-axis}
\item{ylab}{ label for the y-axis}
\item{main}{ main title for the graphic}
\item{type}{ type of plot: lines or points}
\item{...}{ extra parameters passed to the function}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Oscar Perpi\~{n}\'{a}n Lamigueiro}
\examples{
\dontrun{GpplotFunction ('sin(x)', 'x', 'y', 'sine function')}
}
\keyword{programming}
