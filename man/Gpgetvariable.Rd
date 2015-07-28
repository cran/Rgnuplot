\name{Gpgetvariable}
\alias{Gpgetvariable}
\title{Get the value of a system or environment variable}
\description{\code{Gpgetvariable} returns the value of a system or environment variable}
\usage{Gpgetvariable(handle, variablename)}
\arguments{	\item{handle}{ handle to the connection}
	\item{variablename}{ system or environment variable name}}
\value{	none}
\seealso{	\code{\link{Gpsetvariable}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
Gpgetvariable(h1,'pi')
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
