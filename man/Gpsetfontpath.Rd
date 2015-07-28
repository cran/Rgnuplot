\name{Gpsetfontpath}
\alias{Gpsetfontpath}
\title{Set gnuplot's additional directories, for fonts}
\description{\code{Gpsetfontpath} set gnuplot's additional directories, for 
fonts, default path = extdata directory from Rgnuplot}
\usage{Gpsetfontpath(handle,fontpath)}
\arguments{	\item{handle}{ handle to the connection}
	\item{fontpath}{ string with gnuplot's additional directories, for 
fonts}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#set gnuplot's additional search directories for fonts, to the extdata 
#directory from Rgnuplot (default)
Gpsetfontpath(h1)
#get gnuplot's additional search directories for fonts
Gpgetfontpath(h1)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
