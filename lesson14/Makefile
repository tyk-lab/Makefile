
VPATH := src
CFLAGS := -I inc
GPATH := src

app.out : func.o main.o
	@gcc -o $@ $^
	@echo "Target File ==> $@"

%.o : %.c inc/func.h
	@gcc $(CFLAGS) -o $@ -c $<
