set title "Short Laser Pulse"
set xlabel "Time [fs]"
set ylabel "Amplitude [arb. units]"
set sample 1000
#set size 0.6,0.6
set xrange [-pi:pi]
plot "slaserpulse.dat" with xyerror title "Experiment"\
,cos(x*10)*exp(-x*x) title "Amplitude"\
,exp(-x*x) title "Envelope"

