\name{Gpgetloadpath}
\alias{Gpgetloadpath}
\title{Get gnuplot's additional directories, for data and scripts}
\description{\code{Gpgetloadpath} gets a list of gnuplot's additional directories, for data and scripts}
\usage{Gpgetloadpath(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with a list of gnuplot's additional directories, for data and scripts}
\seealso{	\code{\link{Gpsetloadpath}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
Gpsetloadpath(h1)
#get gnuplot's additional search directories
Gpgetloadpath(h1)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
