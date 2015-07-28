\name{Gpgetwd}
\alias{Gpgetwd}
\title{Get gnuplot's working directory}
\description{\code{Gpgetwd} returns gnuplot's working directory}
\usage{Gpgetwd(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with gnuplot's working directory}
\seealso{	\code{\link{Gpsetwd}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#change gnuplot's working directory to be the same as R's working directory (default)
Gpsetwd(h1)
Gpgetwd(h1)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
