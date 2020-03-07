   R0_OPENCREATFILE                equ     0D500h  ; Open/Create a file
   R0_OPENCREAT_IN_CONTEXT         equ     0D501h  ; Open/Create file in current context
   R0_READFILE                     equ     0D600h  ; Read a file, no context
   R0_WRITEFILE                    equ     0D601h  ; Write to a file, no context
   R0_READFILE_IN_CONTEXT          equ     0D602h  ; Read a file, in thread context
   R0_WRITEFILE_IN_CONTEXT         equ     0D603h  ; Write to a file, in thread context
   R0_CLOSEFILE                    equ     0D700h  ; Close a file
   R0_GETFILESIZE                  equ     0D800h  ; Get size of a file
   R0_FINDFIRSTFILE                equ     04E00h  ; Do a LFN FindFirst operation
   R0_FINDNEXTFILE                 equ     04F00h  ; Do a LFN FindNext operation
   R0_FINDCLOSEFILE                equ     0DC00h  ; Do a LFN FindClose operation
   R0_FILEATTRIBUTES               equ     04300h  ; Get/Set Attributes of a file
   R0_RENAMEFILE                   equ     05600h  ; Rename a file
   R0_DELETEFILE                   equ     04100h  ; Delete a file
   R0_LOCKFILE                     equ     05C00h  ; Lock/Unlock a region in a file
   R0_GETDISKFREESPACE             equ     03600h  ; Get disk free space
   R0_READABSOLUTEDISK             equ     0DD00h  ; Absolute disk read
   R0_WRITEABSOLUTEDISK            equ     0DE00h  ; Absolute disk write

   ACCESS_MODE_MASK                equ     00007h  ; Mask for access mode bits
   ACCESS_READONLY                 equ     00000h  ; open for read-only access
   ACCESS_WRITEONLY                equ     00001h  ; open for write-only access
   ACCESS_READWRITE                equ     00002h  ; open for read and write access
   ACCESS_EXECUTE                  equ     00003h  ; open for execute access

   ACTION_MASK                     equ     0ffh    ; Open Actions Mask
   ACTION_OPENEXISTING             equ     001h    ; open an existing file
   ACTION_REPLACEEXISTING          equ     002h    ; open existing file and set length
   ACTION_CREATENEW                equ     010h    ; create a new file, fail if exists
   ACTION_OPENALWAYS               equ     011h    ; open file, create if does not exist
   ACTION_CREATEALWAYS             equ     012h    ; create a new file, even if it exists

   GET_ATTRIBUTES                  equ     0       ; get attributes of file/dir
   SET_ATTRIBUTES                  equ     1       ; set attributes of file/dir
