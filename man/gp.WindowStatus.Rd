\name{gp.WindowStatus}
\alias{gp.WindowStatus}
\title{Status of an X11 window}
\description{\code{gp.WindowStatus} returns the status of an X11 window}
\usage{gp.WindowStatus(windowid)}
\arguments{	\item{windowid}{ window id (X11)}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Joel VanderWerf and Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
gp.WindowStatus(0)
#plot sin(x)
gp.plot.equation(h1,'sin(x)','')
gp.WindowStatus(0)
#pause R and gnuplot
gp.pause()
gp.WindowStatus(0)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
