\name{gp.setwd}
\alias{gp.setwd}
\title{Set gnuplot working directory}
\description{\code{gp.setwd} sets gnuplot working directory, default path = R's working directory}
\usage{gp.setwd(handle, wd)}
\arguments{	\item{handle}{ handle to the connection}
	\item{wd}{ gnuplot working directory, default = R's working directory}}
\value{	none}
\seealso{	\code{\link{gp.getwd}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#check it out
gp.getwd(h1)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
