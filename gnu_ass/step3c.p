set terminal postscript eps enhanced color size 3.9,2.9


set key font ",22"
set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

set logscale y 10
set xlabel "number of elements"
set ylabel "Application speedup"
set yrange[100:100000]

set ytic auto
set boxwidth 1 relative
set style data histograms
set style histogram cluster
set style fill pattern border

set output "step3c.eps"
plot 'avg1.txt' u 3:xticlabels(1) title "thread 1",\
'' u 7 title "thread 2" fillstyle pattern 7,\
'' u 11 title "thread 4" fillstyle pattern 12,\
'' u 15 title "thread 8" fillstyle pattern 5,\
'' u 19 title "thread 16" fillstyle pattern 14

