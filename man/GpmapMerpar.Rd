\name{GpmapMerpar}
\alias{GpmapMerpar}
\alias{Gpmapsr2gnu}
\title{Work with vector files for plotting maps}
\description{\code{GpmapMerpar} creates a data file with meridians or 
	parallels
\code{Gpmapsr2gnu} saves the lines and points from a maps object to a data 
file readable by gnuplot}
\usage{GpmapMerpar(parfile='worldpar.dat',merfile='worldmer.dat',pardeg=10,
	merdeg=10,splot=FALSE)
Gpmapsr2gnu(mapsObj,mapFileName)
}
\arguments{	\item{parfile}{ output file with parallels}
\item{merfile}{ output file with meridians}
\item{pardeg}{ resolution is degrees for parallels}
\item{merdeg}{ resolution is degrees for meridians}
\item{splot}{ boolean, TRUE=output for splot}
\item{mapsObj}{ object of type maps}
\item{mapFileName}{ output data file name}
}
\value{	none}
\seealso{	\code{\link{GpresampleDEM}}}
\author{Jose' Gama}
\keyword{programming}
