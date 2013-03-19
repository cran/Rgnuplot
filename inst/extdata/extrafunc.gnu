#extra functions for gnuplot

# step function
# from Ben Ben's blog http://negativeprobability.blogspot.fi/2012/07/making-gnuplot-plots-look-like.html
step(x)=(1+sgn(x-0.5))

# Lorentzian plus background term of 1/sqrt(x)
# from http://security.riit.tsinghua.edu.cn/~bhyang/ref/gnuplot/intro/plotfunc-e.html
Lorentzian(x)=c/((x-a)*(x-a)+b)+d/sqrt(x)


# from gnupot's documentation
ramp(t) = (t > 0) ? t : 0
min(a,b) = (a < b) ? a : b
max(a,b) = (a > b) ? a : b
comb(n,k) = n!/(k!*(n-k)!)
len3d(x,y,z) = sqrt(x*x+y*y+z*z)


# Histogram using gnuplot
# from http://stackoverflow.com/questions/2471884/histogram-using-gnuplot
rint(x)=(x-int(x)>0.9999)?int(x)+1:int(x)
bin(x,width)=width*rint(x/width) + binwidth/2
