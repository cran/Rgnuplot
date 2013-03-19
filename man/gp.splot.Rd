\name{gp.splot}
\alias{gp.splot}
\title{Plots an expression in 3D with one function call}
\description{\code{gp.splot} plots an expression in 3D without the need to define handles}
\usage{gp.splot(x, type = c('hidden3d', 'pm3d', 'map', 'contour'))}
\arguments{	\item{x}{ expression}
\item{type}{ type of 3D plot: hidden3d, pm3d, map or contour}}
\value{	none}
\seealso{	\code{\link{gp.init}}}
\author{Oscar Perpi\~{n}\'{a}n Lamigueiro}
\examples{
\dontrun{gp.splot(volcano)
gp.splot(volcano, 'pm3d')
gp.splot(volcano, 'map')
gp.splot(volcano, 'contour')}
}
\keyword{programming}
