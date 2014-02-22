library(Rgnuplot)

if (!file.exists('earth_day.jpg')) download.file('http://nssdc.gsfc.nasa.gov/planetary/image/earth_day.jpg','earth_day.jpg')
# mask the oceans and large water bodies with black color
gp.image.rgbchange('earth_day.jpg', 'earth_dayWATERmask.png', 'PNG', NULL,'(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:r',
'(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:g','(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:b')

# turn the map into 2 colors: land=white, water=black
gp.image.rgbchange('earth_day.jpg', 'earth_dayWATERland.png', 'PNG', NULL,'(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:255',
'(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:255','(r>2 & r<32 & g>26 & g<52 & b<106 & b>50)?0:255')

#The desired resolution is two degrees, therefore the image is resized to 180 by 90 pixels
#the image can be edited with GIMP for better results
gp.image.resize('earth_dayWATERland.png', 'earth_dayWATER2deg.png', 180,90)

# create a squarish map from the PNG
PNGfile='earth_dayWATER2deg.png'
landoutlinefile='earth_dayWATER2deg.dat'
gp.map.PNG2lines('earth_dayWATER2deg.png','earth_dayWATER2deg.dat')

# GISS Surface Temperature Analysis
# based on http://www.gnuplotting.org/heat-maps/
# data from NASA http://data.giss.nasa.gov

# 2D map 
anomalyData<-'GHCN_GISS_HR2SST_1200km_Anom11_2012_2012_1951_1980.txt'
if (!file.exists(anomalyData)) file.copy(system.file('extdata/' %s% anomalyData, package='Rgnuplot'),getwd())
gp.run('#set term pngcairo;set output "GHCN1.png"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
plot "' %s% anomalyData %s% '" every ::2 u (int($3)):(int($4)):(($5>8 & $5<9999)?8:$5) w image, "worldRmap.dat" u 1:2 w l lc rgb "black" notit',TRUE) #skip the first 2 lines, trim to max 8

# modifying an existing palette
if (!file.exists('GrMg_16.txt')) download.file('http://geography.uoregon.edu/datagraphics/color/GrMg_16.txt','GrMg_16.txt')
pl1<-read.table('GrMg_16.txt',header = F,skip=2,stringsAsFactors=FALSE, strip.white=TRUE)
pl1<-pl1[,1:3]
pl2<-c(t(data.matrix(pl1)))
#saving the palette with solid colors
str(pl2)
gp.matrix2palette(pl2, 'GrMg_16.pal',paletteIndec=-7:8,SolidColor=TRUE)
gp.run('#set term pngcairo;set output "GHCN1b.png"
unset key
unset xtics
unset ytics
set size ratio -1
set xrange[-179:179]
set yrange[-89:89]
set cbrange [-8:8]
set palette model RGB file "GrMg_16.pal" u 4:1:2:3
set format "%g"
plot "' %s% anomalyData %s% '" every ::2 u (int($3)):(int($4)):(($5>8)?8:$5) w image notit,\\
"worldRmap.dat" u 1:2 w l lc rgb "black" notit,\\
"' %s% anomalyData %s% '" every ::2 u (int($3)):(int($4)):(0):(0):(0):(($5<999)?0:500) w rgba notit',TRUE)


# the data must be changed so that splot can use it
z<-read.table(anomalyData, header = F,skip=2, strip.white=TRUE,blank.lines.skip=TRUE)
z<-z[,c(4,3,5)] # remove the first two columns
anomalyDataXY<-substr(anomalyData,1,nchar(anomalyData)-4) %s% 'matrixndx.dat'
gp.saveXYfile(z,anomalyDataXY) # save with XY format

gp.run('#set term pngcairo;set output "GHCN2.png"
set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
set hidden3d front offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set view equal xyz
set view 80,270,1,1
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
set cbrange [-4.3:8.1]
set isosamples 9
set pm3d corners2color c1
set multiplot layout 1,2
set view 1,1,2,2 #Northern hemisphere
splot  "' %s% anomalyDataXY %s% '" u ($2):(1+$1):(1):(($3>8 & $3<9999)?8:$3) w pm3d notit , cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit,"worldRmap.dat" u 1:2:(1) w l lc rgb "black" notit
set view 183,180,2,2 #Southern hemisphere
splot  "' %s% anomalyDataXY %s% '" u ($2):(1+$1):(1):(($3>8 & $3<9999)?8:$3) w pm3d notit , cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit,"worldRmap.dat" u 1:2:(1) w l lc rgb "black" notit
unset multiplot',TRUE)

# 2D map "squarish" with smoothing
gp.run('!awk \'(FNR+1) % 2 == 0 {print ""} 1\' earth_dayWATER2deg.dat > earth_dayWATER2degS.dat',FALSE)
gp.run('#set term pngcairo;set output "GHCN3.png"
unset xtics
unset ytics
unset ztics
set size ratio -1
set view map
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ -180.0000 : 180.0000 ] noreverse nowriteback
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
set cbrange [-4.3:8.1]
set isosamples 9
set pm3d interpolate 0,10
splot  "' %s% anomalyDataXY %s% '" u ($2+1):($1+1):(0):(($3>8 & $3<9999)?8:$3) w pm3d notit,\\
"earth_dayWATER2degS.dat" u 1:2:(0)  w l lw 0.5 lc rgb "black" notit',TRUE)


# 2D map "squarish"
gp.run('#set term pngcairo;set output "GHCN4.png"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette defined ( -4.3 "#7f00ff", -4 "#7f00ff", -4 "#4094ff", -2 "#4094ff", -2 "#78ccff", -1 "#78ccff", -1 "#98ecfd", -.5 "#98ecfd", -.5 "#d8fdd8",  -.2 "#d8fdd8", -.2 "#fdfdfd", .2 "#fdfdfd", .2 "#fdfd4b", .5 "#fdfd4b", .5 "#fdcb00", 1 "#fdcb00", 1 "#fd7e00", 2 "#fd7e00", 2 "#fd0000", 4 "#fd0000", 4 "#7e0000", 8.1 "#7e0000", 8.2 "#9d9d9d")
set format "%g"
plot "' %s% anomalyData %s% '" every ::2 u (int($3)):(int($4)):(($5>8 & $5<9999)?8:$5) w image,\\
"earth_dayWATER2deg.dat" w l lw 0.5 lc rgb "black" notit',TRUE)

# This is an example of how to use existing color schemes:
download.file('http://geography.uoregon.edu/datagraphics/color/BuOrR_14.txt','BuOrR_14.txt')
gp.run('#set term pngcairo;set output "GHCN5.png"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-8:8]#[-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette model RGB file "BuOrR_14.txt" every ::2 u 1:2:3
set format "%g"
plot "' %s% anomalyData %s% '" every ::2 u 3:4:(($5>999)?0:$5) w image,\\
"earth_dayWATER2deg.dat" w l lw 0.5 lc rgb "black" notit',TRUE)

#create a scheme
library(colorspace)
rgb1<-sRGB(.498,0,1)
rgb2<-sRGB(.494,0,0)
Prange<-c(0,.1, .6,.7,.8,.9,1)
d<-gp.diverging.colormap(Prange,rgb1,rgb2)
d[d<0.002]<-0
d[d>1]<-1
d2<-cbind(d[,1],' ',d[,2],' ',d[,3],'\n')
d3<-paste(c(t(d2)), sep='',collapse='')
d3<-substr(d3,1,nchar(d3)-1)
gp.run('#set term pngcairo;set output "GHCN6.png"
unset key
unset xtics
unset ytics
set size ratio -1
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set palette file "-"
' %s% d3  %s% '
e
set format "%g"
plot "' %s% anomalyData %s% '" every ::2 u 3:4:(($5>999)?0:$5) w image,\\
"earth_dayWATER2deg.dat" w l lw 0.5 lc rgb "black" notit,\\
"' %s% anomalyData %s% '" every ::2 u 3:4:(.62):(.62):(.62):(($5<999)?0:150) w rgba notit',TRUE)


gp.matrixr2gnu(d,'anomaly.pal')
#Winkel tripel projection
gp.run('load "projections.gnu"
set size ratio -1
p=WinkeltripelInit(1)
set title "Temperature anomalies December 2012\\n1981-2010 base period"
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set pm3d map
splot "' %s% anomalyDataXY %s% '" using (WinkeltripelYC($1,$2)):(WinkeltripelXC($1,$2)):(($2>167 | $2<-167 | $1>85 | $1<-75 )?0/0:1)  w p pt 7 ps 1 lc rgb "grey" notit
set palette model RGB file "anomaly.pal" u 1:2:3
set format "%g"
replot "' %s% anomalyDataXY %s% '" using (WinkeltripelYC($1,$2)):(WinkeltripelXC($1,$2)):(1):(($3<9999)?$3:0/0) w pm3d notit ,\\
"earth_dayWATER2degS.dat" using (WinkeltripelYC($2,$1)):(WinkeltripelXC($2,$1)):(1) w l lw 0.5 lc rgb "black" notit
#set term pngcairo;set output "GHCN7.png";replot',TRUE)

#Robinson projection
gp.run('load "projections.gnu"
set size ratio -1
p=RobinsonInit(60)
set title "Temperature anomalies December 2012\\n1981-2010 base period"
set cbrange [-4.3:8.1]
set xrange[-179:179]
set yrange[-89:89]
set pm3d map
splot "' %s% anomalyDataXY %s% '" using (RobinsonYC($1,$2)):(RobinsonXC($1,$2)):(($2>170 | $2<-170 | $1>85 | $1<-84 )?0/0:1)  w p pt 7 ps 1 lc rgb "grey" notit
set palette model RGB file "anomaly.pal" u 1:2:3
set format "%g"
replot "' %s% anomalyDataXY %s% '" using (RobinsonYC($1,$2)):(RobinsonXC($1,$2)):(1):(($3<9999)?$3:0/0) w pm3d notit ,\\
"earth_dayWATER2degS.dat" using (RobinsonYC($2,$1)):(RobinsonXC($2,$1)):(1) w l lw 0.5 lc rgb "black" notit
#set term pngcairo;set output "GHCN7.png";replot',TRUE)

