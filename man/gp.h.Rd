\name{gp.h}
\alias{gp.h}
\title{Show gnuplot's help}
\description{\code{gp.h} shows the output from gnuplot's help command}
\usage{gp.h(handle, gnustring)}
\arguments{	\item{handle}{ handle to the connection}
	\item{gnustring}{ string to be searched for by gnuplot's help system}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
\dontrun{
gp.h(h1,'plot')
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
