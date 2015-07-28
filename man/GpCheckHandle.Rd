\name{GpcheckHandle}
\alias{GpcheckHandle}
\title{Check if the gnuplot session handle is valid}
\description{\code{GpcheckHandle} checks a gnuplot session handle and returns an error message if it is invalid}
\usage{GpcheckHandle(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
#returns TRUE for valid handle
\dontrun{GpcheckHandle(h1)}
#close gnuplot handle
h1<-Gpclose(h1)
#this generates an error
#GpcheckHandle(h1)
}
\keyword{programming}
