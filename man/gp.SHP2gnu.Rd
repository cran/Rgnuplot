\name{gp.SHP2gnu}
\alias{gp.SHP2gnu}
\alias{gp.resampleDEM}
\alias{gp.boxXY}
\alias{gp.map.PNG2lines}
\alias{gp.matrix2PNG}
\alias{gp.plot.map}
\title{Work with shapefiles}
\description{\code{gp.SHP2gnu} given a shapefile (SHP) with full path and the shapefile layer name, the coordinates are saved to a text file readable by gnuplot

\code{gp.resampleDEM} resamples DEM data, similarly to what GIS applications do

\code{gp.boxXY} returns the box (coordinates) around a location, from a shapefile

\code{gp.map.PNG2lines} draws "squarish" coastlines given a gridded map from a PNG image

\code{gp.matrix2PNG} saves a matrix with a mask of a map to a PNG file

\code{gp.plot.map} plots a map with vector and raster overlays
}
\usage{gp.SHP2gnu(SHPfilename, SHPlayername,gnufilename,toCRS='+init=epsg:4326')
gp.resampleDEM(fileIN, fileOUT, xrange, yrange, interpolationMethod, XYformat=FALSE)
gp.boxXY(fileName)
gp.map.PNG2lines(PNGfile, landoutlinefile)
gp.matrix2PNG(matM,PNGfile)
gp.plot.map(mapvectfiles=NA, projection='PlateCarree', linetype='l', linestyle=1, plotTitle=NA, maprastfile=NA, maprastpalette=NA, AdditionalCode=NA,projectionInit=NA,returnCode=FALSE)}
\arguments{
	\item{SHPfilename}{ shapefile name}
	\item{SHPlayername}{ shape layer name}
	\item{gnufilename}{ output data file name}
	\item{toCRS}{ optional CRS string to modify the projection}
	\item{fileIN}{ input data file name}
	\item{fileOUT}{ output data file name}
	\item{xrange}{ x-axis range}
	\item{yrange}{ y-axis range}
	\item{interpolationMethod}{ dgrid3d interpolation method}
	\item{fileName}{ shapefile name}
	\item{PNGfile}{ PNG input file name}
	\item{landoutlinefile}{ vector output file name}
	\item{matM}{ matrix with map raster data}
	\item{XYformat}{ boolean, TRUE=use XY format in input file}
	\item{mapvectfiles}{ filenames with vector data}
	\item{projection}{ cartographic projection}
	\item{linetype}{ line type}
	\item{linestyle}{ line style}
	\item{plotTitle}{ title for the plot}
	\item{maprastfile}{ filename of the raster file}
	\item{maprastpalette}{ filename of the raster file's palette}
	\item{AdditionalCode}{ additional code to run before the plot}
	\item{projectionInit}{ initialization values for the projection}
	\item{returnCode}{ boolean, if TRUE the code is returned as a string}
}
\value{	none}
\seealso{	\code{\link{gp.mapsr2gnu}}}
\author{Pat Bartlein and Jose' Gama}
\keyword{programming}

