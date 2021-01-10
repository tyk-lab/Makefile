
OBJS := func.o main.o
INC := inc
SRC := src
VPATH := $(INC) $(SRC)
CFLAGS := -I $(INC)

hello.exe : $(OBJS)
	@gcc -o $@ $^
	@echo "Target File ==> $@"
	
$(OBJS) : %.o : %.c func.h
	@gcc $(CFLAGS) -o $@ -c $<
