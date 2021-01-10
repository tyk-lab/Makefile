

文件介绍：
mod-cfg.mk，子模块的makefile必备变量
mod-rule.mk，子模块的makefile文件的产生规则
cmd-cfg.mk，编译器、连接器、其他命令的参数和变量

pro-cfg.mk，顶层模块的makefile必备变量
pro-rule.mk, 顶层模块产生文件的规则

makefile: 套壳文件，描述.mk文件的调用方式


结构逻辑：
-> 使用.a的方式嵌入模块文件
1. mod-rule.mk文件产生内部的中间文件
2. pro-rule.mk产生顶层文件，链接中间文件


添加目录修改：
-> 每添加一次目录，就需要修改 pro-cfg.mk
-> 若子模块结构不同，就需要修改 mod-cfg.mk

修改方向：
xxx.cfg.mk，修改目录等必要参数
cmd-cfg.mk，修改编译环境的变量（编译器，链接器，shell命令等）
xxx.rule.mk，修改文件产生的规则

