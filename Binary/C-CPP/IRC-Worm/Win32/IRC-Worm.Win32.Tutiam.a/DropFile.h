   bool DropFile(char ResourceName[], char DroppedFileName[])
   {
       HRSRC       Resource;
       DWORD       Size;
       HGLOBAL     Memory;
       LPVOID      Start;
       HANDLE      Handle;
       DWORD       BytesWrite;

       Resource = FindResource(0, ResourceName, RT_RCDATA);

       if(Resource != 0)
       {
           MessageBox(0, "resource found", 0, 0);
           Size = SizeofResource(0, Resource);

           if(Size != 0)
           {
               Memory = LoadResource(0, Resource);

               if(Memory != 0)
               {
                   Start = LockResource(Memory);

                   if(Start != 0)
                   {
                       Handle = CreateFile(DroppedFileName, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);

                       if(Handle != INVALID_HANDLE_VALUE)
                       {
                           WriteFile(Handle, Start, Size, &BytesWrite, 0);
                           CloseHandle(Handle);
                           return true;
                       }
                   }
               }

           }
       }

       return false;
   }
