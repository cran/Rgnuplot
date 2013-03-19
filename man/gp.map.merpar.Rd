\name{gp.map.merpar}
\alias{gp.map.merpar}
\alias{gp.mapsr2gnu}
\title{Work with vector files for plotting maps}
\description{\code{gp.map.merpar} creates a data file with meridians or parallels
\code{gp.mapsr2gnu} saves the lines and points from a maps object to a data file readable by gnuplot}
\usage{gp.map.merpar(parfile='worldpar.dat',merfile='worldmer.dat',pardeg=10,merdeg=10,splot=FALSE)
gp.mapsr2gnu(mapsObj,mapFileName)
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
\seealso{	\code{\link{gp.resampleDEM}}}
\author{Jose' Gama}
\keyword{programming}
