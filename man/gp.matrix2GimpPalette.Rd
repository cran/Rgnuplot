\name{gp.matrix2GimpPalette}
\alias{gp.matrix2GimpPalette}
\alias{gp.matrix2palette}
\alias{gp.CreateIndexFromMatrixAndPalette}
\alias{gp.CreatePaletteFromMatrix}
\alias{gp.GimpPalette2matrix}
\alias{gp.palette.plot}
\alias{gp.show.palette.colornames}
\title{Work with palette files}
\description{\code{gp.matrix2GimpPalette} saves a matrix into a Gimp palette file (gpl)
\code{gp.matrix2palette} save a palette from matrix data with optional palette indeces and the option to modify the palette for solid colors
\code{gp.CreateIndexFromMatrixAndPalette} from a matrix with RGB colors (decimal 24bit) from an image file and its palette as a vector, create a matrix with indices
\code{gp.CreatePaletteFromMatrix} from a matrix with RGB colors (decimal 24bit) from an image file create a palette of 256 colors (decimal 24bit), as a vector
\code{gp.GimpPalette2matrix} reads a Gimp palette into a matrix, optionally the index can be returned too
\code{gp.palette.plot} plots a palette from an indexed PNG file
\code{gp.show.palette.colornames} get gnuplot's RGB color names as a dataframe - 'ColorName','ColorHex','R','G','B'
}
\usage{gp.matrix2GimpPalette(paletteMatrix, gplFileName, GimpColumns=16)

gp.matrix2palette(paletteData, paletteFileName,paletteIndeces=0,SolidColor=FALSE)

gp.CreateIndexFromMatrixAndPalette(matrixRGB, paletteRGB)

gp.CreatePaletteFromMatrix(matrixRGB, sortType='')

gp.GimpPalette2matrix(paletteGimp,returnIndex=FALSE)

gp.palette.plot(filepal, sortType='', TheGimp=FALSE)

gp.show.palette.colornames()
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
\seealso{	\code{\link{gp.resampleDEM}}}
\author{Jose' Gama}
\keyword{programming}
