
.PHONY : all compile link clean rebuild $(MODULES)

# 产生 .../bulid 这个绝对路径
DIR_PROJECT := $(realpath .)
DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/, $(MODULES))

# 产生 build/common.a build/module.a build/main.a
MODULE_LIB := $(addsuffix .a, $(MODULES))
MODULE_LIB := $(addprefix $(DIR_BUILD)/, $(MODULE_LIB))

# 产生 build/app.out
APP := $(addprefix $(DIR_BUILD)/, $(APP))

# 将子模块的编译，定义为一个自定义函数变量
define makemodule
	cd $(1) && \
	$(MAKE) all \
			DEBUG:=$(DEBUG) \
			DIR_BUILD:=$(addprefix $(DIR_PROJECT)/, $(DIR_BUILD)) \
			DIR_COMMON_INC:=$(addprefix $(DIR_PROJECT)/, $(DIR_COMMON_INC)) \
			CMD_CFG:=$(addprefix $(DIR_PROJECT)/, $(CMD_CFG)) \
			MOD_CFG:=$(addprefix $(DIR_PROJECT)/, $(MOD_CFG)) \
			MOD_RULE:=$(addprefix $(DIR_PROJECT)/, $(MOD_RULE)) && \
	cd .. ; 
endef

all : compile $(APP)
	@echo "Success! Target ==> $(APP)"

# 遍历目录来执行子模块的编译
compile : $(DIR_BUILD) $(DIR_BUILD_SUB)
	@echo "Begin to compile ..."
	@set -e; \
	for dir in $(MODULES); \
	do \
		$(call makemodule, $$dir) \
	done
	@echo "Compile Success!"

# 子模块执行完，将 .a文件更新，导致此规则执行
link $(APP) : $(MODULE_LIB)
	@echo "Begin to link ..."
	$(CC) -o $(APP) -Xlinker "-(" $^ -Xlinker "-)" $(LFLAGS)
	@echo "Link Success!"

# 创建相关目录
$(DIR_BUILD) $(DIR_BUILD_SUB) : 
	$(MKDIR) $@
	
clean : 
	@echo "Begin to clean ..."
	$(RM) $(DIR_BUILD)
	@echo "Clean Success!"
	
rebuild : clean all

# 单独的子模块编译
# common（目录名），依赖bulid/common（目录间的依赖）
$(MODULES) : $(DIR_BUILD) $(DIR_BUILD)/$(MAKECMDGOALS)
	@echo "Begin to compile $@"
	@set -e; \
	$(call makemodule, $@)
	
