\name{Gpmatrix2GimpPalette}
\alias{Gpmatrix2GimpPalette}
\alias{Gpmatrix2palette}
\alias{GpcreateIndexFromMatrixAndPalette}
\alias{GpcreatePaletteFromMatrix}
\alias{GpgimpPalette2matrix}
\alias{GppalettePlot}
\alias{GpshowPaletteColornames}
\title{Work with palette files}
\description{\code{Gpmatrix2GimpPalette} saves a matrix into a Gimp palette file (gpl)
\code{Gpmatrix2palette} save a palette from matrix data with optional palette indeces and the option to modify the palette for solid colors
\code{GpcreateIndexFromMatrixAndPalette} from a matrix with RGB colors (decimal 24bit) from an image file and its palette as a vector, create a matrix with indices
\code{GpcreatePaletteFromMatrix} from a matrix with RGB colors (decimal 24bit) from an image file create a palette of 256 colors (decimal 24bit), as a vector
\code{GpgimpPalette2matrix} reads a Gimp palette into a matrix, optionally the index can be returned too
\code{GppalettePlot} plots a palette from an indexed PNG file
\code{GpshowPaletteColornames} get gnuplot's RGB color names as a dataframe - 'ColorName','ColorHex','R','G','B'
}
\usage{Gpmatrix2GimpPalette(paletteMatrix, gplFileName, GimpColumns=16)

Gpmatrix2palette(paletteData, paletteFileName,paletteIndeces=0,SolidColor=FALSE)

GpcreateIndexFromMatrixAndPalette(matrixRGB, paletteRGB)

GpcreatePaletteFromMatrix(matrixRGB, sortType='')

GpgimpPalette2matrix(paletteGimp,returnIndex=FALSE)

GppalettePlot(filepal, sortType='', TheGimp=FALSE)

GpshowPaletteColornames()
}
\arguments{	\item{paletteMatrix}{ matrix with palette values}
\item{gplFileName}{ palette file from The GIMP}
\item{GimpColumns}{ number of columns on gpl file header}
\item{paletteData}{ matrix with the palette data}
\item{paletteFileName}{ output palette file}
\item{paletteIndeces}{ number of indices}
\item{SolidColor}{ boolean, TRUE=solid colors}
\item{matrixRGB}{ matrix with RGB true colors}
\item{paletteRGB}{ palette file}
\item{paletteGimp}{ palette file from The GIMP}
\item{returnIndex}{ boolean, TRUE=include the index value}
\item{filepal}{ palette file}
\item{sortType}{ not implemented yet}
\item{TheGimp}{ boolean, TRUE=GIMP file}
}
\value{	none}
\seealso{	\code{\link{GpresampleDEM}}}
\author{Jose' Gama}
\keyword{programming}
