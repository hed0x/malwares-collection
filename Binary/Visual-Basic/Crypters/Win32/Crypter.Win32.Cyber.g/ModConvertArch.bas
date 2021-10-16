Attribute VB_Name = "ModConvertArch"
Public CheckHeader As String
Public ArchName As String

Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SystemTime) As Long

Private FILETIME As SystemTime
Private FileData As WIN32_FIND_DATA

Private Type FILETIME
        dwLowDateTime As Long
        dwHighDateTime As Long
End Type

Private Type WIN32_FIND_DATA
        dwFilechkattrib As Long
        ftCreationTime As FILETIME
        ftLastAccessTime As FILETIME
        ftLastWriteTime As FILETIME
        nFileSizeHigh As Long
        nFileSizeLow As Long
        dwReserved0 As Long
        dwReserved1 As Long
        cFileName As String * MAX_PATH
        cAlternate As String * 14
End Type

Private Type SystemTime
        wYear As Integer
        wMonth As Integer
        wDayOfWeek As Integer
        wDay As Integer
        wHour As Integer
        wMinute As Integer
        wSecond As Integer
        wMilliseconds As Integer
End Type

Private Function FindFile(sFileName As String) As WIN32_FIND_DATA
    Dim Win32Data As WIN32_FIND_DATA
    Dim plngFirstFileHwnd As Long
    Dim plngRtn As Long
    
    ' Find file and get file data
    plngFirstFileHwnd = FindFirstFile(sFileName, Win32Data)
    If plngFirstFileHwnd = 0 Then
        FindFile.cFileName = "Error"
    Else
        FindFile = Win32Data
    End If
    plngRtn = FindClose(plngFirstFileHwnd)
End Function

Public Function CyTConvertOpen(FName As String, ReturnList As ListView) As Boolean
    
    Dim DoCount As Long
    Dim WavName As String
    Dim Offset As Long
    Dim Size As Long
    Dim Name As String
    Dim LF As ListItem
    Dim LFS As ListSubItem
    
    DoCount = 0
    If CyTConvertValid2(FName) = True Then
        FileNumber = FreeFile
        Open FName For Binary As FileNumber
            Get FileNumber, 7, FileListStart
            If FileListStart = 0 Then
                CyTConvertOpen = False
                Close FileNumber
                Exit Function
            Else
                Do
                    Get FileNumber, FileListStart, Offset
                    FileListStart = FileListStart + 4
                    Get FileNumber, FileListStart, Size
                    FileListStart = FileListStart + 4
                    
                    Name = String$(255, Chr$(0))
                    Get FileNumber, FileListStart, Name
                    Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                    
                    If WavName = Name Then Close FileNumber: CyTConvertOpen = True: Exit Function
                    If DoCount = 0 Then WavName = Name
                    
                    FileListStart = FileListStart + (Len(Name) + 1)
                    DoCount = DoCount + 1
                    
                    Set LF = ReturnList.ListItems.Add(, , Name)
                    Set LFS = LF.ListSubItems.Add(, , Offset)
                    Set LFS = LF.ListSubItems.Add(, , Size)
                    
                Loop Until FileListStart > LOF(FileNumber)
            End If
            
            CyTConvertOpen = True
            
        Close FileNumber
    End If
End Function

Function CyTConvertValid(CyTFileName As String) As Boolean
    
    Dim Header As String
    
    Header = String$(6, Chr$(0))
    
    If FileExist(CyTFileName) = False Then
        CyTConvertValid = False
        Exit Function
    Else
        FileNumber = FreeFile
        Open CyTFileName For Binary As FileNumber
            Get FileNumber, 1, Header
            If Header = ArchType02 Then
                CyTConvertValid = True
                CompressionAgentA = True
                EncryptionAgentA = False
                SwapAgentA = False
                CheckHeader = Header
                Exit Function
            ElseIf Header = ArchType01 Then
                CyTConvertValid = True
                CompressionAgentA = False
                EncryptionAgentA = False
                SwapAgentA = False
                CheckHeader = Header
                Exit Function
            ElseIf Header = ArchType03 Then
                CyTConvertValid = True
                CompressionAgentA = False
                EncryptionAgentA = True
                SwapAgentA = False
                CheckHeader = Header
                Exit Function
            ElseIf Header = ArchType04 Then
                CyTConvertValid = True
                CompressionAgentA = False
                EncryptionAgentA = False
                SwapAgentA = True
                CheckHeader = Header
                Exit Function
            Else
                CyTConvertValid = False
            End If
        Close FileNumber
    End If
    
End Function

Function CyTConvertValid2(CyTFileName As String) As Boolean
    
    Dim Header As String
    
    Header = String$(6, Chr$(0))
    
    If FileExist(CyTFileName) = False Then
        CyTConvertValid2 = False
        Exit Function
    Else

        FileNumber = FreeFile
        Open CyTFileName For Binary As FileNumber
        
            Get FileNumber, 1, Header
            
            If Header = ArchType01 Or Header = ArchType02 Or Header = ArchType03 Or Header = ArchType04 Then
                MessageBox "This archive doesn't need converting into a newer archive as it is already a standard version. If this archive doesn't open in the main window then the archive could be corrupt.", OKOnly, Critical
                CyTConvertValid2 = False
                Exit Function
            End If
            
            If Header = "CYT2.0" Then
                CyTConvertValid2 = True
                CompressionAgentA = True
                EncryptionAgentA = False
                CheckHeader = Header
                Exit Function
            ElseIf Header = "CYT1.0" Then
                CyTConvertValid2 = True
                CompressionAgentA = False
                EncryptionAgentA = False
                CheckHeader = Header
                Exit Function
            ElseIf Header = "CYT3.0" Then
                CyTConvertValid2 = True
                CompressionAgentA = False
                EncryptionAgentA = True
                CheckHeader = Header
                Exit Function
            End If
        Close FileNumber
    End If
        
    CyTConvertValid2 = False
        
End Function

Function CyTConvertAdd(FileCyT As String, FileAdd As String, NameADD As String) As Boolean
    
    Dim FileName As String
    Dim FileNum As Integer
    Dim TempFileName As String
    Dim FileBytes() As Byte
    
    TempFileName = FileAdd
    
    ChkPro = 1
    
    On Error GoTo Erro
    
    If CompressionAgentA = True Then
        lnglngResult = CompressFile(FileAdd, TempRootS & "\" & NameADD, Val(CompressionLevel))
        FileAdd = TempRootS & "\" & NameADD
    End If
    
    If EncryptionAgentA = True Then
        FileName = FileAdd
        ReDim FileBytes(FileLen(FileName) - 1)
        FileNum = FreeFile
        Close FileNum
        Open FileName For Binary Access Read As FileNum
            Get FileNum, , FileBytes
        Close FileNum
        EncryptFile FileBytes, "PASSWORD", FileAdd
        
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            FileName = TempRootS & NameADD
        ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
            FileName = TempRootS & "\" & NameADD
        End If
        
        FileNum = FreeFile
        Close FileNum
        Open FileName For Binary Access Write As FileNum
            Put FileNum, , FileBytes
        Close FileNum
        
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            FileAdd = TempRootS & NameADD
        ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
            FileAdd = TempRootS & "\" & NameADD
        End If
        
    End If
    
    Dim BytesADD As String
    Dim OffSetADD As Long
    Dim SizeADD As Long
    Dim SizePacked As Long
    Dim LF As ListItem
    Dim LFS As ListSubItem
    
    NameADD = NameADD & Chr$(0)
    
    If FileExist(FileCyT) = False Or FileExist(FileAdd) = False Then
        CyTCyTConvertAddAdd = False
        Exit Function
    Else
        'Check if is a valid CyT file
        If CyTConvertValid(FileCyT) = True Then
            'Is a valid CyT file
            
            Close #1
            FileNumberCyT = 1 'FreeFile
            Open FileCyT For Binary As #FileNumberCyT
            
            'Get the FileList
            Get FileNumberCyT, 7, FileListStart
    
            'Get the FileList and put in the memory
            If FileListStart = 0 Then
                FileListStart = LOF(FileNumberCyT) + 1
                FileList = ""
            Else
                FileList = String(LOF(FileNumberCyT) - FileListStart + 1, Chr$(0))
                Get FileNumberCyT, FileListStart, FileList
            End If
    
            OffSetADD = FileListStart
            SizeADD = FileLen(FileAdd)
               
            'Put the file inside of the CyT
            Close #2
            FileNumberADD = 2 'FreeFile

            Open FileAdd For Binary As #FileNumberADD
                If LOF(FileNumberADD) > 1000000 Then
                
                If SwapAgentA = True Then
                    'Divid the file in parts to use less memory and make less swap
                    BytesADD = String(LOF(FileNumberADD) / 100, Chr$(0))
                    For Position = 1 To LOF(FileNumberADD) Step Len(BytesADD)
                        Get FileNumberADD, Position, BytesADD
                        Put FileNumberCyT, FileListStart, BytesADD
                        FileListStart = FileListStart + Len(BytesADD)
                    Next Position
                End If
                    
                    Position = -999999

                    Do
                        Position = Position + 1000000
                        If Position + 999999 > LOF(FileNumberADD) Then
                            BytesADD = String(LOF(FileNumberADD) - Position + 1, Chr$(0))
                        Else
                            BytesADD = String(1000000, Chr$(0))
                        End If
                        Get FileNumberADD, Position, BytesADD
                        Put FileNumberCyT, FileListStart, BytesADD
                        FileListStart = FileListStart + Len(BytesADD)
                    Loop Until Position + 999999 > LOF(FileNumberADD)
                    
                Else
                    BytesADD = String(LOF(FileNumberADD), Chr$(0))
                    Get FileNumberADD, 1, BytesADD
                    Put FileNumberCyT, FileListStart, BytesADD
                    FileListStart = FileListStart + Len(BytesADD)
                End If
            Close FileNumberADD
            
            
            FileData = FindFile(FileAdd)
            
            Dim DateAccess As String
            
            FileTimeToSystemTime FileData.ftCreationTime, FILETIME
            DateAccess = CStr(FILETIME.wDay & "/" & FILETIME.wMonth & "/" & FILETIME.wYear & " " & FILETIME.wHour & ":" & FILETIME.wMinute & ":" & FILETIME.wSecond)
            
            Dim DateAdded As String
            
            DateAdded = Date & " " & Time
                        
            'Add the new file in the FileList
            Put FileNumberCyT, 7, FileListStart
            Put FileNumberCyT, FileListStart, FileList
            Put FileNumberCyT, FileListStart + Len(FileList), OffSetADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 4, SizeADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 8, NameADD
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD), CStr(DateAccess & Chr(0))
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD) + Len(CStr(DateAccess & Chr(0))), CStr(FileLen(TempFileName) & Chr(0))
            Put FileNumberCyT, FileListStart + Len(FileList) + 8 + Len(NameADD) + Len(CStr(DateAccess & Chr(0))) + Len(CStr(FileLen(TempFileName) & Chr(0))), CStr(DateAdded & Chr(0))
            
            Close FileNumberCyT
            Close FileNumberADD
        Else
            CyTConvertAdd = False
            Close FileNumberCyT
            Close FileNumberADD
            Exit Function
        End If
    End If
    CyTConvertAdd = True
    
        KillFileActive TempRootS & "\" & Left(NameADD, Len(NameADD) - 1)
    Exit Function
    
Erro:
    CyTConvertAdd = False
    Exit Function
End Function

Function CyTConvertExtract(CyTFile As String, FileToExtract As String, DestinationFile As String) As Boolean
    
    ChkPro = -1
    
    'On Error GoTo FinaliseError
        
    Dim FileName As String
    Dim FileNum As Integer
    Dim FileBytes() As Byte
    
    Dim BytesExtract As String
    Dim Offset As Long
    Dim Size As Long
    Dim Name As String
    
    If FileExist(CyTFile) = False Or FileExist(DestinationFile) = True Then
        CyTConvertExtract = False
        Exit Function
    Else
        If CyTConvertValid2(CyTFile) = True Then
        
            Close #4
            FileNumber = 4 'FreeFile
            Open CyTFile For Binary As #FileNumber
                'Get the FileList
                Get FileNumber, 7, FileListStart
            
                If FileListStart = 0 Then
                    CyTConvertExtract = False
                    Close FileNumber
                    Exit Function
                Else
                    
    
                    Do
                        Get FileNumber, FileListStart, Offset
                        FileListStart = FileListStart + 4
                    
                        Get FileNumber, FileListStart, Size
                        FileListStart = FileListStart + 4
                                       
                        Name = String$(255, Chr$(0))
                        Get FileNumber, FileListStart, Name
                        Name = Mid(Name, 1, InStr(1, Name, Chr$(0)) - 1)
                        FileListStart = FileListStart + Len(Name) + 1
                                                
                        If Name = "" Or Offset = 0 Or Size = 0 Then
                            CyTConvertExtract = False
                            Close FileNumber
                            Exit Function
                        ElseIf LCase(Name) = LCase(FileToExtract) Then
                            Close #5
                            DestinationNumber = 5 'FreeFile
                            Open DestinationFile For Binary As #DestinationNumber
                                If Size > 100000 Then
                                    
                                    If SwapAgentA = True Then
                                        'Divid the file in parts to use less memory and make less swap
                                        BytesExtract = String(Size / 100, Chr$(0))
                                        For Position = 1 To Size Step Len(BytesExtract)
                                            Get FileNumber, Position + Offset, BytesExtract
                                            Put DestinationNumber, Position, BytesExtract
                                        Next Position
                                    End If
                                    
                                    Position = -1000000
                                    Do
                                        
                                        Position = Position + 1000000
                                        If Position + 999999 > Size Then
                                            BytesExtract = String(Size - Position, Chr$(0))
                                        Else
                                            BytesExtract = String(1000000, Chr$(0))
                                        End If
                                        Get FileNumber, Position + Offset, BytesExtract
                                        Put DestinationNumber, Position + 1, BytesExtract
                                    Loop Until Position + 999999 >= Size
                                Else
                                    BytesExtract = String(Size, Chr$(0))
                                    Get FileNumber, Offset, BytesExtract
                                    Put DestinationNumber, 1, BytesExtract
                                End If
                            Close DestinationNumber
                            Close FileNumber
                            CyTConvertExtract = True
                            
                            If CompressionAgentA = True Then
                                lnglngResult = DecompressFile(DestinationFile, DestinationFile)
                            End If
                            
                            If EncryptionAgentA = True Then
                                
                                If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                                    If FileExist(TempRootS & "INF~CYT10.tmp") = True Then KillFile TempRootS & "INF~CYT10.tmp"
                                    FileCopy DestinationFile, TempRootS & "INF~CYT10.tmp"
                                    FileName = TempRootS & "INF~CYT10.tmp"
                                ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                                    If FileExist(TempRootS & "\" & "INF~CYT10.tmp") = True Then KillFile TempRootS & "\" & "INF~CYT10.tmp"
                                    FileCopy DestinationFile, TempRootS & "\" & "INF~CYT10.tmp"
                                    FileName = TempRootS & "\" & "INF~CYT10.tmp"
                                End If
                                
                                ReDim FileBytes(FileLen(FileName) - 1)
                                FileNum = FreeFile
                                'Close FileName
                                Open FileName For Binary Access Read As FileNum
                                    Get FileNum, , FileBytes
                                Close FileNum
                                EncryptFile FileBytes, "PASSWORD", DestinationFile
                                FileName = DestinationFile
                                FileNum = FreeFile
                                'Close FileName
                                Open FileName For Binary Access Write As FileNum
                                    Put FileNum, , FileBytes
                                Close FileNum
                                
                                If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                                    KillFile TempRootS & "INF~CYT10.tmp"
                                ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                                    KillFile TempRootS & "\" & "INF~CYT10.tmp"
                                End If
                                
                            End If
                            
                            Close FileNumber
                            Exit Function
                        End If
                    Loop Until FileListStart > LOF(FileNumber)
                End If
            Close FileNumber
            CyTConvertExtract = False
        Else
            CyTConvertExtract = False
            Close FileNumber
            Exit Function
        End If
    End If
    Exit Function
    
FinaliseError:
    CyTConvertExtract = False
End Function

Function CyTConvertCreate(FileName As String) As Boolean
    'On Error GoTo Erro
    Dim FileList As String
    
    If CompressionAgentA = True Then Header = ArchType02
    If CompressionAgentA = False And EncryptionAgentA = False And SwapAgentA = False Then Header = ArchType01
    If EncryptionAgentA = True Then Header = ArchType03
    If SwapAgentA = True Then Header = ArchType04
    
    FileListStart = 0
    
    If FileExist(FileName) = True Then
        CyTConvertCreate = False
        Exit Function
    Else
        FileNumber = FreeFile
        Close #FileNumber
        Open FileName For Binary As #FileNumber
            Put #FileNumber, 1, Header
            Put #FileNumber, Len(Header) + 1, FileListStart
        Close #FileNumber
    End If
    
    CyTConvertCreate = True
   
    Exit Function
    
Erro:
    If Err <> 0 Then
        CyTConvertCreate = False
        Close #FileNumber
        Exit Function
    End If
End Function
