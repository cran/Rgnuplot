\name{gp.getloadpath}
\alias{gp.getloadpath}
\title{Get gnuplot's additional directories, for data and scripts}
\description{\code{gp.getloadpath} gets a list of gnuplot's additional directories, for data and scripts}
\usage{gp.getloadpath(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with a list of gnuplot's additional directories, for data and scripts}
\seealso{	\code{\link{gp.setloadpath}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#get gnuplot's additional search directories
gp.getloadpath(h1)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
