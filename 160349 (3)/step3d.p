set terminal postscript eps enhanced color size 3.9,2.9

set key font ",22"
set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"
set logscale y 10
set xlabel "number of elements"
set ylabel "Application speedup"
set yrange[1:100000]
set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border



set output "step3d.eps"
set xtics rotate by -45
set style histogram errorbars lw 3
set style data histogram

plot 'avg1.txt' u 3:5:xticlabels(1) title "thread 1",\
'' u 7:9 title "thread 2" fillstyle pattern 7,\
'' u 11:13 title "thread 4" fillstyle pattern 12,\
'' u 15:17 title "thread 8" fillstyle pattern 5,\
'' u 19:21 title "thread16" fillstyle pattern 14
