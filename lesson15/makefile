.PHONY : all clean

# 文件夹
DIR_BUILD := build
DIR_SRC := src
DIR_INC := inc

# 文件后缀名
TYPE_INC := .h
TYPE_SRC := .c
TYPE_OBJ := .o

CC := gcc
LFLAGS :=
CFLAGS := -I $(DIR_INC)
ifeq ($(DEBUG),true)
CFLAGS += -g
endif

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

# gcc -I inc -o build/func.o -c src/func.c，不使用自动推导头文件依赖
$(DIR_BUILD)/%$(TYPE_OBJ) : %$(TYPE_SRC) $(HDRS)
	$(CC) $(CFLAGS) -o $@ -c $<
	
clean :
	$(RM) $(DIR_BUILD)
	
	