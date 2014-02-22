library(Rgnuplot)

# Example of using the postscript terminal, with special characters and symbols specified as PostScript symbols
gp.run('set terminal postscript size 8cm,6cm eps enhanced color font "Helvetica,10"
set output "SinCos.eps"
set style line 1 linecolor rgb "blue" linetype 1 linewidth 5  # blue
set style line 2 linecolor rgb "red" linetype 1 linewidth 5  # red
set xlabel "{/Helvetica-Italic x}"
set ylabel "{/Helvetica-Italic y}"
set xtics ("-2{/Symbol p}" -2*pi, "-{/Symbol p}" -pi, 0, "{/Symbol p}" pi, "2{/Symbol p}" 2*pi)
plot [-2*pi:2*pi][-1.5:1.5] sin(x) tit "sin({/Helvetica-Italic x})" with lines ls 1, cos(x) tit "cos({/Helvetica-Italic x})" with lines ls 2')

# Example of using the latex terminal with special characters and symbols specified as Latex symbols
gp.run('set terminal latex size 8cm, 6cm color courier 10
set output "SinCosV0.tex"
set style line 1 linecolor rgb "blue" linetype 1 linewidth 5  # blue
set style line 2 linecolor rgb "red" linetype 1 linewidth 5  # red
set xlabel "$x$"
set ylabel "$y$"
set xtics ("$-2\\\\pi$" -2*pi, "$-\\\\pi$" -pi, 0, "$\\\\pi$" pi, "$2\\\\pi$" 2*pi)
plot [-2*pi:2*pi][-1.5:1.5] sin(x) tit "$\\\\sin(x)$" with lines ls 1, cos(x) tit "$\\\\cos(x)$" with lines ls 2')

#Compile the following code with Tex -> DVI -> PDF to display the previous result
#\begin{lstlisting}[language=R,caption={Latex code to show SinCosV0.tex},label={lst:textshowSinCosV0}]
#\documentclass{article}
#\begin{document}
#\begin {figure}
#\input{SinCosV0}
#\end {figure}
#\end{document}
#\end{lstlisting}







