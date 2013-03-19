require(Rgnuplot)
require(nordklimdata1)
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)

data(NordklimData)
#nordklim <- read.table(system.file('extdata/NordklimData.tab', package = "Rgnuplot"), stringsAsFactors=FALSE, header=TRUE)

NKmonths <- c('January','February','March','April','May','June','July','August','September','October','November','December')
#choose Helsinki (code 304) and country (code 'FIN') Precipitation (code 601)
nordklimHelsinkiPrecipitation <- NordklimData[which((NordklimData$NordklimNumber==304) & (NordklimData$CountryCode=='FIN') & (NordklimData$ClimateElement==601)),c('FirstYear',NKmonths)]
nordklimHelsinkiPrecipitation <- as.matrix(nordklimHelsinkiPrecipitation)
#save to a data file
gp.matrixr2gnu(nordklimHelsinkiPrecipitation, 'NORDKLIM-Helsinki-prec.dat')
#2D plot with yearly average of data OK!
gp.cmd(h1,'#set terminal png;set output "NORDKLIM1-1.png"
reset
set title "Helsinki Precipitation"
plot "NORDKLIM-Helsinki-prec.dat" using 1:(($2+$3+$4+$5+$6+$7+$8+$9+$10+$11+$12+$13)/12.0) with lines tit "yearly average"')
gp.pause()
#2D plot with 4 months of data OK!
gp.cmd(h1,'#set terminal png;set output "NORDKLIM1-2.png"
reset
set title "Helsinki Precipitation"
plot "NORDKLIM-Helsinki-prec.dat" using 1:2 with lines tit "January",  "NORDKLIM-Helsinki-prec.dat" using 1:3 with lines tit "February",\\
"NORDKLIM-Helsinki-prec.dat" using 1:4 with lines tit "March",  "NORDKLIM-Helsinki-prec.dat" using 1:5 with lines tit "April"' )
gp.pause()
#convert the data file from 12 columns for the monthly data to 2 rows
gp.cols2rows('NORDKLIM-Helsinki-prec.dat','NORDKLIM-Helsinki-prec-columns.dat')
#3D all months/years lines
gp.cmd(h1,'reset
unset key
#unset ztics
set grid xtics
set grid ytics
set ztics scale 5
set xmtics
set pm3d
set xrange[1:12]
splot "NORDKLIM-Helsinki-prec-columns.dat" using 1:2:3  w l  linewidth 2 linecolor 3' )
gp.pause()
#2D heatmap
gp.cmd(h1,'#set terminal png;set output "NORDKLIM1-4.png"
reset
set xrange [ 1891 : 2002 ]
set yrange [ 1 : 12 ] # hide the year column
set ymtics
set pm3d map
set title "Helsinki Precipitation"
splot "NORDKLIM-Helsinki-prec.dat" u ($2+1891):1:3 matrix w pm3d notit' )
gp.pause()
#close gnuplot handles
h1<-gp.close(h1)
