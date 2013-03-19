require(Rgnuplot)
# "Hello World!" - using gp.plot.equation
h1 <- gp.init()#Initialize the gnuplot handle
gp.plot.equation( h1, 'sin( x )', 'Hello World!' )
gp.pause() # pause R and gnuplot
h1<-gp.close(h1) # close gnuplot handles
