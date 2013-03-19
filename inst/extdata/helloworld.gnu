#set terminal postscript eps color;set output "helloworld.eps"
# hello world in gnuplot
set xlabel "x"
set ylabel "y"
set title "Hello World!"
plot sin(x)
pause -1 "Press any key to continue"
