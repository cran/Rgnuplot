\name{gp.cmd}
\alias{gp.cmd}
\title{Send one or more commands to gnuplot}
\description{gp.cmd sends one or more commands to an open gnuplot session}
\usage{gp.cmd(handle, cmd, ...)}
\arguments{	\item{handle}{ handle to the connection}
\item{cmd, ...}{ cmd is an optional format string as in the printf command, followed by one or more commands}}
\value{	none}
\seealso{	\code{\link{gp.init}
\link{gp.close}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-gp.init()
#set output to a postscript file
#gp.cmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
gp.set.xlabel(h1, 'x')
gp.set.ylabel(h1, 'y')
#set plot style to "lines"
gp.setstyle(h1, 'lines')
#plot and add a legend
\dontrun{gp.plot.equation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
