require(Rgnuplot)
#based on the example from library gplots
data(state)
tmp   <- split(state.area, state.region)
means <- sapply(tmp, mean)
stdev <- sqrt(sapply(tmp, var))
n     <- sapply(tmp,length)
ciw   <- qt(0.975, n) * stdev / sqrt(n)
    
#Initialize the gnuplot handle
h1<-gp.init()
#set gnuplot's additional search directories, to the extdata directory from Rgnuplot (default)
gp.setloadpath(h1)

#change gnuplot's working directory to be the same as R's working directory (default)
gp.setwd(h1)

tmpfile<-tempfile()
xtic <- ''
gplabelmean <- ''
gplabeln <- ''
for (h in 1:4)
{
#gpdata <- gpdata %s% h %s% ' ' %s% means[h] %s% ' ' %s% (means[h]-ciw[h]) %s% ' ' %s% (means[h]+ciw[h]) %s% '\n'
cat(h , ' ' , means[h] , ' ' , (means[h]-ciw[h]) , ' ' , (means[h]+ciw[h]) , '\n', file = tmpfile,append=TRUE)
xtic <- xtic %s% '"' %s% names(tmp)[h] %s% '" ' %s% h 
if (h<4)xtic <- xtic %s% ','
gplabelmean <- gplabelmean  %s% 'set label ' %s% h %s% ' "' %s% round(means[h],-3) %s% '" at ' %s% h %s% ',' %s% means[h] %s% ' nopoint  tc rgb "red"\n'
gplabeln <- gplabeln  %s% 'set label ' %s% h %s% ' "n=' %s% n[h] %s% '" at ' %s% h %s% ',' %s% 4000 %s% ' nopoint  tc rgb "blue"\n'
}

#error box, constant width
gp.cmd(h1, 'reset
#set terminal png;set output "errorbox.png"
set xrange [0:5]
set yrange [ 0:250000]
set xtics (' %s% xtic %s% ')
plot "' %s% tmpfile %s% '" u 1:2:3:4:(0.2) with boxerror lc rgb "black" tit "Area per state"')

#pause R and gnuplot
gp.pause()

#error bars, mean values and a line
gp.cmd(h1, 'reset
#set terminal png;set output "errorbar1.png"
set xrange [0:5]
set yrange [ 0:250000]
set xtics (' %s% xtic %s% ')
set xtics out
set ytics out
' %s% gplabelmean %s% '
plot "' %s% tmpfile %s% '" with errorbars tit "Area per state", "' %s% tmpfile %s% '" w l notit')

#pause R and gnuplot
gp.pause()

#error bars, mean values, a line and more labels
gp.cmd(h1, 'reset
#set terminal png;set output "errorbar2.png"
set xrange [0:5]
set yrange [ 0:250000]
set xtics (' %s% xtic %s% ')
set xtics out
set ytics out
set xlabel "Region"
set ylabel "Area"
' %s% gplabeln %s% '
plot "' %s% tmpfile %s% '" with errorbars tit "Area per state", "' %s% tmpfile %s% '" w l notit')

#pause R and gnuplot
gp.pause()

#close gnuplot handles
h1<-gp.close(h1)
