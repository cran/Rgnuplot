\name{Gpgetfontpath}
\alias{Gpgetfontpath}
\title{Get gnuplot's additional directories, for fonts}
\description{\code{Gpgetfontpath} lists gnuplot's additional directories, for
fonts}
\usage{Gpgetfontpath(handle)}
\arguments{	\item{handle}{ handle to the connection}}
\value{	String with a list of gnuplot's additional directories, for fonts}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
#set gnuplot's additional search directories for fonts, to the extdata directory
#from Rgnuplot (default)
Gpsetfontpath(h1)
#get gnuplot's additional search directories for fonts
Gpgetfontpath(h1)
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
