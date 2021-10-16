Attribute VB_Name = "modEncrypt"
'I designed this module for encrypting strings in a matter of seconds
'At first while thinking on how to reduce the size of the code I had
'to remember at all times that this had to be written to a file location
'so I added a piece of code to access the file and write the encrypted
'code into it, this module is just to encrypt and decrypt strings and
'not to write to files - (Thats a seperate piece of code which you can
'find in the main add and extract sub in the main form).

'I worked a bit more on my encryption to see if I could make it faster
'and I found that it works very much the same as the RC4 encryption.

Option Explicit
Private I As Integer
Private J As Integer
Private K As Integer
Private A As Byte
Private B As Byte
Dim M As Integer
Private L As Long
Private EncryptFileKEY(255) As Byte
Private ADDTABLE(255, 255) As Byte
Dim STATE(0 To 255) As Byte

Private Sub FILL_LINEAR()
    Dim bCONST(0 To 255) As Byte
    For M = 0 To 255
        bCONST(M) = M
        STATE(M) = bCONST(M)
    Next M
End Sub

Private Sub INITIALIZE_ADDTABLE()
    Static BeenHereDoneThat As Boolean
    If BeenHereDoneThat Then Exit Sub
    For J = 0 To 255
        For I = 0 To 255
            ADDTABLE(I, J) = CByte((I + J) And 255)
        Next I
    Next J
    BeenHereDoneThat = True
End Sub

Public Sub EncryptFile(BYTEARRAY() As Byte, Optional PASSWORD As String, Optional Filen As String)
    Dim PerCentGiven As Integer
    If PASSWORD <> "" Then PREPARE_KEY PASSWORD
    PerCentGiven = 0
    
    frmBusy.prgFile.Max = 100
    frmBusy.prgFile.Value = 0
    
    If ChkPro = 1 Then
        frmBusy.lblFile.Caption = "Encrypting file (" & Filen & ")"
    ElseIf ChkPro = -1 Then
        frmBusy.lblFile.Caption = "Decrypting file (" & Filen & ")"
    End If
    
    DoEvents

    For L = 0 To UBound(BYTEARRAY)
        I = ADDTABLE(I, 1)
        J = ADDTABLE(J, STATE(I))
        A = STATE(I): STATE(I) = STATE(J): STATE(J) = A
        B = STATE(ADDTABLE(STATE(I), STATE(J)))
        BYTEARRAY(L) = BYTEARRAY(L) Xor B
        PerCentGiven = L / UBound(BYTEARRAY) * 100
        If Int(PerCentGiven) <> frmBusy.prgFile.Value Then
            frmBusy.prgFile.Value = PerCentGiven
        End If
    Next L
End Sub

Private Sub PREPARE_KEY(sKEY As String)
    INITIALIZE_ADDTABLE
    FILL_LINEAR
    K = Len(sKEY)
    For I = 0 To K - 1
        B = Asc(Mid$(sKEY, I + 1, 1))
        For J = I To 255 Step K
            EncryptFileKEY(J) = B
        Next J
    Next I
    J = 0
    For I = 0 To 255
        K = ADDTABLE(STATE(I), EncryptFileKEY(I))
        J = ADDTABLE(J, K)
        B = STATE(I): STATE(I) = STATE(J): STATE(J) = B
    Next I
    I = 0
    J = 0
End Sub
