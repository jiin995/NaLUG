all: shell

shell: main.c procedure.o
	g++ -o shell main.c procedure.c

procedure: procedure.c
	g++ -c procedure.c

clean:
	rm -f *.o
	rm shell
