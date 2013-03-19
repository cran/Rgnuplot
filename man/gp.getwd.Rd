\name{gp.getwd}
\alias{gp.getwd}
\title{Get gnuplot's working directory}
\description{\code{gp.getwd} returns gnuplot's working directory}
\usage{gp.getwd(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with gnuplot's working directory}
\seealso{	\code{\link{gp.setwd}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
gp.getwd(h1)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
