\name{Gpcmd}
\alias{Gpcmd}
\title{Send one or more commands to gnuplot}
\description{Gpcmd sends one or more commands to an open gnuplot session}
\usage{Gpcmd(handle, cmd, ...)}
\arguments{	\item{handle}{ handle to the connection}
\item{cmd, ...}{ cmd is an optional format string as in the printf command, followed by one or more commands}}
\value{	none}
\seealso{	\code{\link{Gpinit}
\link{Gpclose}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-Gpinit()
#set output to a postscript file
#Gpcmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
GpsetXlabel(h1, 'x')
GpsetYlabel(h1, 'y')
#set plot style to "lines"
Gpsetstyle(h1, 'lines')
#plot and add a legend
\dontrun{GpplotEquation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
Gppause()}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
