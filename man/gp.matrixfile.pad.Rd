\name{gp.matrixfile.pad}
\alias{gp.matrixfile.pad}
\alias{gp.saveXYfile}
\alias{gp.xydata2matrix}
\alias{gp.XYcoords.convert.fun}
\alias{gp.XYcoords2shpere}
\title{Working with matrix and XY data files}
\description{\code{gp.matrixfile.pad} adds 1 row and 1 column (by duplicating the last row and last column) to a matrix file
\code{gp.saveXYfile} saves an R matrix with coords as a XY data file
\code{gp.xydata2matrix} converts a file with splot data to a gnuplot matrix file
\code{gp.XYcoords.convert.fun} reads a XY data file and changes the coords according to 2 functions
\code{gp.XYcoords2shpere} reads a XY data file and changes the coords to fit a sphere
}
\usage{gp.matrixfile.pad(fileIN,fileOUT,overwrite=TRUE)
gp.saveXYfile(Rmatrix,xyfile)
gp.xydata2matrix(fileIN,fileOUT)
gp.XYcoords.convert.fun(xyfile,newxyfile,fun1,fun2,swapXY=FALSE)
gp.XYcoords2shpere(xyfile,newxyfile)
}
\arguments{	\item{fileIN}{ input file name}
\item{fileOUT}{ output file name}
\item{overwrite}{ boolean, TRUE=overwrite the output file}
\item{Rmatrix}{ R matrix}
\item{xyfile}{ input XY file name}
\item{newxyfile}{ output XY file name}
\item{fun1}{ function for the x values}
\item{fun2}{ function for the y values}
\item{swapXY}{ boolean, TRUE=swap x and y}
}
\value{	none}
\seealso{	\code{\link{gp.matrix2GimpPalette}}}
\author{Jose' Gama}
\keyword{programming}
