\name{GpURL2string}
\alias{GpURL2string}
\title{Read a text file from the web to a string}
\description{\code{GpURL2string} reads the contents of a text file from the 
web to a string}
\usage{GpURL2string(mURL)}
\arguments{	\item{mURL}{ URL with the file to be read}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#example of using GploadDemo and GpreadURL2string
#Initialize the gnuplot handle
h1<-Gpinit()
#change gnuplot's working directory to be the same as 
#R's working directory (default)
Gpsetwd(h1)
#load the file 'simple.dem'
#Gpcmd(h1, 'set terminal postscript eps color;set output "simple.eps"\n' 
# %s% GpURL2string('http://gnuplot.sourceforge.net/demo_svg/simple.1.gnu') %s% 
# '\nset terminal X11;set output')
\dontrun{
if (!file.exists('/usr/share/doc/gnuplot-doc/examples/simple.dem')) 
stop('Please install gnuplot-doc')
GploadDemo(h1, '/usr/share/doc/gnuplot-doc/examples/simple.dem')
#pause R and gnuplot
Gppause()
# example of GpreadURL2string
#Kuen's Surface
gpcode<-GpURL2string('http://gnuplot.sourceforge.net/demo/transparent_solids.2.gnu')
#send gnuplot script
#Gpcmd(h1, 'set terminal postscript eps color
#set output "KuensSurface.eps"\n' %s% gpcode)
Gpcmd(h1, gpcode)
#pause R and gnuplot
Gppause()}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
