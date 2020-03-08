   'i made in VBS to try some new kinda poly
   'so anyway free0n said i MUST explain this :p
   'I think it would save alot of time if you just run it and see for yourself!
   'I think it's kinda kewl if your still into vbs/vba ect
   'can be ported to any language!


   DIM NewCode, remUnd, restore, strng, undPos
   SET systmObj = CreateObject("Scripting.FileSystemObject")
   SET fileStream = systmObj.OpenTextFile(systmObj.GetFile(WScript.ScriptFullName), 1)
   DO WHILE fileStream.AtEndOfStream <> TRUE
       curline = fileStream.ReadLine

           FOR i = 1 to 20
              IF instr(curline, chr(95)) then
                 undpos = instr(curline, chr(95))
                 remUnd = mid(curline, 1, undpos - 1)
                 restore = remUnd & fileStream.ReadLine
                 curline = restore
              END IF
           NEXT

       IF instr(curline, chr(34)) = 0 then
              curline = DoSplit(curline)
           END IF

           NewCode = NewCode & VBCRLF & curline

   LOOP
   fileStream.close()

   function DoSplit(line)
   randomize
     DIM pos, pr1, pr2, add, m
     DIM O(4)
     O(0)=chr(44)
     O(1)=chr(61)
     O(2)=chr(46)
     O(3)=chr(38)

     FOR i = 1 to len(line)
         m = mid(line, i, 1)
         IF m = O(0) OR m = O(1) OR m = O(2) OR m = O(3) then
                 pr1 = mid(line, 1, i)
                 pr2 = mid(line, i+1, len(line))
                 IF int(rnd * 2) + 1 = 2 THEN line = pr1 & Space(1) & chr(95) & vbcrlf & pr2
                 'msgbox line
         END IF
     NEXT

   DoSplit=line
   end function


   SET changes = systmObj.OpenTextFile(systmObj.GetFile(WScript.ScriptFullName), 2)
   changes.Write(NewCode)
   changes.Close
