#based on Kawano T "Introduction to Gnuplot " http://t16web.lanl.gov/Kawano/gnuplot/gallery/func2.html

# Total errors
sx = sqrt(sigx*sigx + sc*sc)
sy = sqrt(sigy*sigy + sc*sc)
# Correlation
c = sc*sc/sx/sy
g(x,m,s) = (x-m)/s
set dummy u,v
set key below samplen -1
set parametric
set isosample 30,30
if (flag==1) set hidden3d back offset 1 trianglepattern 3 undefined 1 altdiagonal bentover;
set style function dots
set ticslevel 0
set size square
set ztics 0.00000,0.05 norangelimit
set title "Bivariate normal distribution"
set urange [ -4.00000 : 4.00000 ] noreverse nowriteback
set vrange [ -4.00000 : 4.00000 ] noreverse nowriteback

if (flag==1) set pm3d;set palette; else unset surface; set contour base; set view map;
splot u,v, exp(-1/(2*sqrt(1-c*c))*\
               (  g(u,mx,sx)**2\
                 -2*c*g(u,mx,sx)*g(v,my,sy)\
                 +g(v,my,sy)**2))/(2*pi*sx*sy*sqrt(1-c*c)) with line lc rgb "black" title sprintf("μx = %.3f  σ²x = %.3f\nμy = %.3f  σ²y = %.3f\nρ = %.3f",mx,sx,my,sy,sc)

