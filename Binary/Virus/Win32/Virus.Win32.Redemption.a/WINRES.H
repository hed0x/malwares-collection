   //Win16 (NE) related resource structures..

   typedef struct {
     WORD  ID;
     WORD  count;
     DWORD function;
   } RESOURCE_TYPE, *PRESOURCE_TYPE;

   typedef struct {
     WORD    offset;
     WORD    length;
     WORD    flags;
     WORD    ID;
     WORD    handle;
     WORD    usage;
   } RESOURCE_INFO, *PRESOURCE_INFO;
