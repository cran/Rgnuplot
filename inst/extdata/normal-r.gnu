#based on
#http://gnuplot.sourceforge.net/demo/transparent.1.gnu
# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 512, 280 
# set output 'transparent.1.png'
set clip two
set style fill   solid 1.00 noborder
set key inside left top vertical Left reverse enhanced autotitles nobox
set key noinvert samplen 1 spacing 1 width 0 height 0 
set title "Normal Distribution" 
set xrange [ -5.00000 : 5.00000 ] noreverse nowriteback
set yrange [ 0.00000 : 1.00000 ] noreverse nowriteback
unset colorbox
Gauss(x,mu,sigma) = 1./(sigma*sqrt(2*pi)) * exp( -(x-mu)**2 / (2*sigma**2) )
GaussCDF(x,mu,sigma) = .5 * (1.0 + erf((x-mu)/(sigma*sqrt(2))))
if (flag==1) d1(x) = Gauss(x, d1m, sqrt(d1d)); else d1(x) = GaussCDF(x, d1m, sqrt(d1d))
plot d1(x) title sprintf("μ = %.3f  σ² = %.3f",d1m,d1d) 
