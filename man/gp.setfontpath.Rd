\name{gp.setfontpath}
\alias{gp.setfontpath}
\title{Set gnuplot's additional directories, for fonts}
\description{\code{gp.setfontpath} set gnuplot's additional directories, for 
fonts, default path = extdata directory from Rgnuplot}
\usage{gp.setfontpath(handle,fontpath)}
\arguments{	\item{handle}{ handle to the connection}
	\item{fontpath}{ string with gnuplot's additional directories, for 
fonts}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#set gnuplot's additional search directories for fonts, to the extdata 
#directory from Rgnuplot (default)
gp.setfontpath(h1)
#get gnuplot's additional search directories for fonts
gp.getfontpath(h1)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
