all: report

report:step3a.eps step3b.eps step3c.eps step3d.eps 
	pdflatex report.tex
	
	
plot:output.txt
	gnuplot step3a.p
	gnuplot step3b.p
	gnuplot step3c.p	
	gnuplot step3d.p

step3a.eps:output.txt
	gnuplot step3a.p
step3b.eps:output.txt
	gnuplot step3b.p
step3c.eps:output.txt
	gnuplot step3c.p
step3d.eps:output.txt
	gnuplot step3d.p

output.txt: cs251.ex1
	bash bash.sh

cs251.ex1: prog.o thread_function.o
	gcc -o cs251.ex1 prog.o thread_function.o -lm -lpthread -I.

prog.o: prog.c common.h
	gcc -c prog.c -o prog.o -lm -lpthread -I.


thread_function.o: thread_function.c common.h
	gcc -c thread_function.c -o thread_function.o -lm -lpthread -I.

clean:
	rm -f *.o cs251.ex1 avg.txt avg1.txt result.txt *.eps *.log

