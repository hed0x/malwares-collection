	/*  v_std.h file
 borrowed from standard include files 	*/
#ifndef __V_STD_H_
#define __V_STD_H_

#define _Cdecl  cdecl

  /* from standard string.h */

typedef unsigned size_t;
char	*_Cdecl strcat	(char *dest,  char *src);
char	*_Cdecl strcpy	(char *dest, char *src); /* changed */
int	 _Cdecl strcmp	(const char *s1, const char *s2);
size_t	 _Cdecl strlen	(const char *s);

   /* from stdio.h */

int      _Cdecl puts     (const char *s);

	/* from dos.h	*/

struct WORDREGS {
	unsigned int	ax, bx, cx, dx, si, di, cflag, flags;
};

struct BYTEREGS {
	unsigned char	al, ah, bl, bh, cl, ch, dl, dh;
};

union	REGS	{
	struct	WORDREGS x;
	struct	BYTEREGS h;
};

struct	SREGS	{
	unsigned int	es;
	unsigned int	cs;
	unsigned int	ss;
	unsigned int	ds;
};


#define FP_OFF(fp)	((unsigned)(fp))
#define FP_SEG(fp)	((unsigned)((unsigned long)(fp) >> 16))
#define MK_FP(seg,ofs)	((void far *) \
			   (((unsigned long)(seg) << 16) | (unsigned)(ofs)))



typedef struct {
	char	drive;		/* do not change	*/
	char	pattern [13];	/*  these fields,	*/
	char	reserved [7];	/*   Microsoft reserved */
	char	attrib;
	short	time;
	short	date;
	long	size;
	char	nameZ [13];	/* result of the search, asciiz */
}	dosSearchInfo;	/* used with DOS functions 4E, 4F	*/

#define poke(a,b,c)	(*((int  far*)MK_FP((a),(b))) = (int)(c))
#define pokeb(a,b,c)	(*((char far*)MK_FP((a),(b))) = (char)(c))
#define peek(a,b)	(*((int  far*)MK_FP((a),(b))))
#define peekb(a,b)	(*((char far*)MK_FP((a),(b))))

#define FA_RDONLY	0x01		/* Read only attribute */
#define FA_HIDDEN	0x02		/* Hidden file */
#define FA_SYSTEM	0x04		/* System file */
#define FA_LABEL	0x08		/* Volume label */
#define FA_DIREC	0x10		/* Directory */
#define FA_ARCH		0x20		/* Archive */

int	 _Cdecl int86	(int intno, union REGS *inregs, union REGS *outregs);
int	 _Cdecl int86x	(int intno, union REGS *inregs, union REGS *outregs,
			 struct SREGS *segregs);
int	 _Cdecl intdos	(union REGS *inregs, union REGS *outregs);
int	 _Cdecl intdosx	(union REGS *inregs, union REGS *outregs,
			 struct SREGS *segregs);

	/* from io.h */

struct	ftime	{
	unsigned	ft_tsec	 : 5;	/* Two second interval */
	unsigned	ft_min	 : 6;	/* Minutes */
	unsigned	ft_hour	 : 5;	/* Hours */
	unsigned	ft_day	 : 5;	/* Days */
	unsigned	ft_month : 4;	/* Months */
	unsigned	ft_year	 : 7;	/* Year */
};

#define SEEK_CUR	1
#define SEEK_END	2
#define SEEK_SET	0

int  _Cdecl close	 (int handle);
long _Cdecl filelength	 (int handle);
long _Cdecl lseek	 (int handle, long offset, int fromwhere);
int  _Cdecl _open	 (const char *path, int oflags);
int  _Cdecl read	 (int handle, void *buf, unsigned len);
long _Cdecl tell	 (int handle);
int  _Cdecl write	 (int handle, void *buf, unsigned len);
int  _Cdecl getftime	 (int handle, struct ftime *ftimep);
int  _Cdecl setftime	 (int handle, struct ftime *ftimep);

	/* from FCNTL.H */

#define O_RDONLY	     0            /* CHANGED !!!*/
#define O_WRONLY	     1
#define O_RDWR		     2

	/* from dir.h */

int	 _Cdecl chdir		(const char *path);
int _Cdecl findfirst(const char *path,int attrib); /* changed !*/
int	 _Cdecl findnext(void);


struct	ffblk	{
	char		ff_reserved[21];
	char		ff_attrib;
	unsigned	ff_ftime;
	unsigned	ff_fdate;
	long		ff_fsize;
	char		ff_name[13];
};
void	 _Cdecl setvect	(int interruptno, void interrupt (*isr) ());
void	interrupt 	(* _Cdecl getvect(int interruptno)) ();

#endif
