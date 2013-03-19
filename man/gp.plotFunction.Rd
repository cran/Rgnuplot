\name{gp.plotFunction}
\alias{gp.plotFunction}
\title{Plots an expression in one function call}
\description{\code{gp.plotFunction} plots an expression without the need to define handles}
\usage{gp.plotFunction(x, xlab='x', ylab='y', main='', type='l',...)}
\arguments{	\item{x}{ expression}
\item{xlab}{ label for the x-axis}
\item{ylab}{ label for the y-axis}
\item{main}{ main title for the graphic}
\item{type}{ type of plot: lines or points}
\item{...}{ extra parameters passed to the function}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Oscar Perpi\~{n}\'{a}n Lamigueiro}
\examples{
\dontrun{gp.plotFunction ('sin(x)', 'x', 'y', 'sine function')}
}
\keyword{programming}
