\name{GpRGB2image}
\alias{GpRGB2image}
\alias{GpRGB1to3channels}
\alias{GpRGB2DAT}
\alias{GpRGBsample}
\title{Work with RGB data}
\description{\code{GpRGB2image} converts an RGB file to another image file
\code{GpRGB1to3channels} converts a vector or matrix of RGB 1-channel decimal values (24 bit) to 3-channel decimal values (3x8 bit)
\code{GpRGB2DAT} converts an RGB file to a matrix data file
\code{GpRGBsample} plots a square filled with an RGB color
}
\usage{GpRGB2image(RGBfile, imagefile, width, height, filetype='PNG', gpterminal=NULL)
GpRGB1to3channels(RGB1channel=NULL, fileRGB1channel=NULL, fileRGB3channel=NULL)
GpRGB2DAT(RGBfile, DATfile,width,height)
GpRGBsample(xRGB='#FFFFFF', optionalTitle='')
}
\arguments{	\item{RGBfile}{ raw RGB file name}
\item{imagefile}{ image file name}
\item{width}{ image width}
\item{height}{ image height}
\item{filetype}{ image type}
\item{gpterminal}{ terminal name}
\item{RGB1channel}{ vector or matrix of RGB 1-channel decimal values (24 bit)}
\item{fileRGB1channel}{ file with RGB 1-channel decimal values (24 bit)}
\item{fileRGB3channel}{ file with RGB 3-channel decimal values (3x8 bit)}
\item{DATfile}{ data file name}
\item{xRGB}{ RGB color in hexadecimal}
\item{optionalTitle}{ title for plot}
}
\value{	none}
\seealso{	\code{\link{Gpimage2image}}}
\author{Jose' Gama}
\keyword{programming}
