   // Win16/32 related Icon structures..

   #include <windows.h>

   #define SIZEOF_LARGE_ICON 0x2E8
   #define SIZEOF_SMALL_ICON 0x128

   #define SIZEOF_ICONS (SIZEOF_LARGE_ICON + SIZEOF_SMALL_ICON)

   // Icon format (ID = 03h)

   typedef struct _ICONIMAGE {
     BITMAPINFOHEADER icHeader;     // DIB header
     RGBQUAD          icColors[1];  // Color table
     BYTE             icXOR[1];     // DIB bits for XOR mask
     BYTE             icAND[1];     // DIB bits for AND mask
   } ICONIMAGE, *PICONIMAGE;

   // Group Icon format (ID = 0Eh)

   typedef struct _ICONDIRENTRY {
     BYTE   bWidth;                 // Width, in pixels, of the image
     BYTE   bHeight;                // Height, in pixels, of the image
     BYTE   bColorCount;            // Number of colors in image (0 if >=8bpp)
     BYTE   bReserved;              // Reserved
     WORD   wPlanes;                // Color Planes
     WORD   wBitCount;              // Bits per pixel
     DWORD  dwBytesInRes;           // how many bytes in this resource?
     WORD   nID;                    // the ID
   } ICONDIRENTRY, *PICONDIRENTRY;

   #define SIZEOF_ICONDIRENTRY sizeof(ICONDIRENTRY)

   typedef struct _ICONDIR {
     WORD            idReserved;    // Reserved (must be 0)
     WORD            idType;        // Resource type (1 for icons)
     WORD            idCount;       // How many images?
     ICONDIRENTRY    idEntries[1];  // The entries for each image
   } ICONDIR, *PICONDIR;

   #define SIZEOF_ICONDIR 6
