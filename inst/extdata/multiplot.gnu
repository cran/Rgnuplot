#set terminal postscript eps color enhanced "Helvetica" 20
#set output "multiplot1.eps" # save to this eps file
#define the center (x, y) for all the circles
Xi=2*radius; Yi=radius # implicit
Xe=radius; Ye=2*radius # explicit
Xpc=radius; Ypc=radius # parametric
Xpp=2*radius; Ypp=2*radius # polar
reset
set multiplot;set size ratio -1
#implicit plot
set contour
set cntrparam levels discrete 0
set view map
unset surface
unset key
set isosamples 1000,1000
set xrange [0:3*radius]
set yrange [0:3*radius]
set xlabel "x"
set ylabel "y"
set title "Multiple plots"
f(x,y)=(x-Xi)**2+(y-Yi)**2-radius**2
set table tmpfile
splot f(x,y)
unset table
plot tmpfile w l lt 1 lw 2 lc rgb "red" notitle
#explicit plot
set samples 30000 # increase the sampling rate of the function
plot sqrt(radius**2-(x-Xe)**2)+Ye lt 1 lw 2 lc rgb "blue" notitle
plot -sqrt(radius**2-(x-Xe)**2)+Ye lt 1 lw 2 lc rgb "blue" notitle
set samples 100
#parametric
set parametric
plot radius*cos(t)+Xpc,radius*sin(t)+Ypc lt 1 lw 2 lc rgb "green" notit
#polar plot
set polar
unset parametric
set samples 10000
r0 = sqrt(Xpp**2+Ypp**2)
t0=atan(Ypp/Xpp)
plot r0*cos(t-t0)+sqrt(radius**2-r0**2*sin(t-t0)**2) lt 1 lw 2 lc 4 notit

unset key #no label and no legend, by default
#plot a legend
if (key_flag==0) set key right; plot NaN lt 1 lw 2 lc rgb "green" title "parametric", NaN lt 1 lw 2 lc rgb "blue" title "explicit", NaN lt 1 lw 2 lc rgb "red" title "implicit", NaN lt 1 lw 2 lc 4 title "polar"
#plot text on the graphic with a line, both in color
if (key_flag==1) set label 10 "parametric" at radius/5, radius, 0 left norotate front textcolor lt 2 nopoint offset character 0, 0, 0; set label 11 "implicit" at radius*2.1,radius,  0 left norotate front textcolor lt 1 nopoint offset character 0, 0, 0; set label 12 "explicit" at radius/5,radius*2,  0 left norotate front textcolor lt 3 nopoint offset character 0, 0, 0; set label 13 "polar" at radius*1.5,radius*2,  0 left norotate front textcolor lt 4 nopoint offset character 0, 0, 0

unset multiplot
