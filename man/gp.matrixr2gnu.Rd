\name{gp.matrixr2gnu}
\alias{gp.matrixr2gnu}
\title{Save R matrix in gnuplot format}
\description{\code{gp.matrixr2gnu} saves an R matrix in a format that can be read by gnuplot}
\usage{gp.matrixr2gnu(rmatrix, gnufile)}
\arguments{	\item{rmatrix}{ R matrix}
	\item{gnufile}{ gnuplot file name}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
\dontrun{
nordklim <- read.table(system.file('extdata/NordklimData.tab', package = "Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)
NKmonths <- c('January','February','March','April','May','June','July','August','September','October','November','December')
#choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
nordklimHelsinkiPrecipitation <- nordklim[which((nordklim$NordklimNumber==304) & (nordklim$CountryCode=='FIN') & (nordklim$ClimateElement==601)),c('FirstYear',NKmonths)]
nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
#save to a data file
gp.matrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
