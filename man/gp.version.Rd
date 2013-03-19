\name{gp.version}
\alias{gp.version}
\title{Get the gnuplot version}
\description{\code{gp.version} returns the gnuplot version}
\usage{gp.version(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	gnuplot version}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
# get the version number
\dontrun{gp.version(h1)}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
