library(Rgnuplot)

#Initialize the gnuplot handle
h1<-gp.init()
#use a seed for reproducibility
set.seed(0)
nxpoints<-10 #number of x points to plot
nypoints<-npoints+sample.int(nxpoints, size = 1)# add a random number from [1, nxpoints]
xpoints<-sort(sample.int(nxpoints, size = nypoints, replace=TRUE))
ypoints<-trunc(rnorm(nypoints,mean=1,sd=3)) #generate random points and truncate them
strgnu<-'\n' %s% paste(xpoints,ypoints,sep='\t',collapse='\n') %s% '\ne'
gp.cmd(h1,'#set terminal png;set output "interpolation2.png"
reset
set xrange [0:' %s% (npoints+1) %s% ']
set yrange [' %s% (min(ypoints)-1) %s% ':' %s% (max(ypoints)+1) %s% ']
set key top center # positions the legend
set multiplot
set size ratio -1
plot "-" notit with points' %s% strgnu)
gp.cmd(h1,'plot "-" smooth csplines notit  w l lc 2' %s% strgnu)
gp.cmd(h1,'plot "-" smooth bezier notit  w l lc 3' %s% strgnu)
gp.cmd(h1,'plot "-" smooth unique notit  w l lc 4' %s% strgnu)
gp.cmd(h1,'plot "-" smooth frequency notit  w l lc 5' %s% strgnu)
gp.cmd(h1,'plot "-" smooth sbezier notit  w l lc 6' %s% strgnu)
gp.cmd(h1,'plot "-" smooth acsplines notit  w l lc 7' %s% strgnu)
gp.cmd(h1,'plot NaN notit,  NaN tit "splines", NaN tit "bezier", NaN tit "unique", NaN tit "frequency", NaN tit "sbezier", NaN tit "acsplines"')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
