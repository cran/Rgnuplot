require(Rgnuplot)
#"Hello World!" - loading a script directly from gnuplot
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)
#load the script
gp.cmd(h1,'load "helloworld.gnu"')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
