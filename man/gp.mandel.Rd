\name{gp.mandel}
\alias{gp.mandel}
\title{Recursive implementation of the Mandelbrot set function}
\description{\code{gp.mandel} returns the values calculated from a recursive implementation of the Mandelbrot set function}
\usage{gp.mandel(x,y,z,n,maxiterations)}
\arguments{	\item{x}{ x-coordinate}
	\item{y}{ y-coordinate}
	\item{z}{ z-coordinate}
	\item{n}{ iteration number}
	\item{maxiterations}{ maximum number of iterations}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Kawano and Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
\dontrun{
#create the fractal data from R calling a C function, with more points and more iterations
mandelxy2<-function(x,y) gp.mandel(x,y,c(0,0),0,1000)
gp.R2splot(mandelxy2,'mandel4.dat',c(-1.5,0.5),c(-1,1),c(500,500),c(300,300),TRUE)
gp.cmd(h1,'reset
splot "mandel4.dat" w  pm3d notitle')
#pause R and gnuplot
gp.pause()}
#close gnuplot handles
h1<-gp.close(h1)
}
\keyword{programming}
