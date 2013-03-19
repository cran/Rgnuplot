library(Rgnuplot)

#create a matrix for the tests - values 0, 1 and 2 in 3x3 blocks of 10x5 numbers 012 120 201 RGB GBR BRG
ColorMatrix<-rbind(matrix(rep(0:2,each=10,times=5),ncol=30,byrow=TRUE),
matrix(rep(c(1,2,0),each=10,times=5),ncol=30,byrow=TRUE),
matrix(rep(c(2,0,1),each=10,times=5),ncol=30,byrow=TRUE))
gp.matrixr2gnu(ColorMatrix,'3colors.dat') # save the matrix

# 2D heatmap with data from a file, colorbox with color gradient
gp.run( '#set terminal png;set output "2Dheatmapv1.png"
set view map; set size square;set yrange [] reverse
set palette defined (0 "red", 1 "green",  2 "blue" )
splot [0:30][0:15] "3colors.dat" matrix with image notitle',TRUE)


# 2D heatmap, the colors blend when there is a color transition, colorbox with color gradient
gp.run( '#set terminal png;set output "2Dheatmapv2.png"
set view map; set size square;set yrange [] reverse
set palette defined (0 "red", 1 "green",  2 "blue" )
splot [0:30][0:15] "3colors.dat" matrix with pm3d notitle',TRUE)


# colorbox with color gradient and plot with solid colors
gp.run( '#set terminal png;set output "2Dheatmapv3.png"
set view map; set size square;set yrange [] reverse
set palette defined (0 "red", 1 "green",  2 "blue" )
set pm3d corners2color c1
splot [0:30][0:15] "3colors.dat" matrix w pm3d notitle',TRUE)


# Defining the palette through a file, colorbox with color gradient and plot with solid colors
gp.run( 'set view map; set size square;set yrange [] reverse
set palette model RGB file "-"
1 0 0
0 1 0
0 0 1
e
set pm3d corners2color c1
splot [0:30][0:15] "3colors.dat" matrix w pm3d notitle',TRUE)


# colorbox with solid colors, both plot and colorbox show solid colors
gp.run( '#set terminal png;set output "2Dheatmapv4.png"
set view map; set size square;set yrange [] reverse
set palette defined ( -1 "red", 0 "red", 0 "green", 1 "green", 1 "blue", 2 "blue" )
set pm3d corners2color c1
splot [0:30][0:15] "3colors.dat" matrix w pm3d notitle',TRUE)


# Defining the palette through a file, both plot and colorbox show solid colors
gp.run( 'set view map; set size square;set yrange [] reverse
set palette model RGB file "-"
-1 1 0 0
0 1 0 0
0 0 1 0
1 0 1 0
1 0 0 1
2 0 0 1
e
set pm3d corners2color c1
splot [0:30][0:15] "3colors.dat" matrix w pm3d notitle',TRUE)


#saving the palette with color gradient
gp.matrix2palette(c(1,0,0,0,1,0,0,0,1), '3colors.pal')
#saving the palette with solid colors
gp.matrix2palette(c(1,0,0,0,1,0,0,0,1), '3colorsSolid.pal',SolidColor=TRUE)

# Hide the colorbox and fill the gaps at the edges of the plot
gp.matrixfile.pad("3colors.dat","3colorsb.dat")#duplicates the last column and row on the matrix data file
gp.run( '#set terminal png;set output "2Dheatmapv7.png"
set view map; set size square;set yrange [] reverse
unset colorbox
set palette model RGB file "3colors.pal"
set pm3d corners2color c1
splot [0:30][0:15] "3colorsb.dat" matrix w pm3d notitle',TRUE)


#create a random matrix and plot it
n<-15
z<-matrix(sample(0:n,n^2, replace=TRUE),n,n,byrow=FALSE)
z
gp.matrixr2gnu(z,'randomMtrx.dat')
gp.matrixfile.pad("randomMtrx.dat","randomMtrxb.dat")
gpcolornames<-gp.show.palette.colornames()
randndx<-sample(1:dim(gpcolornames)[1],(n+1))
randcolor<-as.matrix(gpcolornames[randndx,c('R','G','B')])
gp.matrix2palette(c(t(randcolor)), 'nrandcolorsSolid.pal',SolidColor=TRUE)
gp.run( '#set terminal png;set output "2Dheatmapv8.png"
set view map; set size square;set yrange [] reverse
set palette model RGB file "nrandcolorsSolid.pal" u ($4):($1/255):($2/255):($3/255)
set pm3d corners2color c3
splot [0:' %s% n %s% '][0:' %s% n %s% '] "randomMtrxb.dat" matrix w pm3d notitle',TRUE)


#creating a matrix with the full color RGB values of blutux.png
gpfile <- system.file('extdata/blutux.rgb', package='Rgnuplot')
if (!file.exists('blutux.rgb')) file.copy(gpfile,getwd())
if (!file.exists('blutux.png')) gp.RGB2image('blutux.rgb','blutux.png',128,128)# convert from raw RGB to PNG

PNGdata<-gp.PNG2color('blutux.png')#get the color matrix from a PNG file
str(PNGdata)
gp.matrixr2gnu(PNGdata,'blutuxRGBfullColorMatrix.dat')#save the color matrix to a file
gp.matrix2XYdata('blutuxRGBfullColorMatrix.dat','blutuxRGBfullColorXYdata.dat')#create an XY file from the color matrix file

#plot an image stored in a text datafile in XY format, with full color RGB - with points
gp.run('#set terminal pngcairo;set output "blutuxRGBfullColor1.png"
set view map; set size square;set yrange [] reverse
plot [1:128][1:128] "blutuxRGBfullColorXYdata.dat" u 2:1:3:($3) w p pt 5 ps 1 lc rgb var notit',TRUE)


#plot an image stored in a text datafile in XY format, with full color RGB  - with image
gp.run('#set terminal pngcairo;set output "blutuxRGBfullColor2.png"
reset; set size square;set yrange [] reverse
unset key;unset border;unset xtics;unset ytics
plot [1:128][1:128] "blutuxRGBfullColorXYdata.dat" u 2:1:($3/65536):((int($3) & 65280)/256):(int($3) & 255) w rgbimage notit',TRUE)

#plot an image stored in a text datafile in matrix format, with full color RGB
gp.run('set size square;set yrange [] reverse;
plot "blutuxRGBfullColorMatrix.dat" u 1:2:($3/65536):((int($3) & 65280)/256):(int($3) & 255) matrix w rgbimage notit',TRUE)


#plot an image stored in a text datafile in matrix format, with the default palette
gp.run('#set terminal pngcairo;set output "blutuxRGBfullColor3.png"
set size square;set yrange [] reverse;plot "blutuxRGBfullColorMatrix.dat" matrix w image notit',TRUE)

gpfile <- system.file('extdata/blutuxwithpalette.png', package='Rgnuplot')
if (!file.exists('blutuxwithpalette.png')) file.copy(gpfile,getwd())
PNGdata256<-gp.PNG2color('blutuxwithpalette.png')#get the color matrix from an indexed PNG file
unique(c(PNGdata256)) #236
paletteRGB<-gp.CreatePaletteFromMatrix(PNGdata256)#create a palette
paletteRGB<-c(paletteRGB,rep(0,19))
if (file.exists('blutuxwithpalette.pal')) file.remove('blutuxwithpalette.pal')
gp.RGB1to3channels(paletteRGB,fileRGB3channel='blutuxwithpalette.pal')#save the palette to a file with separated RGB components
gp.palette.plot('blutuxwithpalette.png','GIMP')#show the palette from the PNG file
PNGdataIndexed<-gp.CreateIndexFromMatrixAndPalette(PNGdata256, paletteRGB)#create an indexed color matrix
gp.matrixr2gnu(PNGdataIndexed,'blutuxwithpalette.dat')#save the indexed color matrix to a file
# plot an image stored in a text datafile in matrix format, with its own palette
max(PNGdataIndexed)
gp.run('#set terminal pngcairo;set output "blutuxwithpalette1.png"
set view map; set size square;set yrange [] reverse
set cbrange [0:254]
set palette model RGB file "blutuxwithpalette.pal" u ($1/255):($2/255):($3/255)
splot "blutuxwithpalette.dat" matrix w image notit',TRUE)


if (!file.exists('blutux.png')) gp.RGB2image(system.file('extdata/blutux.rgb', package='Rgnuplot'),'blutux.png',128,128)
testmap<-'blutux'#tuxgnu file to be mapped
#gp.image.resize(testmap %s% '0.png',testmap %s% '256.png',256,128)
PNGdata<-gp.PNG2color(testmap %s% '.png')#get the color matrix
unique(c(PNGdata)) # 418 different colors
paletteRGBx<-gp.CreatePaletteFromMatrix(PNGdata)#create a palette
gp.RGB1to3channels(paletteRGBx,fileRGB3channel='blutux.pal')#save the palette to a file with separated RGB components
PNGdataIndexedx<-gp.CreateIndexFromMatrixAndPalette(PNGdata, paletteRGBx)#create an indexed color matrix
#str(PNGdataIndexed)
gp.matrixr2gnu(PNGdataIndexedx,'blutux.dat')#save the indexed color matrix to a file
gp.run('#set terminal pngcairo;set output "blutuxwithpalette2.png"
set view map; set size square;set yrange [] reverse
set cbrange [0:' %s% (length(unique(c(PNGdata)))-1) %s% ']
set palette model RGB file "blutux.pal" u ($1/255):($2/255):($3/255)
splot "blutux.dat" matrix w image notit',TRUE)


#using a GIMP palette on an indexed PNG, color effects are possible with cbrange
gp.run('set view map;set size ratio -1;set lmargin 0;set rmargin 0;set tmargin 0;set bmargin 0;unset key;unset tics;unset border;set yrange [] reverse
set palette model RGB file "blutuxwithpalettePNG.gpl" every ::5 u ($1/255):($2/255):($3/255)
set cbrange [0:255]
splot "blutuxwithpalette.dat" matrix w image notit
',TRUE)

#splot  "blutuxwithpalette.png" binary filetype=png w rgbimage notitle


#using a palette on an indexed PNG with pm3d, notice the complexity of the palette on the colorbox
gp.run('#set terminal pngcairo;set output "blutuxwithpalette3.png"
set view map;
set size ratio -1;set lmargin 0;set rmargin 0;set tmargin 0;set bmargin 0;unset key;unset tics;unset border;set yrange [] reverse
set palette model RGB file "blutuxwithpalette.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:254]
set pm3d corners2color c1
splot "blutuxwithpalette.dat" matrix with pm3d notitle',TRUE)


# plot Tux with palette into a hemisphere
gp.run('#set terminal pngcairo;set output "blutuxwithpalette4.png"
set angles degrees
unset colorbox
set parametric
set isosamples 11,11
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ]
set vrange [ 0.00000 : 360.000 ]
set hidden3d back
set view equal xyz
set view 86,86,1,1
set palette model RGB file "blutuxwithpalette.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:254]
set pm3d corners2color c1
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "blutuxwithpalette.dat" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit',TRUE)

# plot Tux with palette into a hemisphere XY file
gp.matrix2XYdata('blutuxwithpalette.dat','blutuxwithpaletteXY.dat')
gp.run('set angles degrees
unset colorbox
unset tics
unset border
set parametric
set isosamples 11,11
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
set urange [ -90.0000 : 90.0000 ]
set vrange [ 0.00000 : 360.000 ]
set hidden3d back
set view equal xyz
set view 80,80,2,2
set palette model RGB file "blutuxwithpalette.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:254]
set pm3d corners2color c1
splot cos(u)*cos(v),cos(u)*sin(v),sin(u) w l lc rgb "grey" notit, "blutuxwithpaletteXY.dat" u (($2-64)/128*180):(-($1-64)/128*180):(1):3 w pm3d notit',TRUE)



#plotting an RGB image as RGB or RGBA returns the same output because the alpha channel is considered zero for all pixels, all colors are opaque.

# download an image of the GNU mascot from Wikipedia
gnuimg <-'500px-Heckert_GNU_white.png'
download.file('http://upload.wikimedia.org/wikipedia/en/thumb/2/22/Heckert_GNU_white.svg/500px-Heckert_GNU_white.svg.png',gnuimg)
# the image has an alpha channel, if ignored then the background on the transparent area becomes black
gp.image.plot(gnuimg)
#  if the alpha channel is removed then the background on the transparent area becomes white
gp.image.plot(gnuimg,TRUE)
# plot the image with a red background
gp.image.plot(gnuimg,TRUE,'red')
# create a new image with green background
gp.image2PNG(gnuimg,'gnugreen.png',FALSE,TRUE,'green')
# resize the image to 128x128
gp.image.resize('gnugreen.png','gnu.png',128,128)
# tile 2 images
gp.image.tile('tuxgnu.png',matrix(c('blutux.png','gnu.png'),2,1),c(128,128),c(128))
gp.image.plot('tuxgnu.png')

testmap<-'tuxgnu'# file to be mapped
#gp.image.resize(testmap %s% '0.png',testmap %s% '256.png',256,128)
PNGdata<-gp.PNG2color(testmap %s% '.png')#get the color matrix
paletteRGBx<-gp.CreatePaletteFromMatrix(PNGdata)#create a palette
NpaletteColors<-length(paletteRGBx)-1 # number of palette colors starting from zero
gp.RGB1to3channels(paletteRGBx,fileRGB3channel=testmap %s% '.pal')#save the palette to a file with separated RGB components
PNGdataIndexedx<-gp.CreateIndexFromMatrixAndPalette(PNGdata, paletteRGBx)#create an indexed color matrix
#str(PNGdataIndexed)
gp.matrixr2gnu(PNGdataIndexedx,testmap %s% '.dat')#save the indexed color matrix to a file

# plot 6 views of the sphere
gp.run('set angles degrees
unset colorbox
unset border
unset xtics
unset ytics
unset ztics
set parametric
set isosamples 11,11
set mapping spherical
set yzeroaxis linetype 0 linewidth 1.000 
#set hidden3d back
set view equal xyz
set palette model RGB file "tuxgnu.pal" u ($1/255):($2/255):($3/255)
set cbrange[0:' %s% NpaletteColors %s% ']
set pm3d corners2color c1
set multiplot layout 2,3
set view 360,0,2,2
splot "tuxgnu.dat" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
set view 180,0,2,2
splot "" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
set view 91,90,2,2
splot "" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
set view 89,270,2,2
splot "" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
set view 93,0,2,2 #87,0,2,2
splot "" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
set view 87,180,2,2
splot "" matrix u (($1-64)/128*180):(-($2-64)/128*180):(1):3 w pm3d notit
unset multiplot',TRUE)

