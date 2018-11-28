all: shell

shell: main.c procedure.o
	gcc -o shell main.c procedure.c

procedure: procedure.c
	gcc -c procedure.c

clean:
	rm -f *.o
	rm shell
