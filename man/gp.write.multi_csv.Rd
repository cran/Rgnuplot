\name{gp.write.multi.csv}
\alias{gp.write.multi.csv}
\title{Write multi column CSV file}
\description{\code{gp.write.multi.csv} Writes a multi column CSV file for use with gnuplot commands later}
\usage{gp.write.multi.csv(fileName,xListPtr,n,numColumns,title)}
\arguments{	\item{fileName}{ CSV file name}
	\item{xListPtr}{ A list of pointers to column buffers}
	\item{n}{ number of columns}
	\item{numColumns}{ Length of xListPtr lis}
	\item{title}{ 	Title to write for the first line of the .csv file, will be preceeded by "#" }}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\keyword{programming}
