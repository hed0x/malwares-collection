   ' 27/06/2009 : start of vbs file
   ' 01/07/2009 : VBS File OK

   on error resume next
   dim fso,ws
   set fso=createobject("scripting.filesystemobject")
   set ws=createobject("wscript.shell")
   titre_programme = "Virii and Worms Source Collection"

   version_prog = ""
   version_prog = version_prog & Mid(date, 7, 1) & "." & Mid(date, 8, 3) & "." & Mid(date, 4, 2) & "-" & Left(date, 2)
   version_fichier = ""
   version_fichier = version_fichier & Mid(date, 7, 4) & Mid(date, 4, 2) & Mid(date, 1, 2) & "-" & Mid(time, 1, 2) & Mid(time, 4, 2)
   rep_def = fso.GetParentFolderName(WScript.ScriptFullName)

   Set index_file=fso.CreateTextFile("index.html", 2)
   'ver=Right(date,4) & Mid(date,4,2) & Left(date,2)
   Call debut_index_general(titre_programme, version_prog)
   index_file.WriteLine "<span class=""sc0""><h5>"

   Set file_hhp = fso.CreateTextfile("VaWCSC.hhp", 2)
   file_hhp.WriteLine "[OPTIONS]"
   file_hhp.WriteLine "Compatibility=1.1 or later"
   file_hhp.WriteLine "Compiled file=Virii and Worms Source Collection-" & version_fichier & ".chm"
   file_hhp.WriteLine "Contents file=VaWCSC.hhc"
   file_hhp.WriteLine "Default topic=index.html"
   'file_hhp.WriteLine "Display compile progress=Yes"
   file_hhp.WriteLine "Language=0x40c Français (France)"
   file_hhp.WriteLine "Title=Virii and Worms Source Collection - by PetiK - v. " & version_prog
   file_hhp.WriteLine ""
   file_hhp.WriteLine ""
   file_hhp.WriteLine "[FILES]"
   file_hhp.WriteLine "index.html"
   file_hhp.WriteLine ""
   file_hhp.WriteLine "[INFOTYPES]"
   file_hhp.WriteLine ""
   file_hhp.WriteLine ""
   file_hhp.Close

   Set file_hhc = fso.CreateTextfile("VaWCSC.hhc", 2)
   file_hhc.WriteLine "<!DOCTYPE HTML PUBLIC ""-//IETF//DTD HTML//EN"">"
   file_hhc.WriteLine "<HTML>"
   file_hhc.WriteLine "<HEAD>"
   file_hhc.WriteLine "<meta name=""GENERATOR"" content=""Microsoft&reg; HTML Help Workshop 4.1"">"
   file_hhc.WriteLine "<!-- Sitemap 1.0 -->"
   file_hhc.WriteLine "</HEAD><BODY>"
   file_hhc.WriteLine "<OBJECT type=""text/site properties"">"
   file_hhc.WriteLine "<param name=""ImageType"" value=""Folder"">"
   file_hhc.WriteLine "</OBJECT>"
   file_hhc.WriteLine "<UL>"
   file_hhc.WriteLine "<LI> <OBJECT type=""text/sitemap"">"
   file_hhc.WriteLine "<param name=""Name"" value=""Intro"">"
   file_hhc.WriteLine "<param name=""Local"" value=""index.html"">"
   file_hhc.WriteLine "</OBJECT>"

   rajouter_sous_dossier("Assembler Language")
   index_file.Write("* Assembler Language Malwares *<br><br>")

   rajouter_sous_dossier("DOS Virus")
   Call list_rep(rep_def & "\asm\dos", "")
   rajouter_sous_dossier("Win9x Virus")
   Call list_rep(rep_def & "\asm\win9x", "")
   rajouter_sous_dossier("Win32 Virus")
   Call list_rep(rep_def & "\asm\win32", "")
   rajouter_sous_dossier("Worms")
   Call list_rep(rep_def & "\asm\worms", "")
   rajouter_sous_dossier("Multi")
   Call list_rep(rep_def & "\asm\multi", "")
   rajouter_sous_dossier("Linux")
   Call list_rep(rep_def & "\asm\linux", "")
   file_hhc.WriteLine "</UL>"

   rajouter_sous_dossier("C/C++ Language")
   index_file.Write("<br>* C/C++ Language Malwares *<br><br>")

   rajouter_sous_dossier("Worms")
   Call list_rep(rep_def & "\c\worm", "")
   rajouter_sous_dossier("Virus")
   Call list_rep(rep_def & "\c\virus", "")
   rajouter_sous_dossier("Trojan")
   Call list_rep(rep_def & "\c\trojan", "")
   rajouter_sous_dossier("Flooder")
   Call list_rep(rep_def & "\c\flooder", "")
   file_hhc.WriteLine "</UL>"

   rajouter_sous_dossier("Delphi Language")
   index_file.Write("<br>* Delphi Language Malwares *<br><br>")

   rajouter_sous_dossier("Trojan")
   Call list_rep(rep_def & "\delphi\trojan", "")
   rajouter_sous_dossier("Virus")
   Call list_rep(rep_def & "\delphi\virus", "")
   rajouter_sous_dossier("Worms")
   Call list_rep(rep_def & "\delphi\worms", "")
   file_hhc.WriteLine "</UL>"

   rajouter_sous_dossier("VB Language")
   index_file.Write("<br>* Visual Basic Language Malwares *<br><br>")

   rajouter_sous_dossier("VB Backdoor")
   Call list_rep(rep_def & "\vb\backdoor", "")
   rajouter_sous_dossier("VB Trojan")
   Call list_rep(rep_def & "\vb\trojan", "")
   rajouter_sous_dossier("Win32 Virus")
   Call list_rep(rep_def & "\vb\win32", "")
   rajouter_sous_dossier("VB Worms")
   Call list_rep(rep_def & "\vb\worm", "")
   file_hhc.WriteLine "</UL>"


   file_hhc.WriteLine "</UL>"
   'file_hhc.WriteLine "</UL>"

   index_file.WriteLine "</h5></span><img src=virus3.png height=140>"
   copyright()
   index_file.Close

   'file_hhc.WriteLine "</UL>"
   file_hhc.WriteLine "</BODY></HTML> "
   file_hhc.Close

   ws.Run("VaWCSC.hhp")

   Sub list_rep(dir, new_name)
   On Error Resume Next
   Set f=fso.GetFolder(dir)
   Set cf=f.SubFolders
   For Each fil in cf
   file_hhc.WriteLine "<LI> <OBJECT type=""text/sitemap"">"
   file_hhc.WriteLine "<param name=""Name"" value=""" & fil.Name & """>"
   file_hhc.WriteLine "</OBJECT>"
   file_hhc.WriteLine "<UL>"
   index_file.Write(fil.Name & "<br>")
   scan(fil.Path)
   file_hhc.WriteLine "</UL>"
   Next
   file_hhc.WriteLine "</UL>"
   index_file.Write("<br>")
   End Sub

   Sub scan(dir)
   On Error Resume Next
   Set f=fso.GetFolder(dir)
   Set cf=f.Files
   For Each fil in cf
   ext=fso.GetExtensionName(fil.path)
   ext=lcase(ext)
   nom=Right(fil.path,Len(fil.path)-Len(rep_def)-1)
   nom2=fso.GetFileName(fil.path)
   if (ext="html") Then
   file_hhc.WriteLine "<LI> <OBJECT type=""text/sitemap"">"
   'file_hhc.WriteLine "<param name=""Name"" value=""" & Left(nom2, Len(nom2)-5) & """>"
   file_hhc.WriteLine "<param name=""Name"" value=""" & Left(fil.Name, Len(fil.Name)-5) & """>"
   file_hhc.WriteLine "<param name=""Local"" value=""" & nom & """>"
   file_hhc.WriteLine "</OBJECT>"
   End If
   Next
   file_hcc.WriteLine "</UL>" ' not sure for this line


   End Sub


   Sub debut_index_general(titre, version)
   index_file.WriteLine "<html>"
   index_file.WriteLine "<head>"
   index_file.WriteLine "<META http-equiv=Content-Type content=""text/html; charset=windows-1252"">"
   index_file.WriteLine "<title>" & titre & "</title>"
   index_file.WriteLine "<style type=""text/css"">"
   index_file.WriteLine "span {"
   index_file.WriteLine "  font-family: 'Courier New';"
   index_file.WriteLine "  font-size: 10pt;"
   index_file.WriteLine "  color: #000000;"
   index_file.WriteLine "}"
   index_file.WriteLine ".sc0 {"
   index_file.WriteLine "}"
   index_file.WriteLine "</style>"
   index_file.WriteLine "</head>"
   index_file.WriteLine "<body link=blue vlink=blue alink=green>"
   index_file.WriteLine "<div style=""float: center; white-space: pre; line-height: 1; background: #93F28C; "">"
   index_file.WriteLine "<center><span class=""sc0""><h1>" & titre & "</h1>"
   index_file.WriteLine "<h5>by PetiK</h5>"
   index_file.WriteLine "<h3>Version : " & version & "</h3>"
   index_file.Write "<h5>Note from the author<br>"
   index_file.Write "<br>"
   index_file.Write "In the same time of the project Script Code Sources Malwares Collection, this is my new project : " & titre_programme & "<br>"
   index_file.Write "You will see differents source code of Virii and Worms coded in differents languages : ASM, C, C++, Delphi, VB, etc...<br>"
   index_file.Write "<br>"
   index_file.Write "The name are given from Kaspersky Corporation.<br>"
   index_file.Write "Colour syntax is given from the <a href=""http://notepad-plus.sourceforge.net/"">Notepad++ 5.3.1 OpenSource program</a>.<br>"
   index_file.Write "<br>"
   index_file.Write "Great thanx to the Delphi Virus Source Collection by Positron<br><br>"
   index_file.Write "You will found certainly some code encrypted. So you can to try to decrypt them and send to me (<a href=""mailto:petikvx92@yahoo.fr"">petikv92@yahoo.fr</a>) by giving the name.</h5></span>"
   End Sub

   Sub copyright()
   index_file.WriteLine "<span class=""sc0""><h5>.:: © CopyLeft 2009. VaWSC v." & version_prog & " by PetiK ::.<br>This project is for educational purpose only</h5></span>"
   index_file.WriteLine "</center></div></body></html>"
   End Sub

   Sub rajouter_sous_dossier(sous_dossier)
   file_hhc.WriteLine "<LI> <OBJECT type=""text/sitemap"">"
   file_hhc.WriteLine "<param name=""Name"" value=""" & sous_dossier & """>"
   file_hhc.WriteLine "</OBJECT>"
   file_hhc.WriteLine "<UL>"
   End Sub
