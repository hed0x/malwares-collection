/*
 * Name: kstat v.1.1 libc.h
 * Date: Sun Feb 10 02:49:49 CET 2002
 * Author: FuSyS [fusys@s0ftpj.org, fusys@sikurezza.org]
 *
 * SoftProject Digital Security for Y2K
 * Sikurezza.org - Italian Security Mailinglist
 *
 * MOJITO-WARE LICENSE - This source code is like "THE BEER-WARE LICENSE" by
 * Poul-Henning Kamp <phk@FreeBSD.ORG> but you can give me in return a mojito.
 *
 * Tested on: Slackware 8 Linux MaNTRa 2.4.16 #4 i686 unknown
 */

#define SEEK_SET        0
typedef struct _IO_FILE FILE;
extern unsigned int sleep (unsigned int __seconds);
extern void *memmem (__const void *__haystack, size_t __haystacklen,
		__const void *__needle, size_t __needlelen);
extern FILE *fopen __P ((__const char *__restrict __filename,
                         __const char *__restrict __modes));
extern int fprintf (FILE *__restrict __stream,
                    __const char *__restrict __format, ...);
extern int fseek (FILE *__stream, long int __off, int __whence);
extern int fclose (FILE *__stream);
extern char *fgets __P ((char *__restrict __s, int __n,
                         FILE *__restrict __stream));
extern char *fputs __P ((__const char *__restrict __s,
			 FILE *__restrict __stream));
extern int fflush __P ((FILE *__stream));
extern int getchar __P(());
extern int getpid (void);
extern int atoi __P ((__const char *__nptr));
extern unsigned long int strtoul __P ((__const char *__restrict __nptr,
                                       char **__restrict __endptr,
                                       int __base));
extern int printf __P ((__const char *__restrict __format, ...));
extern int open __P ((__const char *__file, int __oflag, ...));
extern int close (int __fd);
extern __ptr_t realloc __P ((__ptr_t __ptr, size_t __size));
extern void free __P ((__ptr_t __ptr));
extern off_t lseek __P ((int __fd, off_t __offset, int __whence));
extern ssize_t read __P ((int __fd, __ptr_t __buf, size_t __nbytes));
extern ssize_t write __P ((int __fd, __ptr_t __buf, size_t __nbytes));
extern __ptr_t malloc __P ((size_t __size));
extern int system __P ((__const char *__command));
extern void exit (int __status);
