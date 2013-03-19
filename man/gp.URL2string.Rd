\name{gp.URL2string}
\alias{gp.URL2string}
\title{Read a text file from the web to a string}
\description{\code{gp.URL2string} reads the contents of a text file from the web to a string}
\usage{gp.URL2string(mURL)}
\arguments{	\item{mURL}{ URL with the file to be read}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#example of using gp.load.demo and gp.readURL2string
#Initialize the gnuplot handle
h1<-gp.init()
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#load the file 'simple.dem'
#gp.cmd(h1, 'set terminal postscript eps color;set output "simple.eps"\n' 
# %s% gp.URL2string('http://gnuplot.sourceforge.net/demo_svg/simple.1.gnu') %s% '\nset terminal X11;set output')
\dontrun{
if (!file.exists('/usr/share/doc/gnuplot-doc/examples/simple.dem')) stop('Please install gnuplot-doc')
gp.load.demo(h1, '/usr/share/doc/gnuplot-doc/examples/simple.dem')
#pause R and gnuplot
gp.pause()
# example of gp.readURL2string
#Kuen's Surface
gpcode<-gp.URL2string('http://gnuplot.sourceforge.net/demo/transparent_solids.2.gnu')
#send gnuplot script
#gp.cmd(h1, 'set terminal postscript eps color;set output "KuensSurface.eps"\n' %s% gpcode)
gp.cmd(h1, gpcode)
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
