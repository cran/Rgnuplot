#
# ############################
#    File 'projections.gnu'  
# ############################
#
# (  i) Plate Carre
# ( ii) Plate Carre with lat1 (parallel without deformation)
# (iii) Aitoff Projection
# ( iv) Winkel Tripel Projection or Winkell III
#
# References:
#
# Evenden, G. I. Cartographic Projection Procedures - Release 4, 
#     Second Interim Report, January, 2003. 
#     <http://download.osgeo.org/proj/proj.4.3.I2.pdf>
#
# Author of the original GnuPlot scripts: Eng. Cart. Mauricio Galo
#                                UNESP/Department of Cartography
#                                galo@fct.unesp.br
#                                2013
#
#
# adapted by Jose Gama 2013 for the package Rgnuplot
#
# -------------------------------------------------------------------------

# setup graphics
set lmargin 0
set bmargin 0
set tmargin 0
set rmargin 0
set style line 1 lt 1 lc rgb "black" lw 1 #  lines' color
set style line 2 lt 1 lc rgb "gray" lw .5 # parallel color
set style line 3 lt 1 lc rgb "gray" lw .5 # meridian color
set style line 4 lt 1 lc rgb "black" lw .5 # thin black
set style line 5 lt 1 lc rgb "red" lw .5 # thin red
set noxtics
set noytics
set angles degrees
set nogrid
set noborder
width=40 # Seting width/height ratio
height=width*(3./4.)
set xrange [-width : width]
set yrange [-height : height]

#general variables
drad=pi/180. # Constant to convert degrees into radians
r=20 # Semi-axis of the model
rad_g=180./pi

#general functions
X(lat,lon)=ap*(cos(lat0)*sin(lat)-sin(lat0)*cos(lat)*cos(lon-lon0))
Y(lat,lon)=ap*cos(lat)*sin(lon-lon0)
den(lat,lon)=1+sin(lat0)*sin(lat)+cos(lat0)*cos(lat)*cos(lon-long0)
T(lat)=( lat2=(lat==90)?85:( (lat==-90)?-86:lat ) , tan(45+lat2/2)*( (1-e*sin(lat2))/(1+e*sin(lat2))**(e/2) ) )
T2(lat)=tan(45-lat/2)*( (1+e*sin(lat))/(1-e*sin(lat))**(e/2) )
N(lat)=ap*( 1-e2*sin(lat)*sin(lat) )**(-0.5)
rho(lat)=(ap/sin(lat0))*sqrt(1+(sin(lat0))**2 - 2*sin(lat)*sin(lat0))
eta(lon)=(lon-long0)*sin(lat0)
sin_theta(lat)=sin(65)*sin(lat)
cos_theta(lat)=sqrt( 1 - sin_theta(lat)*sin_theta(lat))
alfa(lat,lon)=acos(cos_theta(lat)*cos(lon/3))
cos_lat2(lat,lon)=cos(alfa(lat,lon)/2.)
rho2(lat)=ap*(90-lat)
theta(lat,lon)=(lon-lon0)*cos(lat-0.00001)/(90-(lat-0.00001))
sinc(a)=(a==0)?0:(sin(a)/a)

# Mercator's Projection
MercatorInit(long0)=(long0=long0, \
ap=10, \
a=6378160.0, \
inv_f=298.25, \
f=1/inv_f, \
e2=1-(1-f)**2, \
e=sqrt(e2), "Mercator's Projection")
MercatorXC(lat,lon)=ap*log(T(lat))
MercatorYC(lat,lon)=ap*(lon-long0)*drad

# Ortographic Projection
OrtographicInit(lat0, lon0, delta_lat, delta_lon)=(lat0=lat0, lon0=lon0, delta_lat=delta_lat, delta_lon=delta_lon, \
ap=25, \
l_sup=lat0+delta_lat, \
l_inf=lat0-delta_lat, \
l_esq=lon0-delta_lon, \
l_dir=lon0+delta_lon, "Ortographic Projection" )
OrtographicXC(lat,lon)= (lat >=l_inf && lat <=l_sup) ? X(lat,lon) : 0/0
OrtographicYC(lat,lon)= (lon >=l_esq && lon <=l_dir) ? Y(lat,lon) : 0/0

# Estereographic Azimutal Projection
EstereoAzimutalInit(lat0, long0)=(lat0=lat0, long0=long0, ap=5,"Estereographic Azimutal Projection")
EstereoAzimutalXC(lat,lon)=2*ap*( cos(lat0)*sin(lat)-sin(lat0)*cos(lat)*cos(lon-long0) )/den(lat,lon)
EstereoAzimutalYC(lat,lon)=2*ap*cos(lat)*sin(lon-long0)/den(lat,lon)

# Plate-Carrée Projection
PlateCarreeInit(long0)=(long0=long0, ap=.2,"Plate-Carrée Projection")
PlateCarreeXC(lat,lon)=ap*lat
PlateCarreeYC(lat,lon)=(lon-long0)*ap

# Lambert Cylindrical Equivalent Projection
LambertInit(long0)=(long0=long0, ap=15,"Lambert Cylindrical Equivalent Projection")
LambertXC(lat,lon)=ap*sin(lat)
LambertYC(lat,lon)=(lon-long0)*ap*drad

# Sanson-Flamsteed Equivalent Projection
SansonFlamsteedInit(long0)=(long0=long0, ap=12,"Sanson-Flamsteed Equivalent Projection")
SansonFlamsteedXC(lat,lon)=ap*lat*drad
SansonFlamsteedYC(lat,lon)=(lon-long0)*ap*cos(lat)*drad

# Albers Conical Equivalent Projection
AlbersConicalInit(lat0, long0)=(lat0=lat0, long0=long0, ap=12, r0=N(lat0), "Albers Conical Equivalent Projection")
AlbersConicalXC(lat,lon)=rho(lat0)-rho(lat)*cos(eta(lon))
AlbersConicalYC(lat,lon)=rho(lat)*sin(eta(lon))

# Eckert I Projection
EckertIInit(ap)=( ap=ap, auxiliar=2.*ap*sqrt(2./(3.*pi)), "Eckert I Projection")
EckertIXC(lat,lon)=auxiliar*lat*drad
EckertIYC(lat,lon)=auxiliar*lon*(1-abs(lat/180))*drad

# Hammer-Wagner Projection
HammerWagnerInit(ap)=( ap=ap, "Hammer-Wagner Projection")
HammerWagnerXC(lat,lon)=1.24104*ap*sin_theta(lat)/cos_lat2(lat,lon)
HammerWagnerYC(lat,lon)=2.66723*ap*cos_theta(lat)*sin(lon/3.)/cos_lat2(lat,lon)

# Werner's Equivalent Projection
WernersEquivalentInit(lon0, dx)=(lon0=lon0, dx=dx, ap=5, w=900, h=w*3/4, "Werner's Equivalent Projection")
WernersEquivalentXC(lat,lon)=-rho2(lat)*cos(theta(lat,lon)*rad_g)
WernersEquivalentYC(lat,lon)= rho2(lat)*sin(theta(lat,lon)*rad_g)

# Robinson Projection
# approximated with polynomial equations from Canters and Decleir (1989)
RobinsonInit(ap)=( ap=ap, "Robinson Projection")
RobinsonYC(lat,lon)=(lati=lat* drad, loni=lon* drad, ap*loni*(0.8507-0.1450*lati**2-0.0104*lati**4))
RobinsonXC(lat,lon)=(lati=lat* drad, ap*(0.9642*lati-0.0013*lati**3-0.0129*lati**5))

# Natural Earth Projection
NaturalEarthInit(ap)=( ap=ap, "Natural Earth Projection")
NaturalEarthYC(lati,loni)=(lat=lati* drad, lon=loni* drad, ap*lon*(0.870700-0.131979*lat**2-0.013791*lat**4+0.003971*lat**10-0.001529*lat**12))
NaturalEarthXC(lati,loni)=(lat=lati* drad, ap*(1.007226*lat+0.015085*lat**3-0.044475*lat**7+0.028874*lat**9-0.005916*lat**11))

# Plate-Carrée Projection - with one standard parallel
PlateCarree1Init(ap)=(lon0=0, lat1=acos(2/pi), ap=ap, "Plate-Carrée Projection - with one standard parallel")
PlateCarree1XC(lat,lon)=ap*lat
PlateCarree1YC(lat,lon)=ap*(lon-lon0)*cos(lat1)

# Aitoff Projection
Teta(lat,lon)=acos(cos(lat)*cos(lon/2))
SENOT(lat,lon)=sin(Teta(lat,lon))
AitoffInit(ap)=( ap=ap, "Aitoff Projection")
AitoffYC(lat,lon)=( lat==0. && lon==0. ) ? 0. : 2*Teta(lat,lon)*cos(lat)*sin(lon/2)/SENOT(lat,lon)*ap
AitoffXC(lat,lon)=( lat==0. && lon==0. ) ? 0. : Teta(lat,lon)*sin(lat)/SENOT(lat,lon)*ap

# Winkel Tripel Projection (or Winkel III Projection)
WinkeltripelInit(ap)=( ap=ap, lon0=0, lat1=acos(2/pi), "Winkel tripel Projection")
WinkeltripelYC(lat,lon)=(AitoffYC(lat,lon) + PlateCarree1YC(lat,lon))/2
WinkeltripelXC(lat,lon)=(AitoffXC(lat,lon) + PlateCarree1XC(lat,lon))/2






