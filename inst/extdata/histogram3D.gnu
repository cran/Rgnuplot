#3D shiny histogram
#code from Zoltán Vörös
#http://gnuplot-tricks.blogspot.fi/

unset key
unset colorbox
unset xtics; unset xlabel
unset ytics; unset ylabel
unset ztics

set ticslevel 0
set border 1+2+4+8
set parametric; set urange [0:2*pi]; set vrange [0:1]; set iso 2, 200
set table cylinder
splot cos(u), sin(u), v, cos(u)*v, sin(u)*v, 1
unset table
unset parametric


sm = 0.0
g(x,a) = (abs(x-a) < 0.1 ? 1 : 0)
h(x,a) = (x <= a ? 0.0 : 1.0)

ARRAY = "b(x, y) = 0"
SUM = "s(x,a) = 0"
PALETTE = "set palette defined (-1 0.7 0 0, -0.5 1 1 1"

array(x, c) = (sm = h($0,0.5)*sm + x, ARRAY = ARRAY.sprintf(" + g(x,%d)*h(y,%.3f)", c, sm), \
  SUM = SUM.sprintf(" + %f*g(x,%d)", x, c), x )
pal(x, c) = (PALETTE = PALETTE.sprintf(", %.1f %.3f %.3f %.3f, %.1f 1 1 1", \
      c-0.01, rand(0)*0.7, rand(0)*0.7, rand(0)*0.7, c+0.99), x)
ff(x, c) = (array(x, c), x)

colour(x,y) = 0.25*exp(-(x-0.7)**2/0.2-(y+0.7)**2/0.2)
lab(x) = (sm = sm + x, sm-0.5*x)
 
plot for [i=2:col+1] file every ::1 using 0:( ff(column(i), i) )
plot file every ::1 using 0:(pal(1, column(0))) 

eval(ARRAY)
eval(PALETTE.")")
eval(SUM)

set xrange [4:5+3*col]
set yrange [-10:3*col-9]

splot for [i=2:col+1] cylinder using ($1+3*i):2:($3*s(i,i)):(b(i,$3*s(i,i))+colour($1,$2)) with pm3d, \
for [i=2:col+1] file every ::0::0 using (3*i):(0):(s(i,i)+5e3):(sprintf("%d", s(i,i))) w labels, \
sm = 0, file using (3*col+4):(1):(lab($5)):1 w labels left, \
for [i=2:col+1] file every ::0::0 using (3*i):(-2):(0):(stringcolumn(i)) w labels right rotate by 30
