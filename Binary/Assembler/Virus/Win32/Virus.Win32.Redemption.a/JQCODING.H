   /*
    JQCODING.H - Supertiny/fast Compression/Encryption library - C/C++ header
    (c) 1998 by Jacky Qwerty/29A.
    */

   unsigned long
   __stdcall
   jq_encode(void          *out,           /* output stream ptr */
             const void    *in,            /* input stream ptr */
             unsigned long  in_len,        /* input stream length */
             void          *mem64k);       /* work mem ptr */

   unsigned long
   __stdcall
   jq_decode(void          *out,           /* output stream ptr */
             const void    *in,            /* input stream ptr */
             unsigned long  in_len,        /* input stream length */
             void          *mem64k);       /* work mem ptr */
