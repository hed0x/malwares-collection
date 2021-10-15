/* Generated automatically by configure */
#ifdef HAVE_DRIVE_LETTERS
  #define G10_LOCALEDIR "c:/lib/gnupg/locale"
  #define GNUPG_LIBDIR  "c:/lib/gnupg"
  #define GNUPG_DATADIR "c:/lib/gnupg"
  #define GNUPG_HOMEDIR "c:/gnupg"
#else
  #define G10_LOCALEDIR "/usr/local//locale"
  #define GNUPG_LIBDIR  "/usr/local/lib/gnupg"
  #define GNUPG_DATADIR "/usr/local/share/gnupg"
  #ifdef __VMS
    #define GNUPG_HOMEDIR "/SYS$LOGIN/gnupg" 
  #else
    #define GNUPG_HOMEDIR "~/.gnupg" 
  #endif
#endif
/* This file defines some basic constants for the MPI machinery.  We
 * need to define the types on a per-CPU basis, so it is done with
 * this file here.  */
#define BYTES_PER_MPI_LIMB  (SIZEOF_UNSIGNED_LONG)






