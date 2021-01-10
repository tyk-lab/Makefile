

方法要点：
1. 产生 %.o 的文件目标
OBJS := $(patsubst $(DIR_SRC)/%, $(DIR_BUILD)/%, $(OBJS))

2. 使用依赖创建文件夹，并产生app文件
all : $(DIR_BUILD) $(APP)

3. 指定搜索路径
vpath %$(TYPE_INC) $(DIR_INC)
vpath %$(TYPE_SRC) $(DIR_SRC)

4. 直接让目标文件依赖所有头文件，这样头文件更新，就会进行对应的编译
    --- 方便调试
# 产生 inc/*.h -> *.h
HDRS := $(wildcard $(DIR_INC)/*$(TYPE_INC))
HDRS := $(notdir $(HDRS))

# gcc -I inc -o build/func.o -c src/func.c，
$(DIR_BUILD)/%$(TYPE_OBJ) : %$(TYPE_SRC) $(HDRS)
	$(CC) $(CFLAGS) -o $@ -c $<


缺点：
1. 头文件变化，就会重新编译所有的源文件
2. 没有分模块编译，不方便makefile的扩展


优点：
简单项目，能搭建简单的文件管理结构，快速编译

