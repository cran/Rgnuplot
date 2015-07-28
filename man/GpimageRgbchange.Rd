\name{GpimageRGBchange}
\alias{GpimageRGBchange}
\alias{GpimageRgbfalsecolor}
\alias{GpimageRgbfiltercolorBlue}
\alias{GpimageRgbfiltercolorGreen}
\alias{GpimageRgbfiltercolorRed}
\alias{GpimageRgbfiltercolorSepia}
\alias{GpimageRgbfiltercolorSepia2}
\alias{GpimageRgbgreyscaleBT709}
\alias{GpimageRgbgreyscaleLinear}
\alias{GpimageRgbgreyscaleLuminosity}
\alias{GpimageRgbgreyscaleRMY}
\alias{GpimageRgbgreyscaleY}
\alias{GpimageRgbgreyscaleavg}
\title{Change image colors}
\description{\code{GpimageRGBchange} modifies an image with either a formula 
	for each color component of RGB or for all
\code{GpimageRgbfalsecolor} converts an image from true color to false color 
and vice-versa
\code{GpimageRgbfiltercolorBlue} filters an image using the blue channel
\code{GpimageRgbfiltercolorGreen} filters an image using the green channel
\code{GpimageRgbfiltercolorRed} filters an image using the red channel
\code{GpimageRgbfiltercolorSepia} filters an image using a sepia algorithm
\code{GpimageRgbfiltercolorSepia2} filters an image using a 2nd sepia 
algorithm
\code{GpimageRgbgreyscaleBT709} filters an image using greyscale algorithm
- BT709
\code{GpimageRgbgreyscaleLinear} filters an image using greyscale algorithm
- linear
\code{GpimageRgbgreyscaleLuminosity} filters an image using greyscale 
algorithm - luminosity
\code{GpimageRgbgreyscaleRMY} filters an image using greyscale algorithm
- RMY
\code{GpimageRgbgreyscaleY} filters an image using greyscale algorithm - Y
\code{GpimageRgbgreyscaleavg} filters an image using greyscale algorithm
- average
}
\usage{GpimageRGBchange(fileIN, fileOUT, filetype='PNG', terminal=NULL,
	rgbformula,rgbformulaG='',rgbformulaB='')
GpimageRgbfalsecolor(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbfiltercolorBlue(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbfiltercolorGreen(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbfiltercolorRed(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbfiltercolorSepia(fileIN, fileOUT, filetype='PNG', terminal=NULL,
sepiaDepth=20,sepiaIntensity=10)
GpimageRgbfiltercolorSepia2(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleBT709(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleLinear(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleLuminosity(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleRMY(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleY(fileIN, fileOUT, filetype='PNG', terminal=NULL)
GpimageRgbgreyscaleavg(fileIN, fileOUT, filetype='PNG', terminal=NULL)
}
\arguments{	\item{fileIN}{ input file name}
\item{fileOUT}{ output file name}
\item{filetype}{ image file type}
\item{terminal}{ terminal name}
\item{rgbformula}{ formula for the 3 RGB channels or for channel R}
\item{rgbformulaG}{ formula for for channel G}
\item{rgbformulaB}{ formula for for channel B}
\item{sepiaDepth}{ depth value for the sepia algorithm}
\item{sepiaIntensity}{ intensity value for the sepia algorithm}
}
\value{	none}
\seealso{	\code{\link{GpimagePlot}}}
\author{Jose' Gama}
\keyword{programming}


