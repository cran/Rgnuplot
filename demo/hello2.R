require(Rgnuplot)
#Rgnuplot's "Hello World!" - inline gnuplot
#Initialize the gnuplot handle
h1<-gp.init()
#send gnuplot commands
gp.cmd(h1,'set xlabel "x"
set ylabel "y"
set style "line"
set title "Hello World!"
plot sin(x)')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
