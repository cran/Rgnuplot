library(Rgnuplot)
#create gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#load the gnuplot script
#gp.cmd(h1, 'set terminal png;set output "errorbar3.png";load "fitlaser.gnu"')
gp.cmd(h1, 'load "fitlaser.gnu"')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)