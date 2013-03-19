\name{gp.errmsg}
\alias{gp.errmsg}
\title{Get gnuplot's error messages}
\description{\code{gp.errmsg} gets gnuplot's error messages}
\usage{gp.errmsg(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	string containing gnuplot's error messages}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{gp.cmd(h1,'plot 0/0')
gp.errmsg(h1)}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
