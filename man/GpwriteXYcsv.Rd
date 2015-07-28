\name{GpwriteXYcsv}
\alias{GpwriteXYcsv}
\title{Write double column CSV file}
\description{\code{GpwriteXYcsv} writes a double column CSV file for use with gnuplot commands later}
\usage{GpwriteXYcsv(fileName,x,y,n,title)}
\arguments{	\item{fileName}{ CSV file name}
	\item{x}{ A column buffer}
	\item{y}{ A column buffer}
	\item{n}{ number of columns}
	\item{title}{ 	Title to write for the first line of the .csv file, will be preceeded by "#" }}\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\keyword{programming}
