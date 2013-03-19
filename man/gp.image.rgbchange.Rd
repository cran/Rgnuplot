\name{gp.image.rgbchange}
\alias{gp.image.rgbchange}
\alias{gp.image.rgbfalsecolor}
\alias{gp.image.rgbfiltercolor.blue}
\alias{gp.image.rgbfiltercolor.green}
\alias{gp.image.rgbfiltercolor.red}
\alias{gp.image.rgbfiltercolor.sepia}
\alias{gp.image.rgbfiltercolor.sepia2}
\alias{gp.image.rgbgreyscaleBT709}
\alias{gp.image.rgbgreyscaleLinear}
\alias{gp.image.rgbgreyscaleLuminosity}
\alias{gp.image.rgbgreyscaleRMY}
\alias{gp.image.rgbgreyscaleY}
\alias{gp.image.rgbgreyscaleavg}
\title{Change image colors}
\description{\code{gp.image.rgbchange} modifies an image with either a formula for each color component of RGB or for all
\code{gp.image.rgbfalsecolor} converts an image from true color to false color and vice-versa
\code{gp.image.rgbfiltercolor.blue} filters an image using the blue channel
\code{gp.image.rgbfiltercolor.green} filters an image using the green channel
\code{gp.image.rgbfiltercolor.red} filters an image using the red channel
\code{gp.image.rgbfiltercolor.sepia} filters an image using a sepia algorithm
\code{gp.image.rgbfiltercolor.sepia2} filters an image using a 2nd sepia algorithm
\code{gp.image.rgbgreyscaleBT709} filters an image using greyscale algorithm - BT709
\code{gp.image.rgbgreyscaleLinear} filters an image using greyscale algorithm - linear
\code{gp.image.rgbgreyscaleLuminosity} filters an image using greyscale algorithm - luminosity
\code{gp.image.rgbgreyscaleRMY} filters an image using greyscale algorithm - RMY
\code{gp.image.rgbgreyscaleY} filters an image using greyscale algorithm - Y
\code{gp.image.rgbgreyscaleavg} filters an image using greyscale algorithm - average
}
\usage{gp.image.rgbchange(fileIN, fileOUT, filetype='PNG', terminal=NULL,rgbformula,rgbformulaG='',rgbformulaB='')
gp.image.rgbfalsecolor(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbfiltercolor.blue(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbfiltercolor.green(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbfiltercolor.red(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbfiltercolor.sepia(fileIN, fileOUT, filetype='PNG', terminal=NULL,sepiaDepth=20,sepiaIntensity=10)
gp.image.rgbfiltercolor.sepia2(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleBT709(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleLinear(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleLuminosity(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleRMY(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleY(fileIN, fileOUT, filetype='PNG', terminal=NULL)
gp.image.rgbgreyscaleavg(fileIN, fileOUT, filetype='PNG', terminal=NULL)
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
\seealso{	\code{\link{gp.image.plot}}}
\author{Jose' Gama}
\keyword{programming}


