library(Rgnuplot)

# download an image of a windrose from Wikipedia
download.file('http://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Brosen_windrose.svg/500px-Brosen_windrose.svg.png','windrose.png')
#the image seems to have a black background, however the background is transparent because this image is RGBA (RGB+alpha channel)
gp.image.plot('windrose.png')
#the "alpha" parameter will show the image correctly
gp.image.plot('windrose.png',TRUE)
#by converting from RGBA to RGB, the transparent background is replaced by a white one
gp.image2PNG('windrose.png','windrose2.png',alpha=TRUE)
#now the background is white
gp.image.plot('windrose2.png')

if (!file.exists('blutux.png')) { file.copy(system.file('extdata/blutux.rgb', package='Rgnuplot'),getwd()); gp.RGB2image('blutux.rgb','blutux.png',128,128)}
gp.image.rgbfiltercolor.sepia('blutux.png','blutuxsepia.png')
gp.image.rgbgreyscaleBT709('blutux.png','blutuxgreyscaleBT709.png')
gp.image.rgbfalsecolor('blutux.png','blutuxfalsecolor.png')
#make an image lighter by increasing all of the RGB channel values by 50%, limit the values to 255
gp.image.rgbchange('blutux.png','blutuxlighter.png','PNG',NULL,'(1.5*r>255)?255:(1.5*r)','(1.5*g>255)?255:(1.5*g)','(1.5*b>255)?255:(1.5*b)')
#create an image from tiling other images
gp.image.tile('tux4x4.png',matrix(c('blutuxsepia.png','blutuxgreyscaleBT709.png','blutuxfalsecolor.png','blutuxlighter.png'),2,2),c(128,128),c(128,128))
gp.image.plot('tux4x4.png') # gp.image.plot('tux4x4.png',filetype='PNG')
