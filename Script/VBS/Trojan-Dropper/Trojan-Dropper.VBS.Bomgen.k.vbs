on error resume next
set wd=createobject("word.document")
wd.vbproject.vbcomponents.import "D:\Macro.Word.Batch-O-Matic.70.cls"
wd.SaveAs "D:\Macro.Word.Batch-O-Matic.70"
wd.Application.Quit
