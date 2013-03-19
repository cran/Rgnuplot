\name{gp.close}
\alias{gp.close}
\title{Close a gnuplot session}
\description{\code{gp.close} closes a gnuplot session and resets the handle to prevent inadvertently trying to reuse and thus avoid a crash}
\usage{gp.close(handle)}
\arguments{	\item{handle}{ handle to the connection}}
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
#plot and add a legend
gp.plot.equation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
