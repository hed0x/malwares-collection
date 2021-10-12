/*
	BOOL is_email_exists(char *email)
	including email filter
*/

#include <stdio.h>
#include <windows.h>

#define uLong unsigned long
#define POLYNOMIAL (uLong)0xedb88320
static uLong crc_table[256];

uLong crc32(uLong crc, char const *buf, size_t len);
void make_crc_table();
BOOL is_crc_exists(unsigned long crc32);
void add_crc(unsigned long crc32);
BOOL is_email_exists(char *email);
void crc32_init(void);

#define HOW_MUCH_CRC 10240

struct _my_crc32 {
	int index;
	unsigned long crcs[HOW_MUCH_CRC];
	BOOL full;
};

struct _my_crc32 my_crc32;

/*int main(void){
	char *strs[] = { "aa", "bb", "cc", "ee","ee","aa","dd","bb"};

	crc32_init();	

	for(int i=0;i<8;i++){
		if(!is_email_exists(strs[i]))
			printf("%s\n",strs[i]);
	}

	return 0;
}*/

void crc32_init(void){
	my_crc32.index = 0;
	my_crc32.full = FALSE;
	make_crc_table();
}

BOOL is_email_exists(char *email){
	uLong uCrc;	

	/* email filter */

	char *pTLD;
	pTLD = email+strlen(email)-3;
	if(strncmp(pTLD,"hlp",3)==0) return TRUE;

	/* main proc */

	uCrc = crc32(0,email,strlen(email));
	if(!is_crc_exists(uCrc)){
		add_crc(uCrc);
		return FALSE;
	}

	return TRUE;
}

void add_crc(unsigned long crc32){
	my_crc32.crcs[my_crc32.index] = crc32;
	my_crc32.index++;
	return;		
}

BOOL is_crc_exists(unsigned long crc32){

	int index;

	if(my_crc32.index == HOW_MUCH_CRC){
		my_crc32.full = TRUE;
		my_crc32.index = 0;
	}

	if(!my_crc32.full)
		index = my_crc32.index;
	else
		index = HOW_MUCH_CRC;

	for(int i=0;i<index;i++){
		if(my_crc32.crcs[i] == crc32)
			return TRUE;
	}
	return FALSE;
}

void make_crc_table(void) {
	unsigned int i, j;
	uLong h = 1;
	crc_table[0] = 0;
	for (i = 128; i; i >>= 1) {
		h = (h >> 1) ^ ((h & 1) ? POLYNOMIAL : 0);
		/* h is now crc_table[i] */
		for (j = 0; j < 256; j += 2*i)
			crc_table[i+j] = crc_table[j] ^ h;
	}
}

uLong crc32(uLong crc, char const *buf, size_t len) {
	if (crc_table[255] == 0)
		make_crc_table();
	crc ^= 0xffffffff;
	while (len--)
		crc = (crc >> 8) ^ crc_table[(crc ^ *buf++) & 0xff];
	return crc ^ 0xffffffff;
}
