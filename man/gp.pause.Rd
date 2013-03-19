\name{gp.pause}
\alias{gp.pause}
\title{Pauses the system}
\description{\code{gp.pause} pauses the system for a number of seconds and then waits for the user to press a key, detecs X11 beforehand}
\usage{gp.pause(delaySecs=2)}
\arguments{	\item{delaySecs}{ number of seconds to wait}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#set output to a postscript file
#gp.cmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
gp.set.xlabel(h1, 'x')
gp.set.ylabel(h1, 'y')
#set plot style to "lines"
gp.setstyle(h1, 'lines')
#plot sin(x) and add a legend
gp.plot.equation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
