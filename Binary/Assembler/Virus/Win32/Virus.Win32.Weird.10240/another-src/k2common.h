
#define		KUANG2_PORT		17300
#define		BUFFER_SIZE		1024

// spisak komandi za KUANG2 protokol

#define		K2_HELO				0x324B4F59
#define		K2_ERROR			0x52525245
#define		K2_DONE				0x454E4F44
#define		K2_QUIT				0x54495551
#define		K2_DELETE_FILE		0x464C4544
#define		K2_RUN_FILE			0x464E5552
#define		K2_FOLDER_INFO		0x464E4946
#define		K2_DOWNLOAD_FILE	0x464E5744
#define		K2_UPLOAD_FILE		0x46445055

typedef struct {
	unsigned int command;
	union {
		char bdata[BUFFER_SIZE-4];
		struct {
			unsigned int param;
			char sdata[BUFFER_SIZE-8];
		};
	};
} Message, *pMessage;
