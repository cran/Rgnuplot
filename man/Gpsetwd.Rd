\name{Gpsetwd}
\alias{Gpsetwd}
\title{Set gnuplot working directory}
\description{\code{Gpsetwd} sets gnuplot working directory, default path = R's working directory}
\usage{Gpsetwd(handle, wd)}
\arguments{	\item{handle}{ handle to the connection}
	\item{wd}{ gnuplot working directory, default = R's working directory}}
\value{	none}
\seealso{	\code{\link{Gpgetwd}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#change gnuplot's working directory to be the same as R's working directory (default)
Gpsetwd(h1)
#check it out
Gpgetwd(h1)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
