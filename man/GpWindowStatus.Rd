\name{GpWindowStatus}
\alias{GpWindowStatus}
\title{Status of an X11 window}
\description{\code{GpWindowStatus} returns the status of an X11 window}
\usage{GpWindowStatus(windowid)}
\arguments{	\item{windowid}{ window id (X11)}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Joel VanderWerf and Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
GpWindowStatus(0)
#plot sin(x)
GpplotEquation(h1,'sin(x)','')
GpWindowStatus(0)
#pause R and gnuplot
Gppause()
GpWindowStatus(0)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
