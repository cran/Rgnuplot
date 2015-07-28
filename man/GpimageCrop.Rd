\name{GpimageCrop}
\alias{GpimageCrop}
\alias{GpimageDecimate}
\alias{GpimageFlip}
\alias{GpimagePlot}
\alias{GpimageResize}
\alias{GpimageRotate}
\alias{GpimageTile}
\alias{Gpimage2PNG}
\alias{Gpimage2image}
\title{Simple image manipulation}
\description{\code{GpimageCrop} crops an image
\code{GpimageDecimate} decimates an image
\code{GpimageFlip} flips a png image on the X, Y or XY axis
\code{GpimagePlot} displays an image file on the screen or to a chosen 
terminal except to a file
\code{GpimageResize} resizes an image
\code{GpimageRotate} rotates an image
\code{GpimageTile} tiles multiple image files together into one
\code{Gpimage2PNG} converts from any supported format to PNG, the file type is 
automatically detected
\code{Gpimage2image} converts from any supported format to other format, the 
file type is automatically detected
}
\usage{GpimageCrop(fileIN, fileOUT,x1,y1,x2,y2, filetype='PNG', terminal=NULL)
GpimageDecimate(fileIN, fileOUT, Xdec=2,Ydec=2, filetype='PNG', terminal=NULL)
GpimageFlip(fileIN, fileOUT,flipX=TRUE,flipY=FALSE, filetype='PNG', 
terminal=NULL)
GpimagePlot(fileIN,alpha=FALSE, backgroundColor='', filetype='', 
terminal=NULL)
GpimageResize(fileIN, fileOUT,newWidth, newHeight, filetype='PNG', 
terminal=NULL)
GpimageRotate(fileIN, fileOUT,degrees, filetype='PNG', terminal=NULL)
GpimageTile(fileOUT, matrixFilenamesIn, vectorWidths, vectorHeights,
matrixXscale=NULL, matrixYscale=NULL,alpha=FALSE, filetype='PNG', terminal=NULL)
Gpimage2PNG(fileIN, fileOUT, optional256=FALSE,alpha=FALSE, backgroundColor='')
Gpimage2image(fileIN, fileOUT , filetype='PNG', terminal=NULL,alpha=FALSE, 
backgroundColor='')
}
\arguments{	\item{fileIN}{ input file name}
\item{fileOUT}{ output file name}
\item{x1}{ x coord corner}
\item{y1}{ y coord corner}
\item{x2}{ x coord opposite corner}
\item{y2}{ y coord opposite corner}
\item{filetype}{ image file type}
\item{terminal}{ terminal name}
\item{Xdec}{ x value to decimate}
\item{Ydec}{ y value to decimate}
\item{flipX}{ boolean, TRUE=flip on the x-axis}
\item{flipY}{ boolean, TRUE=flip on the y-axis}
\item{alpha}{ value for alpha channel}
\item{backgroundColor}{ value for background color} 
\item{newWidth}{ new value for the width}
\item{newHeight}{ new value for the Height}
\item{degrees}{ angle of rotation in degrees}  
\item{matrixFilenamesIn}{ matrix with the file names to tile}
\item{vectorWidths}{ vector with the widths of the files to tile}
\item{vectorHeights}{ vector with the heights of the files to tile}
\item{matrixXscale}{ matrix with values for scaling the images in the x-axis}
\item{matrixYscale}{ matrix with values for scaling the images in the y-axis}
\item{optional256}{ boolean, TRUE=256 color output}
}
\value{	none}
\seealso{	\code{\link{GpimageRGBchange}}}
\author{Jose' Gama}
\keyword{programming}
