\name{gp.plotPolyFit}
\alias{gp.plotPolyFit}
\title{Plots a polynomial fit in one function call}
\description{\code{gp.plotPolyFit} Plots a polynomial fit without the need to define handles}
\usage{gp.plotPolyFit(x, y, order)}
\arguments{	\item{x}{ array with the values of x}
\item{y}{ array with the values of y = f(x)}
\item{order}{ order of the polynomial}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Oscar Perpi\~{n}\'{a}n Lamigueiro}
\examples{
polnorder <- 7# order of the polynomial
npoints <- 20 # number of points to plot
xpoints <- ( 0:npoints ) * 0.1 # x values
wpoints <- c(1,10^ -( 0:polnorder )) # "a" to "h" values
xPower <- outer(xpoints, 0:7, '^')
ypoints <- colSums(wpoints[1:8] * t(xPower))
\dontrun{gp.plotPolyFit(xpoints, ypoints, 7)}
}
\keyword{programming}
