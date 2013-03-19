require(Rgnuplot)
#"Hello World!" - loading and executing a gnuplot script from Rgnuplot
#Initialize the gnuplot handle
h1<-gp.init()

#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)

#the filename has Rgnuplot's extdata path
gpfile <- system.file(package='Rgnuplot') %s% '/extdata/helloworld.gnu'

#load script into a string
s<-gp.file2string(gpfile)
#send gnuplot commands
gp.cmd(h1,s)
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
