require(Rgnuplot)
#"Hello World!" - text on caption
#Initialize the gnuplot handle
h1<-gp.init()
#naming the axis
gp.set.xlabel(h1, 'x')
gp.set.ylabel(h1, 'y')
#set plot style to "lines"
gp.setstyle(h1, 'lines')
#add a caption
gp.cmd(h1,'set title "Hello World!"')
#plot sin(x)
gp.plot.equation(h1,'sin(x)','')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
