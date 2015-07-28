\name{GpmatrixfilePad}
\alias{GpmatrixfilePad}
\alias{GpsaveXYfile}
\alias{Gpxydata2matrix}
\alias{GpXYcoordsConvertFun}
\alias{GpXYcoords2shpere}
\title{Working with matrix and XY data files}
\description{\code{GpmatrixfilePad} adds 1 row and 1 column (by duplicating the last row and last column) to a matrix file
\code{GpsaveXYfile} saves an R matrix with coords as a XY data file
\code{Gpxydata2matrix} converts a file with splot data to a gnuplot matrix file
\code{GpXYcoordsConvertFun} reads a XY data file and changes the coords according to 2 functions
\code{GpXYcoords2shpere} reads a XY data file and changes the coords to fit a sphere
}
\usage{GpmatrixfilePad(fileIN,fileOUT,overwrite=TRUE)
GpsaveXYfile(Rmatrix,xyfile)
Gpxydata2matrix(fileIN,fileOUT)
GpXYcoordsConvertFun(xyfile,newxyfile,fun1,fun2,swapXY=FALSE)
GpXYcoords2shpere(xyfile,newxyfile)
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
\seealso{	\code{\link{Gpmatrix2GimpPalette}}}
\author{Jose' Gama}
\keyword{programming}
