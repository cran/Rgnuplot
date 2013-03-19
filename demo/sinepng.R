require(Rgnuplot)
#saving a plot to a PNG file (from gp.i examples)
#Initialize the gnuplot handle
h1<-gp.init()
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
gp.cmd(h1, 'set terminal png')
gp.cmd(h1, 'set output "sine.png"')
gp.plot.equation(h1, 'sin(x)', 'Sine wave')
#close gnuplot handles
g<-gp.close(h1)

