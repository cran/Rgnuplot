library(Rgnuplot)

#Initialize the gnuplot handle
h1<-gp.init()

#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)

#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
#filename for a temporary path+file
tmpfile <- tempfile()

gp.getloadpath(h1)
gp.getwd(h1)
getwd()
z<-matrix(sample(1:6,6^2, replace=TRUE),6,6,byrow=FALSE)
z
gp.matrixr2gnu(z,'6x6.dat')

gp.cmd(h1,'reset
min = 0
col = 5
gridflag = 0
datfile = "6x6.dat"
tmpfile = "' %s% tmpfile %s% '"
load "fenceplot.gnu"')#

#pause R and gnuplot
gp.pause()

tmpfile <- tempfile()
gp.cmd(h1,'reset
min = 0
col = 5
gridflag = 1
datfile = "6x6.dat"
tmpfile = "' %s% tmpfile %s% '"
load "fenceplot.gnu"')

#pause R and gnuplot
gp.pause()

#close gnuplot handle
h1<-gp.close(h1)
