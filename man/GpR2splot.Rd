\name{GpR2splot}
\alias{GpR2splot}
\title{Save 3D R to gnuplot}
\description{\code{GpR2splot} saves the output from a 3D R function to a file readable by gnuplot}
\usage{GpR2splot(Rfunction,filename,gnuxrange,gnuyrange,gnusamples,gnuisosamples,hidden3d=FALSE)}
\arguments{	\item{Rfunction}{ 2D R function}
	\item{filename}{ file name (gnuplot)}
	\item{gnuxrange}{ gnuplot xrange}
	\item{gnuyrange}{ gnuplot yrange}
	\item{gnusamples}{ gnuplot samples}
	\item{gnuisosamples}{ gnuplot gnuisosamples}
	\item{hidden3d}{ gnuplot hidden3d}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\keyword{programming}
