all: start

start: main.c procedure.o
	g++ -o start main.c procedure.c

procedure: procedure.c
	g++ -c procedure.c

clean:
	rm -f *.o
	rm start
