SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

CC := gcc

# 打印内部定义的变量
all :
	@echo "$(.VARIABLES)"

# 内部规则/变量，编译段
app.out : $(OBJS)
	$(CC) -o $@ $^
	$(RM) $^
	@echo "Target ==> $@"

# 自定义规则
%.o : %.c
	@echo "my rule"
	$(CC) -c -o $@ $^
	
