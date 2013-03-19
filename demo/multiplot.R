require(Rgnuplot)
#Plot implicit, explicit and parametric equations
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#filename for a temporary path+file
tmpfile<-tempfile()
tmpfile2<-tempfile()
tmpfile3<-tempfile()
#define the circle's radius
radius <- 5
#load the multiplot script, key_flag zero => legend 
gp.cmd(h1,'radius=' %s% radius %s% ';key_flag=0; tmpfile="' %s% tmpfile %s% '"; load "multiplot.gnu"')
gp.pause()#pause R and gnuplot
#load the multiplot script, key_flag one => labels
gp.cmd(h1,'radius=' %s% radius %s% ';key_flag=1; tmpfile="' %s% tmpfile2 %s% '"; load "multiplot.gnu"')
gp.pause()#pause R and gnuplot
#load the multiplot script, key_flag !={1, 3} => no labels and no legend
gp.cmd(h1,'radius=' %s% radius %s% ';key_flag=2; tmpfile="' %s% tmpfile3 %s% '"; load "multiplot.gnu"')
gp.pause()#pause R and gnuplot
#close gnuplot handle
h1<-gp.close(h1)
