\name{Gpversion}
\alias{Gpversion}
\title{Get the gnuplot version}
\description{\code{Gpversion} returns the gnuplot version}
\usage{Gpversion(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	gnuplot version}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
# get the version number
\dontrun{Gpversion(h1)}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
