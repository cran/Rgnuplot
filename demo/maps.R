library(Rgnuplot)

#convert the map of the world from the R package maps into a format readable by gnuplot
library(maps)
gp.mapsr2gnu(map('world',plot=FALSE),'worldRmap.dat')
#plot the map of the world - cartesian coordinate system by default - Equirectangular Projection (plate carree projection)
gp.run('#set terminal png;set output "worldRmap.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]#longitude
set yrange[-89:89]#latitude
plot "worldRmap.dat" w l lc rgb "black"',TRUE)

#convert the map of New Zealand from the R package mapdata into a format readable by gnuplot
library(mapdata)
gp.mapsr2gnu(map('world2Hires', c('New Zealand:Stewart Island', 'New Zealand:South Island','New Zealand:North Island','New Zealand:Great Barrier Island','New Zealand:Auckland Island'),plot=FALSE)
,'NewZealand.dat')
#plot the map of the world in black and New Zealand in red
gp.run('#set terminal png;set output "worldNewZealand.png"
unset key
unset xtics
unset ytics
set xrange[-179:179]#longitude
set yrange[-89:89]#latitude
plot "worldRmap.dat" w l lc rgb "black", "NewZealand.dat" w filledcurve lc rgb "red"',TRUE)

#find the bounding box around New Zealand
NZbox<-gp.boxXY('NewZealand.dat')
#plot the map of New Zealand
gp.run('#set terminal png;set output "NewZealandboxXY.png"
unset key
unset xtics
unset ytics
set size ratio 1.8
set xrange[' %s% NZbox[1,1] %s% ':' %s% NZbox[2,1] %s% ']#longitude
set yrange[' %s% NZbox[1,2] %s% ':' %s% NZbox[2,2] %s% ']#latitude
plot "NewZealand.dat" w l lc rgb "red"',TRUE)

#plot the map of the world in black and New Zealand in red - Polar Stereographic Projection
gp.run('#set terminal png;set output "worldNewZealandPolarStereographic.png"
set polar
set angles degrees
unset border # hide border
unset xtics # hide X-numbers
unset ytics # hide Y-numbers
set hidden3d
set grid polar 45
set size ratio -1
set rrange [-89:0]
set trange [-180:180]
set xrange[89:-89]#longitude
set yrange[-89:89]#latitude
set multiplot layout 1,2
set title "Southern Hemisphere"
plot (0) w l lc rgb "black" notit, "worldRmap.dat" w l lc rgb "blue" notit, "NewZealand.dat" w l lc rgb "red" notit
set rtics (0,20,40,60,80)
set rtics axis mirror 
set rrange [89:179]
set trange [-180:180]
set xrange[89:-89]
set yrange[89:-89]
set title "Northern Hemisphere"
plot (0) w l lc rgb "black" notit, "worldRmap.dat" u 1:(($2>0)?$2:0/0)  w l lc rgb "blue" notit
unset multiplot',TRUE)
 
#plot the world and New Zealand in 3-dimensions - spherical - Orthographic Projection
gp.run('#set terminal png;set output "worldNewZealandOrthographic.png"
set angles degrees
unset key
set parametric
set samples 32 
set isosamples 13, 25 #12 parallels 24 meridians
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ]
set vrange [ -180.000 : 180.000 ]
set hidden3d front
set view equal xyz
set view 110,250
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "NewZealand.dat" u 1:2:(1) w l lc rgb "red" notit,"worldRmap.dat" u 1:2:(1) w l lc rgb "black" notit',TRUE)

#plot the world and New Zealand in 3-dimensions - cylindrical
gp.run('set angles degrees
unset key
set parametric
set samples 32,32 
set isosamples 13, 13# 12 parallels 12 meridians
set mapping cylindrical
set hidden3d back offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set yzeroaxis linetype 0 linewidth 1.000
set ticslevel 0
set urange [ -180.000 : 180.000 ] noreverse nowriteback
set vrange [ -90.0000 : 90.0000 ] noreverse nowriteback
set view 64,250
Cyldiameter=1
splot cos(u)*Cyldiameter,sin(u)*Cyldiameter,v w l lc rgb "grey" notit, "NewZealand.dat" u 1:2:(Cyldiameter) w l lc rgb "red" notit,"worldRmap.dat" u 1:2:(Cyldiameter) w l lc rgb "black" notit',TRUE)

#convert a shapefile (SHP) to a format readable by gnuplot
#the shapefile is the NZGD2000 Meridional Circuits, from 
#http://data.linz.govt.nz/layer/817-nz-meridional-circuit-boundaries-nzgd2000/
og <- '/lds-nz-meridional-circuit-boundaries-nzgd2000-SHP'
if (!file.exists(og)) print('Please download the file "lds-nz-meridional-circuit-boundaries-nzgd2000-SHP"') else {
gp.SHP2gnu(og,'nz-meridional-circuit-bou','NZ.dat') # NZGD2000 to WGS84
#plot the map of New Zealand with meridional circuit boundaries
gp.run('#set terminal png;set output "worldNewZealandMeridionalCircuit.png"
unset key
unset xtics
unset ytics
set size ratio 1.8
set xrange[' %s% NZbox[1,1] %s% ':' %s% NZbox[2,1] %s% ']#longitude
set yrange[' %s% NZbox[1,2] %s% ':' %s% NZbox[2,2] %s% ']#latitude
plot "NewZealand.dat" w l lc rgb "red", "NZ.dat" w l',TRUE)
}

# plot the map of the world - cartesian coordinate system by default, Equirectangular Projection
# Cloudless Earth (Day)
# http://nssdc.gsfc.nasa.gov/planetary/image/earth_day.jpg
# Cloudless Earth (Night)
# http://nssdc.gsfc.nasa.gov/planetary/image/earth_night.jpg
# download the Cloudless Earth (Day) image file from NASA
if (!file.exists('earth_day.jpg')) download.file('http://nssdc.gsfc.nasa.gov/planetary/image/earth_day.jpg','earth_day.jpg')
gp.run('#set terminal pngcairo;set output "gp_earth_day.png"
unset key
unset xtics
unset ytics
set xrange[1:2000]
set yrange[1:1000]
plot "earth_day.jpg" binary filetype=jpg w rgbimage notit,"worldRmap.dat" u (($1+360/2)/360*2000):(($2+180/2)/180*1000) w l lc rgb "red" notit',TRUE)

#create files in matrix and XY format, with the indexed colors from a PNG file, create also a palette file
testmap<-'earth_day'# file to be mapped
#gp.image2PNG(testmap %s% '.jpg',testmap %s% '.png') # convert from JPEG to PNG
gp.image.resize(testmap %s% '.jpg',testmap %s% '.png',1000,500) # reduce the size to 1/2
PNGdata2<-gp.PNG2color(testmap %s% '.png') # get the color matrix from the PNG file
Mheight<-dim(PNGdata2)[1]# map height
Mwidth<-dim(PNGdata2)[2]# map width
paletteRGB<-gp.CreatePaletteFromMatrix(PNGdata2) # create a palette
gp.RGB1to3channels(paletteRGB,fileRGB3channel=testmap %s% '.pal') # save the palette to a file with separated RGB components
PNGdataIndexed<-gp.CreateIndexFromMatrixAndPalette(PNGdata2, paletteRGB) # create an indexed color matrix
gp.matrixr2gnu(PNGdataIndexed,testmap %s% 'matrixndx.dat') # save the indexed color matrix to a file
NpaletteColors<-length(paletteRGB)-1 # number of palette colors starting from zero

# using splot to plot a 2D map from a data file in matrix format
gp.run('set pm3d map
set size ratio -1;set lmargin 0;set rmargin 0;set tmargin 0;set bmargin 0;unset key;unset tics;unset border;set yrange [] reverse;unset colorbox
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
splot "earth_daymatrixndx.dat" matrix u 1:2:3 w pm3d notit',TRUE)

# using splot to plot a 2D map from a data file in XY format
gp.matrix2XYdata(testmap %s% 'matrixndx.dat',testmap %s% 'XYndx.dat') # create an XY file from the matrix file 
gp.run('set pm3d map
set size ratio -1;set lmargin 0;set rmargin 0;set tmargin 0;set bmargin 0;unset key;unset tics;unset border;unset colorbox
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
splot "earth_dayXYndx.dat" u (($2)/1000*360-180):(-($1)/500*180-90):3 w pm3d notit',TRUE)

# convert the coordinates and save to a new file
gp.XYcoords.convert.fun('earth_dayXYndx.dat','earth_dayXYcoords.dat',function(y) -(y/500*180-90),function(x) (x/1000*360-180),TRUE)
# using splot to plot a 2D map from a data file in XY format, with the coordinates ready to use
gp.run('set pm3d map
set size ratio -1;set lmargin 0;set rmargin 0;set tmargin 0;set bmargin 0;unset key;unset tics;unset border;unset colorbox
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
splot "earth_dayXYcoords.dat" u 1:2:3 w pm3d notit',TRUE)

# plot the earth - 3d globe -  matrix data with the indexed colors
gp.run('#set term pngcairo;set output "globe6views.png"
set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set isosamples 13,13
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [-180.0000 : 180.0000 ] noreverse nowriteback
set hidden3d front offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set view equal xyz
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
Mwidth=' %s% Mwidth %s% '
Mheight=' %s% Mheight %s% '
set multiplot layout 2,3
set view 1,1,2,2 #North pole
splot "' %s% testmap %s% 'matrixndx.dat" matrix u (($1-Mheight)*180/Mheight):(-($2-Mheight/2)*180/Mheight):(1):3 w pm3d notit, cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "worldRmap.dat" u 1:2:(1) w l lc rgb "red" notit
set view 181,1,2,2 #South pole
replot
set view 92,271,2,2 #Greenwich 180
replot
set view 88,90,2,2 #Greenwich 0
replot
set view 92,0,2,2 #Greenwich 270
replot
set view 92,182,2,2 #Greenwich 90
replot
unset multiplot',TRUE)
gp.image.plot("globe6views.png")

# plot the earth - 3d globe - XY data with the indexed colors
gp.run('set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set vrange [ -90.0000 : 90.0000 ] noreverse nowriteback
set urange [ -180.0000 : 180.0000 ] noreverse nowriteback
set hidden3d front offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set view equal xyz
set isosamples 13,13
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1 
Mwidth=' %s% Mwidth %s% '
Mheight=' %s% Mheight %s% '-1
set multiplot layout 2,3
set view 358,2,2,2 #North pole
splot  "' %s% testmap %s% 'XYndx.dat" u (-(Mheight-$2)*180/Mheight):((Mheight/2-$1)*180/Mheight):(1):3 w pm3d notit, cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "worldRmap.dat" u ($1):($2):(1) w l lc rgb "red" notit
set view 178,178,2,2 #South pole
replot
set view 88,188,2,2 #Greenwich 90
replot
set view 92,90,2,2 #Greenwich 0
replot
set view 88,358,2,2 #Greenwich 270
replot
set view 88,268,2,2 #Greenwich 180
replot
unset multiplot',TRUE)


gp.XYcoords2shpere(testmap %s% 'XYndx.dat',testmap %s% 'XYnewCOORDSndx.dat')
gp.run('set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set vrange [ -90.0000 : 90.0000 ] noreverse nowriteback
set urange [ -180.0000 : 180.0000 ] noreverse nowriteback
set hidden3d front offset 0 trianglepattern 3 undefined 1 altdiagonal bentover
set view equal xyz
set isosamples 13,13
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
set multiplot layout 2,3
set view 2,2,2,2 #North pole
splot  "' %s% testmap %s% 'XYnewCOORDSndx.dat" u (-$2):($1):(1):3 w pm3d notit, cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "worldRmap.dat" u 1:2:(1) w l lc rgb "red" notit
set view 182,180,2,2 #South pole
replot
set view 92,188,2,2 #Greenwich 90
replot
set view 88,90,2,2 #Greenwich 0
replot
set view 88,2,2,2 #Greenwich 270
replot
set view 92,272,2,2 #Greenwich 180
replot
unset multiplot',TRUE)




#saving a map from package "maps" with Mercator projection
library(maps)
map('world', projection = 'mercator')
gp.mapsr2gnu(map('world', projection = 'mercator',plot=FALSE),'worldRmapMercator.dat')
gp.run('unset key; unset tics
plot "worldRmapMercator.dat" w l lc rgb "black"',TRUE)

# converting a world map from SHP to a data file readable by gnuplot
#download from http://www.naturalearthdata.com/downloads/
#ne_110m_coastline.zip only 84 kilobytes

download.file('http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_coastline.zip','ne_110m_coastline.zip', method = 'wget')
unzip('ne_110m_coastline.zip', exdir = "ne_110m_coastline")
library(maptools)
world.shp <- readShapeLines('ne_110m_coastline/ne_110m_coastline.shp', proj4string=CRS("+proj=longlat"))
plot(world.shp)

gp.SHP2gnu('ne_110m_coastline','ne_110m_coastline','ne_110m_coastline.dat') # it's already WGS84
gp.run('#set term png;set output "naturalearthdata_1.png"
plot "ne_110m_coastline.dat" w l lc rgb "black"',TRUE)

gp.map.merpar('worldpar.dat','worldmer.dat',10,10)
gp.run('#set term png;set output "naturalearthdata_2.png"
unset key; unset tics;unset border
plot "ne_110m_coastline.dat" w l lc rgb "black", "worldpar.dat"  w l lc rgb "grey", "worldmer.dat"  w l lc rgb "grey"',TRUE)

# convert the shapefile with Tissot's indicatrices to a data file format
# using the shapefile from Matthew T. Perry 2005, Tissot Indicatrix - Examining the distortion of map projections http://blog.perrygeo.net/2005/12/11/tissot-indicatrix-examining-the-distortion-of-2d-maps/
tissfiles<-dir(system.file(package='Rgnuplot')  %s% '/extdata',pattern='tissot')
if (!all(file.exists(tissfiles))) file.copy(system.file(paste('extdata/', tissfiles,sep=''), package='Rgnuplot'),getwd())
gp.SHP2gnu('.','tissot','tissot.dat')

if (!file.exists('NOAA Coastline Data.dat')) stop('Please download WCL(World Coast Line) from http://www.ngdc.noaa.gov/mgg_coastline/ and save it as "NOAA Coastline Data.dat"')
gp.run('!awk \'{gsub(/>/,"")}1\' "NOAA Coastline Data.dat" >NOAACoastline.dat',FALSE)
gp.run('unset key;plot "NOAACoastline.dat" w l, "worldpar.dat" w l,"worldmer.dat" w l',TRUE)

# Mercator's Projection
gp.run('#set term png;set output "NOAACoastline_Mercator.png"
load "projections.gnu"
p=MercatorInit(0)
set size ratio -1
set title p
plot "worldmer.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 3, \\
 "worldpar.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 2, \\
 "NOAACoastline.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 1',TRUE)

# Mercator's Projection with Tissot's indicatrices
gp.run('#set term png;set output "NOAACoastline_Mercator_Tissot.png"
load "projections.gnu"
p=MercatorInit(0)
set size ratio -1
set title p
plot "tissot.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) w l notit, \\
"worldmer.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 3, \\
 "worldpar.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 2, \\
 "NOAACoastline.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)) notit w l ls 1',TRUE) 



testmap<-'earth_day'
#gp.matrix2XYdata(testmap %s% 'matrixndx.dat',testmap %s% 'XYndx.dat') # create an XY file from the matrix file 
PNGdata2<-gp.PNG2color(testmap %s% '.png')#get the color matrix from the PNG file
Mheight<-dim(PNGdata2)[1]
Mwidth<-dim(PNGdata2)[2]
paletteRGB<-gp.CreatePaletteFromMatrix(PNGdata2)#create a palette
NpaletteColors<-length(paletteRGB)-1 # number of palette colors starting from zero

# create meridian and parallel lines for splot
gp.map.merpar('worldparS15.dat','worldmerS15.dat',15,15,TRUE)
gp.map.merpar('worldparS20.dat','worldmerS20.dat',20,20,TRUE)
# Mercator's Projection
gp.run('#set term pngcairo;set output "earth_dayMercator.png"
load "projections.gnu"
p=MercatorInit(0)
set title p
set pm3d map
unset key;unset tics;unset border;unset colorbox
set palette model RGB file "' %s% testmap %s% '.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
splot "earth_dayXYcoords.dat" u (MercatorYC($2,$1)):(MercatorXC($2,$1)):3 w pm3d notit, \\
"worldmerS15.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)):(1) notit w l ls 3, \\
"worldparS15.dat" using (MercatorYC($2,$1)):(MercatorXC($2,$1)):(1) notit w l ls 2',TRUE)


vmaps<-c('NOAACoastline.dat','worldmer.dat','worldpar.dat')
gp.plot.map(vmaps,linestyle=c(1,2,3))
gp.plot.map(vmaps,linestyle=c(1,2,3),projection='Mercator')

gp.plot.map(projection='Mercator',maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')
gp.plot.map(c('worldmer.dat','worldpar.dat'),projection='Mercator',linestyle=c(1,2,3),maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')

# create meridian and parallel lines for plot
gp.map.merpar('worldpar15.dat','worldmer15.dat',15,15)
gp.map.merpar('worldpar20.dat','worldmer20.dat',20,20)

vmaps2<-c('NOAACoastline.dat','worldmer15.dat','worldpar15.dat','tissot.dat')
vstyle2<-c(1,2,3,5)
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Mercator')# ,AdditionalCode='set term png;set output "Mercator1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Ortographic')# ,AdditionalCode='set term png;set output "Ortographic1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='EstereoAzimutal')# ,AdditionalCode='set term png;set output "EstereoAzimutal1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='PlateCarree')# ,AdditionalCode='set term png;set output "PlateCarree1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Lambert')# ,AdditionalCode='set term png;set output "Lambert1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='SansonFlamsteed')# ,AdditionalCode='set term png;set output "SansonFlamsteed1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='AlbersConical')# ,AdditionalCode='set term png;set output "AlbersConical1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='EckertI')# ,AdditionalCode='set term png;set output "EckertI1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='HammerWagner')# ,AdditionalCode='set term png;set output "HammerWagner1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='WernersEquivalent')# ,AdditionalCode='set term png;set output "WernersEquivalent1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='NaturalEarth')# ,AdditionalCode='set term png;set output "NaturalEarth1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Aitoff')# ,AdditionalCode='set term png;set output "Aitoff1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Winkeltripel')# ,AdditionalCode='set term png;set output "Winkeltripel1.png"\n'
gp.plot.map(vmaps2,linestyle=vstyle2,projection='Robinson')# ,AdditionalCode='set term png;set output "Robinson1.png"\n'

vmaps3<-c('worldmer15.dat','worldpar15.dat')
vstyle3<-c(2,3)
gp.plot.map(vmaps3,projection='Mercator',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Mercator2.png"\n'
gp.plot.map(vmaps3,projection='Ortographic',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Ortographic2.png"\n'
gp.plot.map(vmaps3,projection='EstereoAzimutal',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "EstereoAzimutal2.png"\n'
gp.plot.map(vmaps3,projection='PlateCarree',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "PlateCarree2.png"\n'
gp.plot.map(vmaps3,projection='Lambert',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Lambert2.png"\n'
gp.plot.map(vmaps3,projection='SansonFlamsteed',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "SansonFlamsteed2.png"\n'
gp.plot.map(vmaps3,projection='AlbersConical',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "AlbersConical2.png"\n'
gp.plot.map(vmaps3,projection='EckertI',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "EckertI2.png"\n'
gp.plot.map(vmaps3,projection='HammerWagner',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "HammerWagner2.png"\n'
gp.plot.map(vmaps3,projection='WernersEquivalent',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')#,AdditionalCode='set term pngcairo;set output "WernersEquivalent2.png"\n' 
gp.plot.map(vmaps3,projection='NaturalEarth',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "NaturalEarth2.png"\n'
gp.plot.map(vmaps3,projection='Aitoff',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Aitoff2.png"\n'
gp.plot.map(vmaps3,projection='Robinson',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Robinson2.png"\n'
gp.plot.map(vmaps3,projection='Winkeltripel',linestyle=vstyle3,maprastfile='earth_dayXYcoords.dat',maprastpalette='earth_day.pal')# ,AdditionalCode='set term pngcairo;set output "Winkeltripel2.png"\n'


# Ortographic Projection tangent plane at latitude 90 N and at latitude 90 S
vmaps2<-c('worldmer15.dat','worldpar15.dat','tissot.dat','NOAACoastline.dat')
vstyle2<-c(2,3,5,1)
gp.run('#set term png;set output "NOAACoastline_multi1.png"\nload "projections.gnu"\nset multiplot layout 1,2 scale 1.5 title "Ortographic Projection"\n'
%s% gp.plot.map(vmaps2,linestyle=vstyle2,projection='Ortographic', plotTitle='', AdditionalCode='set title "Northern Hemisphere" offset 0,-2',projectionInit='90,0,90,180',returnCode=TRUE)
%s% gp.plot.map(vmaps2,linestyle=vstyle2,projection='Ortographic', plotTitle='Southern Hemisphere',projectionInit='-90,0,90,180',returnCode=TRUE) %s% '\nunset multiplot',1)

# Ortographic Projection tangent plane at the Equator and Greenwich, plus a scaled view of Northern Europe
gp.run('#set term png;set output "NOAACoastline_multi2.png"\nload "projections.gnu"\nset multiplot layout 1,2 scale 1.5 title "Ortographic Projection"\n'
%s% gp.plot.map(vmaps2,linestyle=vstyle2,projection='Ortographic', plotTitle='', AdditionalCode='set title "Equator and Greenwich" offset 0,-2',projectionInit='0,0,90,90',returnCode=TRUE)
%s% gp.plot.map(c('worldmer.dat','worldpar.dat','NOAACoastline.dat'),linestyle=c(2,3,1),projection='Ortographic', plotTitle='Northern Europe', AdditionalCode='ap=100',projectionInit='60,20,10,20',returnCode=TRUE) %s% '\nunset multiplot',1)

# Albers Conical Equivalent Projection showing the difference between centering at northern versus southern latitudes.
gp.run('#set term png;set output "NOAACoastline_multi3.png"\nload "projections.gnu"\nset multiplot layout 1,2 title "Albers Conical Equivalent Projection"\n'
%s% gp.plot.map(vmaps2,linestyle=vstyle2,projection='AlbersConical', plotTitle='', AdditionalCode='set title "latitude 20 S" offset 0,-2',projectionInit='-20,0',returnCode=TRUE)
%s% gp.plot.map(vmaps2,linestyle=vstyle2,projection='AlbersConical', plotTitle='latitude 20 N', AdditionalCode='lat0=20',projectionInit='20,0',returnCode=TRUE) %s% '\nunset multiplot',1)


