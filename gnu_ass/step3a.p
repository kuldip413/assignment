set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5
#set terminal postscript eps enhanced color

set key samplen 2 spacing 1 font ",22"

set xtics font ",22"
set ytics font ",22"
set ylabel font ",25"
set xlabel font ",25"

#set format y "10^{%L}"
set logscale x 10
set logscale y 10
set xlabel "num-of-elements"
set ylabel "execution time"
set yrange[100:100000]
set xrange[100:10000000]
set ytic auto
set xtic auto

set key bottom right
set output "step3a.eps"
plot 'result.txt' using 1:($2==1 ? $3 : 1/0) title "no. of threads=1" with points pt 1 ps 1.5
plot 'result.txt' using 1:($2==2 ? $3 : 1/0) title "no. of threads=2" with points pt 1 ps 1.5
plot 'result.txt' using 1:($2==4 ? $3 : 1/0) title "no. of threads=4" with points pt 1 ps 1.5
plot 'result.txt' using 1:($2==8 ? $3 : 1/0) title "no. of threads=8" with points pt 1 ps 1.5
plot 'result.txt' using 1:($2==16 ? $3 : 1/0) title "no. of threads=16" with points pt 1 ps 1.5

set output "step3a1.eps"
plot 'result.txt' using 1:($2==1 ? $3 : 1/0) title "no. of threads=1" with points pt 1 ps 1.5
set output "step3a2.eps"
plot 'result.txt' using 1:($2==2 ? $3 : 1/0) title "no. of threads=2" with points pt 1 ps 1.5
set output "step3a4.eps"
plot 'result.txt' using 1:($2==4 ? $3 : 1/0) title "no. of threads=4" with points pt 1 ps 1.5
set output "step3a8.eps"
plot 'result.txt' using 1:($2==8 ? $3 : 1/0) title "no. of threads=8" with points pt 1 ps 1.5
set output "step3a16.eps"
plot 'result.txt' using 1:($2==16 ? $3 : 1/0) title "no. of threads=16" with points pt 1 ps 1.5



