; Password generator
; #########################################################################

GdiplusStartupInput struct
        GdiplusVersion                  DWORD ?
        DebugEventCallback              DWORD ?
        SuppressBackgroundThread        DWORD ?
        SuppressExternalCodecs          DWORD ?
GdiplusStartupInput ends

ImageCodecInfo struct
        Clsid                           CLSID <>
        FormatID                        GUID <>
        CodecName                       DWORD ?
        DllName                         DWORD ?
        FormatDescription               DWORD ?
        FilenameExtension               DWORD ?
        MimeType                        DWORD ?
        Flags                           DWORD ?
        Version                         DWORD ?
        SigCount                        DWORD ?
        SigSize                         DWORD ?
        SigPattern                      DWORD ?
        SigMask                         DWORD ?
ImageCodecInfo ends

.data
        szArial                 db      "Arial",0
        szImgEncoderBmp         db      "image/bmp",0
        szImgEncoderGif         db      "image/gif",0
        szImgEncoderJpeg        db      "image/jpeg",0
        szGDIPlus               db      "gdiplus.dll",0,"GdiplusStartup",0,"GdiplusShutdown",0,"GdipGetImageEncodersSize",0,"GdipGetImageEncoders",0,"GdipLoadImageFromStream",0,"GdipSaveImageToFile",0,"GdipDisposeImage",0,0

.data?
        ; Do not change order
        GdiplusStartup          dd      ?
        GdiplusShutdown         dd      ?
        GetImageEncodersSize    dd      ?
        GetImageEncoders        dd      ?
        LoadImageFromStream     dd      ?
        SaveImageToFile         dd      ?
        DisposeImage            dd      ?

.code

BMP_COLORS equ 16       ; Must be >= 16

CreateBitmapInfoStruct proc uses edi hBmp: DWORD
        LOCAL   bmp: BITMAP

        invoke  GetObject, hBmp, sizeof BITMAP, addr bmp
        mov     bmp.bmBitsPixel, BMP_COLORS ; force pixel format
        movzx   eax, bmp.bmPlanes 
        xor     edx, edx
        movzx   ecx, bmp.bmBitsPixel
        mul     ecx

        invoke  LocalAlloc, LPTR, sizeof BITMAPINFOHEADER
        mov     edi, eax
        assume  edi: ptr BITMAPINFOHEADER
        mov     [edi].biSize, sizeof BITMAPINFOHEADER
        m2m     [edi].biWidth, bmp.bmWidth
        m2m     [edi].biHeight, bmp.bmHeight 
        m2m     [edi].biPlanes, bmp.bmPlanes 
        m2m     [edi].biBitCount, bmp.bmBitsPixel
        mov     [edi].biCompression, BI_RGB
        mov     eax, [edi].biWidth
        xor     edx, edx
        mov     ecx, BMP_COLORS
        mul     ecx
        add     eax, 31
        and     eax, not 31
        shr     eax, 3
        xor     edx, edx
        mul     [edi].biHeight
        mov     [edi].biSizeImage, eax
        assume  edi: nothing

        mov     eax, edi
        ret
CreateBitmapInfoStruct endp

; Returns true on success         
CreateBitmapFile proc uses ebx edi szBmpFile, hBmp, hDC: DWORD
        LOCAL   pbi: DWORD
        LOCAL   hFile, lpBits, dwTmp: DWORD
        LOCAL   hdr: BITMAPFILEHEADER 

        xor     edi, edi

        invoke  CreateBitmapInfoStruct, hBmp
        mov     pbi, eax

        mov     ebx, pbi
        assume  ebx: ptr BITMAPINFOHEADER
        invoke  GlobalAlloc, GMEM_FIXED, [ebx].biSizeImage
        mov     lpBits, eax

        ; Get bitmap bits
        invoke  GetDIBits, hDC, hBmp, 0, [ebx].biHeight, lpBits, pbi, DIB_RGB_COLORS
        test    eax, eax
        jz      @clean_up

        invoke  CreateFile, szBmpFile, GENERIC_READ or GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
        mov     hFile, eax
        inc     eax
        jz      @clean_up

        invoke  ZeroMemory, addr hdr, sizeof hdr
        mov     hdr.bfType, 04d42h
        mov     eax, BITMAPFILEHEADER
        add     eax, [ebx].biSize
        mov     hdr.bfOffBits, eax
        add     eax, [ebx].biSizeImage
        mov     hdr.bfSize, eax

        ; Copy the BITMAPFILEHEADER into the .BMP file
        invoke  WriteFile, hFile, addr hdr, sizeof BITMAPFILEHEADER, addr dwTmp, NULL

        ; Copy the BITMAPINFOHEADER into the file
        invoke  WriteFile, hFile, pbi, sizeof BITMAPINFOHEADER, addr dwTmp, NULL
        
        ; Copy the array of color indices into the .BMP file
        invoke  WriteFile, hFile, lpBits, [ebx].biSizeImage, addr dwTmp, NULL

        ; Clean up
        invoke  CloseHandle, hFile

        ; Return true
        inc     edi

@clean_up:
        invoke  GlobalFree, lpBits
        assume  ebx: nothing
        invoke  LocalFree, ebx
        invoke  DeleteDC, hDC
        invoke  DeleteObject, hBmp

        mov     eax, edi
        ret
CreateBitmapFile endp

; Returns hBitmap in eax, and hDC in ecx
CreatePassBitmap proc uses ebx szPass, W, H: DWORD
        LOCAL   dc: DWORD
        LOCAL   rect: RECT

        mov     rect.left, 0
        m2m     rect.right, W
        mov     rect.top, 0
        m2m     rect.bottom, H

        invoke  CreateCompatibleDC, 0
        mov     dc, eax
        invoke  GetDeviceCaps, dc, BITSPIXEL
        invoke  CreateBitmap, W, H, 1, eax, NULL
        mov     ebx, eax
        invoke  SelectObject, dc, eax
        invoke  SetBkMode, dc, TRANSPARENT
        invoke  FloodFill, dc, 0, 0, 0ffffffh
        invoke  Rand, 2
        push    eax
        invoke  Rand, 2
        pop     edx
        invoke  CreateFont, 16, 0, 0, 0, FW_BOLD, eax, edx, FALSE, ANSI_CHARSET, OUT_CHARACTER_PRECIS, CLIP_DEFAULT_PRECIS, 4, DEFAULT_PITCH, offset szArial
        push    eax
        invoke  SelectObject, dc, eax
        invoke  Rand, 6
        .IF     eax == 0
                mov     eax, 000cc50h
        .ELSEIF eax == 1
                mov     eax, 050cc00h
        .ELSEIF eax == 2
                mov     eax, 00050cch
        .ELSEIF eax == 3
                mov     eax, 0ff1010h
        .ELSEIF eax == 4
                mov     eax, 00020ffh
        .ELSE
                mov     eax, 0000000h
        .ENDIF
        invoke  SetTextColor, dc, eax
        invoke  DrawText, dc, szPass, -1, addr rect, DT_CENTER or DT_VCENTER or DT_SINGLELINE 
        call    DeleteObject

        mov     ecx, dc
        mov     eax, ebx
        ret
CreatePassBitmap endp

; Returns true on success
GenTextPass proc uses ebx szPass, szOutputFile: DWORD
        invoke  lstrlen, szPass
        mov     ebx, eax
        
        invoke  Rand, 5
        add     eax, 15
        push    eax
        invoke  Rand, 10
        .IF     ebx > 10
                ; Password img only
                add     eax, 115
        .ELSE
                add     eax, 55
        .ENDIF
        push    eax
        push    szPass
        call    CreatePassBitmap
        invoke  CreateBitmapFile, szOutputFile, eax, ecx
        ret
GenTextPass endp

; Returns true on success
FindEncoderCLSID proc uses ebx esi edi szEncoder, outCLSID: DWORD
        LOCAL   num, nsize, pImageCodecInfo, lstr: DWORD

        xor     edi, edi

        invoke  GlobalAlloc, GPTR, 8192
        mov     lstr, eax

        lea     eax, nsize
        push    eax
        lea     eax, num
        push    eax
        call    GetImageEncodersSize

        invoke  GlobalAlloc, GPTR, nsize
        mov     pImageCodecInfo, eax
        mov     ebx, eax

        push    eax
        push    nsize
        push    num
        call    GetImageEncoders

        assume  ebx: ptr ImageCodecInfo
        cmp     num, 0
        jz      @e

@l:
        invoke  WideCharToMultiByte, CP_ACP, 0, [ebx].MimeType, -1, lstr, 8191, NULL, NULL
        invoke  lstrcmpi, szEncoder, lstr
        .IF     !eax
                cld
                lea     esi, [ebx].Clsid
                mov     edi, outCLSID
                mov     ecx, sizeof GUID
                rep movsb
                mov     edi, 1
                jmp     @e
        .ENDIF
        add     ebx, sizeof ImageCodecInfo
        dec     num
        jnz     @l
        
@e:
        assume  ebx: nothing

        invoke  GlobalFree, pImageCodecInfo
        invoke  GlobalFree, lstr

        mov     eax, edi
        ret
FindEncoderCLSID endp

; Returns pointer to mime type, or NULL on error
GdipConvertImage proc uses ebx szWorkFile, Encoder: DWORD
        LOCAL   lzWorkFile: DWORD
        LOCAL   lpImgPtr, lpImgStream: DWORD
        
        xor     ebx, ebx

        invoke  StreamCreate, addr lpImgStream

        ; Convert string to unicode format
        invoke  GlobalAlloc, GPTR, 8192
        mov     lzWorkFile, eax
        invoke  MultiByteToWideChar, CP_ACP, 0, szWorkFile, -1, eax, 8191

        ; Load image into stream
        invoke  StreamLoadFromFile, lpImgStream, szWorkFile
        .IF     eax
                ; Load image from stream
                lea     eax, lpImgPtr
                push    eax
                push    lpImgStream
                call    LoadImageFromStream

                .IF     !eax
                        push    NULL
                        push    Encoder
                        push    lzWorkFile
                        push    lpImgPtr
                        call    SaveImageToFile

                        .IF     !eax
                                inc     ebx
                        .ENDIF

                        ; Free image
                        push    lpImgPtr
                        call    DisposeImage
                .ENDIF
        .ENDIF

        ; Clean up
        invoke  GlobalFree, lzWorkFile
        invoke  StreamFree, lpImgStream

        mov     eax, ebx
        ret
GdipConvertImage endp

; Returns pointer to mime-type on success, or NULL on error
GenTextPassImage proc uses ebx edi szPass, szOutFile: DWORD
        LOCAL   gdiplusToken: DWORD
        LOCAL   gdiplusStartupInput: GdiplusStartupInput
        LOCAL   lpImgGUID: GUID
        
        invoke  GenTextPass, szPass, szOutFile
        test    eax, eax
        jz      @gtp_ret

        mov     ebx, offset szImgEncoderBmp

        invoke  PayLoadDll, offset szGDIPlus, offset GdiplusStartup
        .IF     eax
                invoke  ZeroMemory, addr gdiplusStartupInput, sizeof GdiplusStartupInput
                mov     gdiplusStartupInput.GdiplusVersion, 1
                push    NULL
                lea     eax, gdiplusStartupInput
                push    eax
                lea     eax, gdiplusToken
                push    eax
                call    GdiplusStartup

                invoke  Rand, 2
                .IF     eax
                        mov     edi, offset szImgEncoderGif
                .ELSE
                        mov     edi, offset szImgEncoderJpeg
                .ENDIF
                invoke  FindEncoderCLSID, edi, addr lpImgGUID
                .IF     eax
                        invoke  GdipConvertImage, szOutFile, addr lpImgGUID
                        .IF     eax
                                mov     ebx, edi
                        .ENDIF
                .ENDIF
                push    gdiplusToken
                call    GdiplusShutdown
        .ENDIF

        mov     eax, ebx
@gtp_ret:
        ret
GenTextPassImage endp
