\name{gp.load.demo}
\alias{gp.load.demo}
\title{Load .dem gnuplot files}
\description{\code{gp.load.demo} loads a .dem gnuplot file and executes it,
allowing pause statements}
\usage{gp.load.demo(handle, mfile)}
\arguments{	\item{handle}{ handle to the connection}
	\item{mfile}{ .dem gnuplot file name}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#example of using gp.load.demo and gp.readURL2string
#Initialize the gnuplot handle
h1<-gp.init()
#change gnuplot's working directory to be the same as 
# R's working directory (default)
gp.setwd(h1)
#load the file 'simple.dem'
#gp.cmd(h1, 'set terminal postscript eps color;set output "simple.eps"\n' 
# %s% gp.URL2string('http://gnuplot.sourceforge.net/demo_svg/simple.1.gnu') %s%
#'\nset terminal X11;set output')
\dontrun{
if (!file.exists('/usr/share/doc/gnuplot-doc/examples/simple.dem')) 
stop('Please install gnuplot-doc')
gp.load.demo(h1, '/usr/share/doc/gnuplot-doc/examples/simple.dem')
#pause R and gnuplot
gp.pause()
# example of gp.readURL2string
#Kuen's Surface
gpcode<-gp.URL2string('http://gnuplot.sourceforge.net/demo/transparent_solids.2.gnu')
#send gnuplot script
gp.cmd(h1, gpcode)
#gp.cmd(h1, 'set terminal postscript eps color
#set output "KuensSurface.eps"\n' %s% gpcode)
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
