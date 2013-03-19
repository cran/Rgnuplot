\name{gp.file2string}
\alias{gp.file2string}
\title{Read a text file to a string}
\description{\code{gp.file2string} reads the contents of a text file to a string}
\usage{gp.file2string(mfile)}
\arguments{	\item{mfile}{ file to be read}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#"Hello World!" - loading and executing a gnuplot script from Rgnuplot
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
\dontrun{
#the filename has Rgnuplot's extdata path
gpfile <- system.file(package='Rgnuplot') %s% '/extdata/helloworld.gnu'
#load script into a string
s<-gp.file2string(gpfile)
#send gnuplot commands
gp.cmd(h1,s)
#pause R and gnuplot
gp.pause()}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
