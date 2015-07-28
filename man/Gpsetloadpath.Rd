\name{Gpsetloadpath}
\alias{Gpsetloadpath}
\title{Set gnuplot's additional directories, for data and scripts}
\description{\code{Gpsetloadpath} sets gnuplot's additional directories, for data and scripts, default path = extdata directory from Rgnuplot}
\usage{Gpsetloadpath(handle, loadpath)}
\arguments{	\item{handle}{ handle to the connection}
	\item{loadpath}{ string with gnuplot's additional directories, for data and scripts}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
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
