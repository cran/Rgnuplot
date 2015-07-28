\name{Gperrmsg}
\alias{Gperrmsg}
\title{Get gnuplot's error messages}
\description{\code{Gperrmsg} gets gnuplot's error messages}
\usage{Gperrmsg(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	string containing gnuplot's error messages}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{Gpcmd(h1,'plot 0/0')
Gperrmsg(h1)}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
