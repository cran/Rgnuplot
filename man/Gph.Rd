\name{Gph}
\alias{Gph}
\title{Show gnuplot's help}
\description{\code{Gph} shows the output from gnuplot's help command}
\usage{Gph(handle, gnustring)}
\arguments{	\item{handle}{ handle to the connection}
	\item{gnustring}{ string to be searched for by gnuplot's help system}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
\dontrun{
Gph(h1,'plot')
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
