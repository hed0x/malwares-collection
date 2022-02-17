   --------------------------------------------------------------------------------
                            Delphi prepender with PE loader
                                     by Positron
                               http:\\positronvx.cjb.net
   --------------------------------------------------------------------------------

   Virus name:  Virus.Win32.Delf.b
   -------------------------------

   This virus demonstrates the new type of .exe prepender  (infector). The classic
   prepender virus writes itself at the begining of the infected exe. When you run
   the  infected file,  then the virus  will start,  drop the original file to the
   windows temp directory  and try execute it. There are many disadvantages of the
   classic prepender...

   Virus.Win32.Delf.b also adds itself to the beginning  of the infected file, but
   it will not drop the  original exe file when somebody starts it. The virus will
   dinamycally  load the original exe  into the memory space of a process that was
   created using the CreateProcess API with the CREATE_SUSPENDED parameter.

   Description of Technique
   ------------------------

   Under Windows, a process can be created in suspend mode using the CreateProcess
   API  with the  CREATE_SUSPENDED parameter.  The EXE image will  be loaded  into
   memory  by Windows  but execution will not  begin until the ResumeThread API is
   used.  Before  calling  ResumeThread  it is  possible to  read  and write  this
   process's memory space using API like ReadProcessMemory and WriteProcessMemory.
   This  makes it  possible to  overwrite the image of  the original  EXE with the
   image of another EXE,  thus enabling the execution of the second EXE within the
   memory space of the first EXE. This can be achieved with the following sequence
   of steps.

   1. Use  the CreateProcess API  with the  CREATE_SUSPENDED parameter to create a
      suspended process from any EXE file. (Call this the first EXE).

   2. Call GetThreadContext API to  obtain the register values (thread context) of
      the suspended process.  The EBX register of  the suspended process points to
      the process's PEB.  The EAX register contains the entry point of the process
      (first EXE).

   3. Obtain the baseaddress of the suspended process from its PEB,i.e. at [EBX+8]

   4. Load  the second EXE into memory (using ReadFile) and perform the neccessary
      alignment manually. This is required if the file alignment is different from
      the memory alignment

   5. If the second EXE has the same base-address as the suspended process and its
      image-size is <= to the image-size  of the suspended process, simply use the
      WriteProcessMemory function to write the image of  the second  EXE  into the
      memory space of the suspended process, starting at the base-address.

   6. Otherwise,  unmap  the  image of  the first  EXE  using ZwUnmapViewOfSection
      (exported by ntdll.dll) and use VirtualAllocEx to allocate enough memory for
      the second EXE within the memory space of the suspended process.
      The VirtualAllocEx  API must be supplied with the base-address of the second
      EXE to ensure that Windows will give us memory in the required region. Next,
      copy the  image of the  second EXE  into the memory  space  of the suspended
      process starting at the allocated address (using WriteProcessMemory).

   7. Patch the base-address of the second EXE into the suspended process's PEB at
      [EBX+8].

   8. Set EAX of the thread context to the entry point of the second EXE.

   9.  Use  the SetThreadContext API to modify the thread context of the suspended
       process.

   10. Use the ResumeThread API to resume execute of the suspended process.

   11. The virus  will work as a classic prepender if it can not execute  the file
       in the memory ( will dropp the original exe  into temp directory and run it
       with winexec function ).

   12. After  you run the  virus,  it will search  all exe files in  Kazaa  shared
       directory and will infect them

   Compile:
   --------
            - Run make.bat to compile the source! (Tested with Delphi 2005)
            - \ACLUnits
                   SysUtils and Registry units replacement.

   Thanks to:
   ----------
              - Tan Chew Keong for describing  the  Dynamic  Forking of  Win32 EXE
              - Aphex for source of Webexe.
