library(Rgnuplot)
#generate the random walk data, 1000 observations of X data for 10 experiments
#use a seed for reproducibility
set.seed(0)
lenW<-1000
matRandW<-matrix(0,ncol=lenW,nrow=10)
matRandW<-apply(matRandW,2,function(x) sample(c(-1,1), size = 10, replace =TRUE))
dim(matRandW)
for (n in 1:10)
{
plot(1:lenW,cumsum(matRandW[n,]),col=n, type='l',ylim=c(-50,50))
par(new=TRUE)
}
write.table(t(matRandW), file = "randwalk10x1000.dat", sep = "\t",row.names =FALSE, col.names =FALSE, quote =FALSE)

#Initialize the gnuplot handle
h1<-gp.init()

#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)

#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)

gp.cmd(h1,'#set terminal png;set output "randomwalk1d1.png"
set xlabel "Time"
set ylabel "Direction"
set tit \"Random walk 1D\";plot \"randwalk10x1000.dat\" using 1 s cumul w l notit,\"randwalk10x1000.dat\" using 2 s cumul w l notit, \\
\"randwalk10x1000.dat\" using 3 s cumul w l notit,\"randwalk10x1000.dat\" using 4 s cumul w l notit,\\
\"randwalk10x1000.dat\" using 5 s cumul w l notit,\"randwalk10x1000.dat\" using 6 s cumul w l notit,\\
\"randwalk10x1000.dat\" using 7 s cumul w l notit,\"randwalk10x1000.dat\" using 8 s cumul w l notit,\\
\"randwalk10x1000.dat\" using 9 s cumul w l notit,\"randwalk10x1000.dat\" using 10 s cumul w l notit')
#pause R and gnuplot
gp.pause()
#close gnuplot handle
h1<-gp.close(h1)
