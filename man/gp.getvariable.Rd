\name{gp.getvariable}
\alias{gp.getvariable}
\title{Get the value of a system or environment variable}
\description{\code{gp.getvariable} returns the value of a system or environment variable}
\usage{gp.getvariable(handle, variablename)}
\arguments{	\item{handle}{ handle to the connection}
	\item{variablename}{ system or environment variable name}}
\value{	none}
\seealso{	\code{\link{gp.setvariable}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
gp.getvariable(h1,'pi')
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
