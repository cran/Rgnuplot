require(Rgnuplot)

#Initialize the gnuplot handle
h1<-gp.init()
#use a seed for reproducibility
set.seed(0)
#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)
npoints<-10 #number of points to plot
randomPoints<-rnorm(npoints,mean=1,sd=3) #generate random points
strgnu<-'\n' %s% paste(1:npoints,randomPoints,sep='\t',collapse='\n') %s% '\ne'
gp.cmd(h1,'#set terminal png;set output "interpolation1.png"
reset
set xrange [0:' %s% (npoints+1) %s% ']
set yrange [' %s% (min(randomPoints)-1) %s% ':' %s% (max(randomPoints)+1) %s% ']
set key top center
set multiplot
set size ratio -1
plot "-" notit with points' %s% strgnu)
gp.cmd(h1,'plot "-" smooth csplines notit  w l lc 2' %s% strgnu)
gp.cmd(h1,'plot "-" smooth bezier notit  w l lc 3' %s% strgnu)
gp.cmd(h1,'plot NaN notit,  NaN tit "splines", NaN tit "bezier"')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
