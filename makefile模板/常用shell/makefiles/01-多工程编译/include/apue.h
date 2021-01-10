/*
 * Our own header, to be included before all standard system headers.
 */
#ifndef	_APUE_H
#define	_APUE_H

#define	MAXLINE	4096			/* max line length */

#define	MIN(a,b)	((a) < (b) ? (a) : (b))
#define	MAX(a,b)	((a) > (b) ? (a) : (b))

/******************************** globle_lib_start ***************************************/
#include <stdio.h>		/* for convenience */
#include <stdlib.h>		/* for convenience */
#include <stddef.h>		/* for offsetof */
#include <string.h>		/* for convenience */
#include <unistd.h>		/* for convenience */

#include <sys/types.h>
#include <sys/stat.h>

/******************************** system_lib_end ***************************************/

/******************************** t_stdio_start ***************************************/

int my_printf(const char *fmt,...);

/******************************** t_stdio_end ***************************************/

/******************************** t_error_start ***************************************/

void err_quit(const char *fmt, ...);
void err_exit(int, const char *, ...) __attribute__((noreturn));
void err_sys(const char *fmt, ...);
void err_ret(const char *fmt, ...);
/******************************** t_error_end ***************************************/



#endif	/* _APUE_H */

