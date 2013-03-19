library(Rgnuplot)
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#create the fractal data from gnuplot
gp.cmd(h1,'reset
complex(x,y) = x*{1,0}+y*{0,1}
mandel(x,y,z,n) = (abs(z)>2.0 || n>=10) ? n : mandel(x,y,z*z+complex(x,y),n+1)
set isosamples 50,50
set samples 30,30
set xrange [-1.5:0.5]
set yrange [-1:1]
set logscale z
set hidden3d
set table "mandel.dat"
splot mandel(x,y,{0,0},0) notitle
unset table')
#plot the fractal data on 3D
gp.cmd(h1,'#set terminal png;set output "fractal1.png"
reset
splot "mandel.dat" w  pm3d notitle')
#plot the fractal data with a heat map
gp.cmd(h1,'#set terminal png;set output "fractal2.png"
reset
set pm3d map
splot "mandel.dat" w  pm3d notitle')
#plot the fractal data with a contour plot
gp.cmd(h1,'reset
unset surface
set contour
set pm3d map
unset key
splot "mandel.dat" w  pm3d notitle')
#create the fractal data from R calling an R function
mandel<-function(x,y,z,n) if ((abs(z)>2.0) | (n>=10)) n else mandel(x,y,z*z+complex(2,x,y),n+1)
mandelxy1<-function(x,y) mandel(x,y,c(0,0),0)
gp.R2splot(mandelxy1,'mandel2.dat',c(-1.5,0.5),c(-1,1),c(50,50),c(30,30),TRUE)
gp.cmd(h1,'reset
splot "mandel2.dat" w  pm3d notitle')
#create the fractal data from R calling a C function
mandelxy2<-function(x,y) gp.mandel(x,y,c(0,0),0,10)
gp.R2splot(mandelxy2,'mandel3.dat',c(-1.5,0.5),c(-1,1),c(50,50),c(30,30),TRUE)
gp.cmd(h1,'reset
splot "mandel3.dat" w  pm3d notitle')
#create the fractal data from R calling a C function, with more points and more iterations
mandelxy2<-function(x,y) gp.mandel(x,y,c(0,0),0,1000)
gp.R2splot(mandelxy2,'mandel4.dat',c(-1.5,0.5),c(-1,1),c(500,500),c(300,300),TRUE)
gp.cmd(h1,'reset
splot "mandel4.dat" w  pm3d notitle')
#plot the fractal data with a heat map
gp.cmd(h1,'#set terminal png;set output "fractal3.png"
reset
set pm3d map
splot "mandel4.dat" w  pm3d notitle')
#pause R and gnuplot
gp.pause()
#close gnuplot handles
h1<-gp.close(h1)


