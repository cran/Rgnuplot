\name{gp.image.crop}
\alias{gp.image.crop}
\alias{gp.image.decimate}
\alias{gp.image.flip}
\alias{gp.image.plot}
\alias{gp.image.resize}
\alias{gp.image.rotate}
\alias{gp.image.tile}
\alias{gp.image2PNG}
\alias{gp.image2image}
\title{Simple image manipulation}
\description{\code{gp.image.crop} crops an image
\code{gp.image.decimate} decimates an image
\code{gp.image.flip} flips a png image on the X, Y or XY axis
\code{gp.image.plot} displays an image file on the screen or to a chosen terminal except to a file
\code{gp.image.resize} resizes an image
\code{gp.image.rotate} rotates an image
\code{gp.image.tile} tiles multiple image files together into one
\code{gp.image2PNG} converts from any supported format to PNG, the file type is automatically detected
\code{gp.image2image} converts from any supported format to other format, the file type is automatically detected
}
\usage{gp.image.crop(fileIN, fileOUT,x1,y1,x2,y2, filetype='PNG', terminal=NULL)
gp.image.decimate(fileIN, fileOUT, Xdec=2,Ydec=2, filetype='PNG', terminal=NULL)
gp.image.flip(fileIN, fileOUT,flipX=TRUE,flipY=FALSE, filetype='PNG', terminal=NULL)
gp.image.plot(fileIN,alpha=FALSE, backgroundColor='', filetype='', terminal=NULL)
gp.image.resize(fileIN, fileOUT,newWidth, newHeight, filetype='PNG', terminal=NULL)
gp.image.rotate(fileIN, fileOUT,degrees, filetype='PNG', terminal=NULL)
gp.image.tile(fileOUT, matrixFilenamesIn, vectorWidths, vectorHeights, matrixXscale=NULL, matrixYscale=NULL,alpha=FALSE, filetype='PNG', terminal=NULL)
gp.image2PNG(fileIN, fileOUT, optional256=FALSE,alpha=FALSE, backgroundColor='')
gp.image2image(fileIN, fileOUT , filetype='PNG', terminal=NULL,alpha=FALSE, backgroundColor='')
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
\seealso{	\code{\link{gp.image.rgbchange}}}
\author{Jose' Gama}
\keyword{programming}
