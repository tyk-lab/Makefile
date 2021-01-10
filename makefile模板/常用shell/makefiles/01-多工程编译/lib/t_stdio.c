#include "apue.h"
#include <stdarg.h>

int my_printf(const char *fmt,...)
{
	char	buf[MAXLINE]; /*1024个字符长度*/

	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf,MAXLINE-1,fmt,ap);
	va_end(ap);

	return puts(buf); 
}


