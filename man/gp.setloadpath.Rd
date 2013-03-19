\name{gp.setloadpath}
\alias{gp.setloadpath}
\title{Set gnuplot's additional directories, for data and scripts}
\description{\code{gp.setloadpath} sets gnuplot's additional directories, for data and scripts, default path = extdata directory from Rgnuplot}
\usage{gp.setloadpath(handle, loadpath)}
\arguments{	\item{handle}{ handle to the connection}
	\item{loadpath}{ string with gnuplot's additional directories, for data and scripts}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
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
