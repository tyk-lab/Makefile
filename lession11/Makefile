OBJS := func.o main.o

hello.exe : $(OBJS)
	@gcc -o $@ $^
	@echo "Target File ==> $@"

$(OBJS) : %.o : %.c func.h
	@gcc -o $@ -c $<


