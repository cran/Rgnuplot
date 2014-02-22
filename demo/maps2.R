library(Rgnuplot)
library(maps)
library(maptools)

#saving a map from package "maps" with Mercator projection
map('world', projection = 'mercator')
if (!file.exists('worldRmapMercator.dat'))
{
gp.mapsr2gnu(map('world', projection = 'mercator',plot=FALSE),'worldRmapMercator.dat')
}
gp.run('unset key; unset tics
plot "worldRmapMercator.dat" w l lc rgb "black"',TRUE)

if (!file.exists('ne_110m_coastline.dat'))
{
# converting a world map from SHP to a data file readable by gnuplot
#download from http://www.naturalearthdata.com/downloads/
#ne_110m_coastline.zip only 84 kilobytes
if (!file.exists('ne_110m_coastline.zip')) download.file('http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_coastline.zip','ne_110m_coastline.zip', method = 'wget')
if (file.info('ne_110m_coastline.zip')$size==0) stop('Please download http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/physical/ne_110m_coastline.zip')
unzip('ne_110m_coastline.zip', exdir = "ne_110m_coastline")
world.shp <- readShapeLines('ne_110m_coastline/ne_110m_coastline.shp', proj4string=CRS("+proj=longlat"))
gp.SHP2gnu('ne_110m_coastline','ne_110m_coastline','ne_110m_coastline.dat') # it's already WGS84
plot(world.shp)
}
gp.run('#set term png;set output "naturalearthdata_1.png"
plot "ne_110m_coastline.dat" w l lc rgb "black"',TRUE)

if (!file.exists('worldpar.dat')) gp.map.merpar('worldpar.dat','worldmer.dat',10,10)
gp.run('#set term png;set output "naturalearthdata_2.png"
unset key; unset tics;unset border
plot "ne_110m_coastline.dat" w l lc rgb "black", "worldpar.dat"  w l lc rgb "grey", "worldmer.dat"  w l lc rgb "grey"',TRUE)

# convert the shapefile with Tissot's indicatrices to a data file format
# using the shapefile from Matthew T. Perry 2005, Tissot Indicatrix - Examining the distortion of map projections http://blog.perrygeo.net/2005/12/11/tissot-indicatrix-examining-the-distortion-of-2d-maps/
tissfiles<-dir(system.file(package='Rgnuplot')  %s% '/extdata',pattern='tissot')
if (!all(file.exists(tissfiles))) file.copy(system.file(paste('extdata/', tissfiles,sep=''), package='Rgnuplot'),getwd())
gp.SHP2gnu('.','tissot','tissot.dat')

if (!file.exists('NOAACoastline.dat'))
{
download.file('http://www.ngdc.noaa.gov/mgg/coast/tmp/13777.dat','NOAA Coastline Data.dat', method = 'wget')
if (!file.exists('NOAA Coastline Data.dat')) stop('Please download WCL(World Coast Line) from http://www.ngdc.noaa.gov/mgg_coastline/ and save it as "NOAA Coastline Data.dat"')
gp.run('!awk \'{gsub(/>/,"")}1\' "NOAA Coastline Data.dat" >NOAACoastline.dat',FALSE)

}

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


# download the Cloudless Earth (Day) image file from NASA
if (!file.exists('earth_day.jpg')) download.file('http://nssdc.gsfc.nasa.gov/planetary/image/earth_day.jpg','earth_day.jpg')
testmap<-'earth_day'
if (!file.exists(testmap %s% '.png'))
{
print('Please wait, this might take some time.')
#gp.image2PNG(testmap %s% '.jpg',testmap %s% '.png') # convert from JPEG to PNG
gp.image.resize(testmap %s% '.jpg',testmap %s% '.png', 500,250 ) #reduce the size to 1/4 (1000,500  1/2 250,125 1/8)
}
PNGdata2<-gp.PNG2color(testmap %s% '.png')#get the color matrix from the PNG file
Mheight<-dim(PNGdata2)[1]
Mwidth<-dim(PNGdata2)[2]
paletteRGB<-gp.CreatePaletteFromMatrix(PNGdata2)#create a palette
NpaletteColors<-length(paletteRGB)-1 # number of palette colors starting from zero
if (!file.exists(testmap %s% '.pal'))
{
gp.RGB1to3channels(paletteRGB,fileRGB3channel=testmap %s% '.pal') # save the palette to a file with separated RGB components
}
PNGdataIndexed<-gp.CreateIndexFromMatrixAndPalette(PNGdata2, paletteRGB) # create an indexed color matrix
if (!file.exists(testmap %s% 'matrixndx.dat'))
{
print('Please wait, this might take some time.')
gp.matrixr2gnu(PNGdataIndexed,testmap %s% 'matrixndx.dat') # save the indexed color matrix to a file
}
NpaletteColors<-length(paletteRGB)-1 # number of palette colors starting from zero
# using splot to plot a 2D map from a data file in XY format
if (!file.exists(testmap %s% 'XYndx.dat'))
{
gp.matrix2XYdata(testmap %s% 'matrixndx.dat',testmap %s% 'XYndx.dat') # create an XY file from the matrix file 
}
if (!file.exists('earth_dayXYcoords.dat'))
{
# convert the coordinates and save to a new file
gp.XYcoords.convert.fun('earth_dayXYndx.dat','earth_dayXYcoords.dat',function(y) -(y/Mheight*180-90),function(x) (x/Mwidth*360-180),TRUE)
}

# create meridian and parallel lines for splot
if (!file.exists('worldparS15.dat')) gp.map.merpar('worldparS15.dat','worldmerS15.dat',15,15,TRUE)
if (!file.exists('worldparS20.dat')) gp.map.merpar('worldparS20.dat','worldmerS20.dat',20,20,TRUE)
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


