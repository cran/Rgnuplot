library(Rgnuplot)

#Initialize the gnuplot handle
h1<-gp.init()

#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)

#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)

#filename for a temporary path+file
tmpfile<-tempfile()



#load the histogram3D script, set the filenames and number of rows and columns
gp.cmd(h1,'reset
file = "immigr5.dat"
cylinder = "' %s% tmpfile %s% '"
col = 4
row = 5
load "histogram3D.gnu"')

#pause R and gnuplot
gp.pause()

#close gnuplot handle
h1<-gp.close(h1)
