\name{gp.getfontpath}
\alias{gp.getfontpath}
\title{Get gnuplot's additional directories, for fonts}
\description{\code{gp.getfontpath} lists gnuplot's additional directories, for
fonts}
\usage{gp.getfontpath(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with a list of gnuplot's additional directories, for fonts}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
#set gnuplot's additional search directories for fonts, to the extdata directory
#from Rgnuplot (default)
gp.setfontpath(h1)
#get gnuplot's additional search directories for fonts
gp.getfontpath(h1)
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
