\name{Gpmatrixr2gnu}
\alias{Gpmatrixr2gnu}
\title{Save R matrix in gnuplot format}
\description{\code{Gpmatrixr2gnu} saves an R matrix in a format that can be 
read by gnuplot}
\usage{Gpmatrixr2gnu(rmatrix, gnufile)}
\arguments{	\item{rmatrix}{ R matrix}
	\item{gnufile}{ gnuplot file name}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-Gpinit()
#set gnuplot's additional search directories, to the extdata directory from 
#Rgnuplot (default)
Gpsetloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory 
#(default)
Gpsetwd(h1)
\dontrun{
nordklim <- read.table(system.file('extdata/NordklimData.tab', package = 
"Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)
NKmonths <- c('January','February','March','April','May','June','July',
'August','September','October','November','December')
#choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
nordklimHelsinkiPrecipitation <- nordklim[which((nordklim$NordklimNumber==304) &
(nordklim$CountryCode=='FIN') & (nordklim$ClimateElement==601)),c('FirstYear',
NKmonths)]
nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
#save to a data file
Gpmatrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')
}
#close gnuplot handle
h1<-Gpclose(h1)
}
\keyword{programming}
