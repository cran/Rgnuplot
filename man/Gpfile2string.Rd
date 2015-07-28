\name{Gpfile2string}
\alias{Gpfile2string}
\title{Read a text file to a string}
\description{\code{Gpfile2string} reads the contents of a text file to a string}
\usage{Gpfile2string(mfile)}
\arguments{	\item{mfile}{ file to be read}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - loading and executing a gnuplot script from Rgnuplot
#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
Gpsetloadpath(h1)
\dontrun{
#the filename has Rgnuplot's extdata path
gpfile <- system.file(package='Rgnuplot') %s% '/extdata/helloworld.gnu'
#load script into a string
s<-Gpfile2string(gpfile)
#send gnuplot commands
Gpcmd(h1,s)
#pause R and gnuplot
Gppause()}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
