#set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

#set format y "10^{%L}"
set logscale x 10
set logscale y 10
set xlabel "num-of-elements"
set ylabel "average execution time"
set yrange[100:100000]
set xrange[100:10000000]
set ytic auto
set xtic auto

set key bottom right
set output "step3b.eps"
plot 'avg.txt'every 5::0 using 1:3 title "no. of threads=1" with linespoint pt 1 lc 1 ,\
     	'' every 5::1 using 1:3 title "no. of threads=2" with linespoint pt 2 lc 2,\
	'' every 5::2 using 1:3 title "no. of threads=4" with linespoint pt 3 lc 3,\
	'' every 5::3 using 1:3 title "no. of threads=8" with linespoint pt 4 lc 4,\
	'' every 5::4 using 1:3 title "no. of threads=16" with linespoint pt 6 lc 6

