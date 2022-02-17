
#define MAXKEYBYTES 56 // 448 bits

struct CTX
{
  unsigned long P[ 16 + 2] ;

  unsigned long S[ 4][ 256] ;

} ;

typedef struct CTX BLOWFISH_CTX ;

// Private
//

void			Blowfish_Init		( BLOWFISH_CTX *ctx, unsigned char *key, int keyLen) ;

void			Blowfish_Encrypt	( BLOWFISH_CTX *ctx, unsigned long *xl, unsigned long *xr) ;

void			Blowfish_Decrypt	( BLOWFISH_CTX *ctx, unsigned long *xl, unsigned long *xr) ;

// Public
//

unsigned long	GetOutputLength		( unsigned long lInputLong) ;

unsigned long	Blowfish_Encode		( BLOWFISH_CTX *ctx, unsigned char *buffer, unsigned long size) ;

void			Decode				( BLOWFISH_CTX *ctx, unsigned char *buffer, unsigned long size) ;

