\name{GpwriteXcsv}
\alias{GpwriteXcsv}
\title{Write single column CSV file}
\description{\code{GpwriteXcsv} writes a single column CSV file for use with gnuplot commands later}
\usage{GpwriteXcsv(fileName,x,n,title)}
\arguments{	\item{fileName}{ CSV file name}
	\item{x}{ A column buffer}
	\item{n}{ number of columns}
	\item{title}{ 	Title to write for the first line of the .csv file, will be preceeded by "#" }}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\keyword{programming}
