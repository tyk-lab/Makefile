
使用说明：

systype.sh，用来指明选择的系统平台
Make.define.linux，指明编译选项
Make.libapue.inc，编译静态库

lib文件夹放常用的源文件，编译时会编译为静态库，供各个子工程的文件使用

使用方法：
1. 创个子工程文件夹t_test
2. 参考t_test的子工程makefile，修改makefile
3. 添加自己的源文件
-> 可能需要在，在include文件夹的auqe.h下添加


注：
1. 该版本，仅是实现了两层makefile的连接，顶层makefile管理所有子工程的makefile
2. 没有实现自动编译，使用在makefile添加文件的方法，来编译新文件