\name{gp.CheckHandle}
\alias{gp.CheckHandle}
\title{Check if the gnuplot session handle is valid}
\description{\code{gp.CheckHandle} checks a gnuplot session handle and returns an error message if it is invalid}
\usage{gp.CheckHandle(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
#returns TRUE for valid handle
\dontrun{gp.CheckHandle(h1)}
#close gnuplot handle
h1<-gp.close(h1)
#this generates an error
#gp.CheckHandle(h1)
}
\keyword{programming}
