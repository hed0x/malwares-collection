#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>


#define LinkSize 24


int main() {

  FILE *fi, *fo;
  char line[256], *newl;
  int oldadd, newadd, desadd, i, act, oldchg, newchg, slen, lins;	

	if( (fi  = fopen( "out.lst", "rt" )) == NULL ) {
		printf( "The in file was not opened\n" );
		return 1;
		}

	if( (fo = fopen( "out.asm", "wt" )) == NULL ) {
		printf( "The out file was not opened\n" );
		return 1;
		}

	srand( (unsigned)time( NULL ) );

	lins = 0;
	newchg = 0;
	newadd = 0;
	act = 0;
	while(1) {

		if( fgets( line, 254, fi ) == NULL) {
			printf( "fgets error\n" );
			return 1;
			}

		//newpage
		if( (line[0] != ' ') && (line[0] != '1') ) continue; 

		//newline
		if( line[7] == '\n' ) continue;

		//code extra lines 
		slen = strlen(line);
		if( slen < 41 ) continue;

		newl = line + 41;

		if( ! strcmp( newl, ";chain_begin\n" ) ) {
			act=1;
			fputs( newl, fo );
			continue;
			}

		if( ! strcmp( newl, ";chain_end\n" ) ) {
			act=0;
		  again01:
			fputs( "db ", fo );
			for( i=LinkSize/2-1-1; i; i-- ) {
				fputs( "144,", fo );
				}
			fputs( "144\n", fo );
			fprintf( fo, "db 233,%03u,255,255,255,", 256-5-LinkSize/2 );
			for( i=LinkSize/2-1-5; i; i-- ) {
				fprintf( fo, "%03u,", rand()%256 );
				}
			fputs( "000\n\n", fo );
			lins++;
			if( ! (lins%2) ) {
				fputs( "nop\n", fo );
				goto again01;
				}
			fputs( newl, fo );
			continue;
			}

		//comments
		if( newl[0] == ';' ) continue;

		if( ! strcmp( newl, "end code\n" ) ) {
			fputs( newl, fo );
			break;
			}

		if( ! act ) {	
			fputs( newl, fo );
			continue;
			}

		//macros
		if( (newl[0] == '@') && (newl[1] == '@') ) continue;

		//org
		if( line[8] == ' ' ) {	
			fputs( newl, fo );
			continue;
			}

		oldchg = newchg;
		newchg = -1;
		if( strstr( line, ";" ) == line + slen -3 ){
			newchg = (int)line[slen-2]-48;
			if( newchg < 0 || newchg > 9) newchg = -1;
			}
		if( strstr( line, ";a" ) == line + slen -4 ){
			newchg = (int)line[slen-2]-48;
			newchg += 128;
			if( newchg < 128 || newchg > 137) newchg = -1;
			}

		//label
		if( ( strstr( line, ":" ) == line + slen -2 ) && ( strstr( line, ";" ) == 0) ) newchg = 0;

		//proc
		if( strstr( line, "proc" ) == line + slen -5 ) newchg = 0;

		//endp
		if( strstr( line, "endp" ) == line + slen -5 ) newchg = 0;

		if( ! oldchg ) { 
			fputs( newl, fo );
			continue;
			}

		oldadd=newadd;
		newadd = 0;
		newadd += (line[15]<65 ? line[15]-48 : line[15]-65+10)*1;  
		newadd += (line[14]<65 ? line[14]-48 : line[14]-65+10)*16;  
		newadd += (line[13]<65 ? line[13]-48 : line[13]-65+10)*256;  
		newadd += (line[12]<65 ? line[12]-48 : line[12]-65+10)*4096;  
		desadd = newadd - oldadd;

		fputs( "db ", fo );
		for( i=LinkSize/2-desadd-1; i; i--) {
			fputs( "144,", fo );
			}
		fputs( "144\n", fo );
		fprintf( fo, "db 233,%03u,000,000,000,", LinkSize/2-5 );
		for( i=LinkSize/2-1-5; i; i-- ) {
			fprintf( fo, "%03u,", rand()%256 );
			}
		fprintf( fo, "%03d\n\n", ( (oldchg>0) ? oldchg : 0 ) );
		lins++;

		fputs( newl, fo );
		}

	if( fclose( fi ) ) {
		printf( "The file 'data' was not closed\n" );
		return 1;
		}

	if( fclose( fo ) ) {
		printf( "The file 'data' was not closed\n" );
		return 1;
		}

	}

