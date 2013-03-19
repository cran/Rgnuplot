#fence plots
#code from Zoltán Vörös
#http://gnuplot-tricks.blogspot.fi/
reset
unset key
unset colorbox
set ytics offset 0,-1
set ticslevel 0

DATA = ""
DATA2 = ""
PALETTE = "set palette defined ("

pr(x, y) = sprintf("%f %f\n", x, y)
zero_line(x, y) = DATA.sprintf("\n").DATA2.sprintf("\n%f %f\n", x, y)
zero_pal(x) = sprintf("%d %.3f %.3f %.3f", x, rand(0), rand(0), rand(0))

f(x, y) = ($0 == 0 ? (DATA = zero_line($1, x), DATA2 = pr($1, min), PALETTE = PALETTE.zero_pal(y).", ") : \
        (DATA = DATA.pr($1, x), DATA2 = DATA2.pr($1, min)), x)

plot for [i=2:col+1] datfile u 1:(f(column(i), i))

DATA = DATA.sprintf("\n").DATA2

set print tmpfile
print DATA
set print

eval(PALETTE.zero_pal(col+2).")")
set view 35, 155, 1, 1
splot for [i=0:col-1] tmpfile every :::(2*i)::(2*i+1) u 1:(i):2:(i+2) w pm3d

if (gridflag==1) for [i=0:col-1] tmpfile every :::(2*i)::(2*i+1) u 1:(i):2 w l lt -1
