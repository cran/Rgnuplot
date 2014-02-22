library(Rgnuplot)
gp.run('k=0
bind Home "k=k+1; replot"
plot sin(x+k)',TRUE)

gp.run('bind "p" "set terminal png;set output \'00000.png\';replot;set terminal wxt"
plot sin(x)',TRUE)

gp.run('bind "p" "n=strftime(\'%d.%b.%Y-%H.%M.%.3S.png\',time(0.0));set terminal png;set output n;replot;set terminal wxt"
plot sin(x)',TRUE)

