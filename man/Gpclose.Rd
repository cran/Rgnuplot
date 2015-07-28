\name{Gpclose}
\alias{Gpclose}
\title{Close a gnuplot session}
\description{\code{Gpclose} closes a gnuplot session and resets the handle to prevent inadvertently trying to reuse and thus avoid a crash}
\usage{Gpclose(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#set output to a postscript file
#Gpcmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
GpsetXlabel(h1, 'x')
GpsetYlabel(h1, 'y')
#set plot style to "lines"
Gpsetstyle(h1, 'lines')
#plot and add a legend
GpplotEquation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
Gppause()}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
