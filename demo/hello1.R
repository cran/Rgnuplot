require(Rgnuplot)
#"Hello World!" - text on legend
#Initialize the gnuplot handle
h1<-gp.init()
#set output to a postscript file
#gp.cmd(h1,'set terminal postscript eps color;set output "helloworld1.eps"')
#label the x and y axis
gp.set.xlabel(h1, 'x')
gp.set.ylabel(h1, 'y')
#set plot style to "lines"
gp.setstyle(h1, 'lines')
#plot sin(x) and add a legend
gp.plot.equation(h1,'sin(x)','Hello World!')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
