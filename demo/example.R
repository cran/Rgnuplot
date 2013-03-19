library(Rgnuplot)
#example of using gp.i: plotting slopes, equations, styles, lists of points and multiple output windows
#gp.i, by Nicolas Devillard
#Initialize variables
NPOINTS<-50
SLEEP_LGTH<-2
x<-vector('numeric',NPOINTS)
y<-vector('numeric',NPOINTS)
#Initialize the gnuplot handle
print("*** example of gnuplot control through C ***\n")
h1<-gp.init()
h2<-gp.init()

#Slopes

    gp.setstyle(h1, "lines") 
    
    print("*** plotting slopes\n") 
    print("y = x\n") 
    gp.plot.slope(h1, 1.0, 0.0, "unity slope") 
    Sys.sleep(SLEEP_LGTH)

    print("y = 2*x\n") 
    gp.plot.slope(h1, 2.0, 0.0, "y=2x") 
 Sys.sleep(SLEEP_LGTH)

    print("y = -x\n") 
    gp.plot.slope(h1, -1.0, 0.0, "y=-x")
Sys.sleep(SLEEP_LGTH)

#Equations

    gp.resetplot(h1)
    print("\n\n*** various equations\n")
    print("y = sin(x)\n")
    gp.plot.equation(h1, "sin(x)", "sine")
    Sys.sleep(SLEEP_LGTH)

    print("y = log(x)\n")
    gp.plot.equation(h1, "log(x)", "logarithm")
    Sys.sleep(SLEEP_LGTH)

    print("y = sin(x)*cos(2*x)\n")
    gp.plot.equation(h1, "sin(x)*cos(2*x)", "sine product")
    Sys.sleep(SLEEP_LGTH)

# Styles

    gp.resetplot(h1)
    print("\n\n")
    print("*** showing styles\n")

    print("sine in points\n")
    gp.setstyle(h1, "points")
    gp.plot.equation(h1, "sin(x)", "sine")
    Sys.sleep(SLEEP_LGTH)
    
    print("sine in impulses\n")
    gp.setstyle(h1, "impulses")
    gp.plot.equation(h1, "sin(x)", "sine")
    Sys.sleep(SLEEP_LGTH)
    
    print("sine in steps\n")
    gp.setstyle(h1, "steps")
    gp.plot.equation(h1, "sin(x)", "sine")
    Sys.sleep(SLEEP_LGTH)

# User defined 1d and 2d point sets

    gp.resetplot(h1)
    gp.setstyle(h1, "impulses")
    print("\n\n")
    print("*** user-defined lists of doubles\n")
    for (i in 1:NPOINTS) {
        x[i] = i*i
    }
    gp.plot.x(h1, x, NPOINTS, "user-defined doubles")
    Sys.sleep(SLEEP_LGTH)

	print("*** user-defined lists of points\n");
    for (i in 1:NPOINTS) {
        x[i] = i
        y[i] = i * i
    }
    gp.resetplot(h1)
    gp.setstyle(h1, "points")
    gp.plot.xy(h1, x, y, NPOINTS, "user-defined points")
    Sys.sleep(SLEEP_LGTH)


# Multiple output screens

    print("\n\n")
    print("*** multiple output windows\n")
    gp.resetplot(h1)
    gp.setstyle(h1, "lines")
    h2 = gp.init()
    gp.setstyle(h2, "lines")
    h3 = gp.init()
    gp.setstyle(h3, "lines")
    h4 = gp.init()
    gp.setstyle(h4, "lines")

    print("window 1: sin(x)\n")
    gp.plot.equation(h1, "sin(x)", "sin(x)")
    Sys.sleep(SLEEP_LGTH)
    print("window 2: x*sin(x)\n")
    gp.plot.equation(h2, "x*sin(x)", "x*sin(x)")
    Sys.sleep(SLEEP_LGTH)
    print("window 3: log(x)/x\n")
    gp.plot.equation(h3, "log(x)/x", "log(x)/x");
    Sys.sleep(SLEEP_LGTH)
    print("window 4: sin(x)/x\n")
    gp.plot.equation(h4, "sin(x)/x", "sin(x)/x")
    Sys.sleep(SLEEP_LGTH*5)

#close gnuplot handles
h1<-gp.close(h1)
h2<-gp.close(h2)
h3<-gp.close(h3)
h4<-gp.close(h4)


