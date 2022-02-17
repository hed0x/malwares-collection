   /*
       I have not coded this class, i have token it from a
       web. I dont say here who is the autor becoz i dont
       know him and im not sure if he would like i said it.
       Thx him anyway.
   */

   #ifndef FILE_H
   #define FILE_H

   #include <f32file.h>

   class File {
       public:
           enum OpenMode {OMRead = 1,OMWrite = 2,OMText = 4,OMCreate = 8,OMReplace = 16,OMOpen = 32};

           bool Open(const TDesC &,unsigned int mode);
           void Close();
           int Read(void *buff,int length);
           int Write(void *buff,int length);
           void Seek(TSeek mode,int offSet);
           RFs fsSession;
           RFile rFile;
   };

   #endif
