.PHONY : all clean

# 目标目录
DIR_BUILD := build
DIR_SRC := src
DIR_INC := inc

# 搜索的文件后缀
TYPE_INC := .h
TYPE_SRC := .c
TYPE_OBJ := .o

# 编译器，连接器选项
CC := gcc
LFLAGS :=
CFLAGS := -I $(DIR_INC)
ifeq ($(DEBUG),true)
CFLAGS += -g
endif

# 其他命令
MKDIR := mkdir
RM := rm -fr

APP := $(DIR_BUILD)/app.out
# 产生 inc/*.h -> *.h
HDRS := $(wildcard $(DIR_INC)/*$(TYPE_INC))
HDRS := $(notdir $(HDRS))
# 产生 src/*.c -> src/*.o -> build/*.o
OBJS := $(wildcard $(DIR_SRC)/*$(TYPE_SRC))
OBJS := $(OBJS:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst $(DIR_SRC)/%, $(DIR_BUILD)/%, $(OBJS))

# 定搜索路径 inc下的 .h文件，src下的 .c文件
vpath %$(TYPE_INC) $(DIR_INC)
vpath %$(TYPE_SRC) $(DIR_SRC)

all : $(DIR_BUILD) $(APP)
	@echo "Target File ==> $(APP)"
	
$(DIR_BUILD) :
	$(MKDIR) $@
	
$(APP) : $(OBJS)
	$(CC) $(LFLAGS) -o $@ $^

# gcc -I inc -o build/func.o -c src/func.c，
$(DIR_BUILD)/%$(TYPE_OBJ) : %$(TYPE_SRC) $(HDRS)
	$(CC) $(CFLAGS) -o $@ -c $<
	
clean :
	$(RM) $(DIR_BUILD)
	
	