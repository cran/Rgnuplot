\name{gp.cols2rows}
\alias{gp.cols2rows}
\title{convert a file with columns to rows}
\description{\code{gp.cols2rows} converts a file with columns yyyy,m1,m2,m3,...,
m12 to rows yyyy,m1 yyyy,m3 ... yyyy,m12 readable by gnuplot}
\usage{gp.cols2rows(filename, newfile, filecolseparator=' ', fileheader = FALSE,
newfilerowseparator='\n\n')}
\arguments{	\item{filename}{ file with columns yyyy,m1,m2,m3,...,m12}
	\item{newfile}{ file with rows yyyy,m1 yyyy,m3 ... yyyy,m12}
	\item{filecolseparator}{ string that separates the columns}
	\item{fileheader}{ optional column header}
	\item{newfilerowseparator}{ string that separates the rows}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Jose' Gama}
\examples{
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory 
# from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as 
#R's working directory (default)
gp.setwd(h1)
\dontrun{
nordklim <- read.table(system.file('extdata/NordklimData.tab', package = 
"Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)

NKmonths <- c('January','February','March','April','May','June','July','August',
'September','October','November','December')
#choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
nordklimHelsinkiPrecipitation <- nordklim[which((nordklim$NordklimNumber==304) &
(nordklim$CountryCode=='FIN') & (nordklim$ClimateElement==601)),c('FirstYear',
NKmonths)]
nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
#save to a data file
gp.matrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')

#convert the data file from 12 columns for the monthly data to 2 rows
gp.cols2rows('NORDKLIM-Helsinki-prec.dat','NORDKLIM-Helsinki-prec-columns.dat')
}
#close gnuplot handle
h1<-gp.close(h1)
}
\keyword{programming}
