\name{gp.matrix2XYdata}
\alias{gp.matrix2XYdata}
\title{Converting a file to X, Y format}
\description{\code{gp.matrix2XYdata} converts a file with data in matrix format to an X, Y format readable by gnuplot}
\usage{gp.matrix2XYdata(fileName1,fileName2,optMatrix=NA,surfacegrid=FALSE,overwrite=TRUE)}
\arguments{	\item{fileName1}{ file with data in matrix format}
	\item{fileName2}{ file to save the data in X, Y format}
	\item{optMatrix}{ optional matrix to add to the output file's 4th data column}
	\item{surfacegrid}{ if TRUE then the data is in grid format}
	\item{overwrite}{ if set to TRUE then it will overwrite an existing file without warning}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\keyword{programming}
