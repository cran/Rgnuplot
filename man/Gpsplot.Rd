\name{Gpsplot}
\alias{Gpsplot}
\title{Plots an expression in 3D with one function call}
\description{\code{Gpsplot} plots an expression in 3D without the need to define handles}
\usage{Gpsplot(x, type = c('hidden3d', 'pm3d', 'map', 'contour'))}
\arguments{	\item{x}{ expression}
\item{type}{ type of 3D plot: hidden3d, pm3d, map or contour}}
\value{	none}
\seealso{	\code{\link{Gpinit}}}
\author{Oscar Perpi\~{n}\'{a}n Lamigueiro}
\examples{
\dontrun{Gpsplot(volcano)
Gpsplot(volcano, 'pm3d')
Gpsplot(volcano, 'map')
Gpsplot(volcano, 'contour')}
}
\keyword{programming}
