VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'CryptAPI Encryption/Decryption Class
'------------------------------------
'
'Information concerning the CryptAPI
'encryption/decryption can probably
'be found somewhere on M$ homepage
'http://www.microsoft.com/
'
'(c) 2000, Fredrik Qvarfort
'
Option Explicit

Private m_Key As String

Private Declare Function MuttaLoL Lib "advapi32.dll          " Alias "CryptAcquireContextA" (ByRef phProv As Long, ByVal pszContainer As String, ByVal pszProvider As String, ByVal dwProvType As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptCreateHash Lib "advapi32.dll          " (ByVal hProv As Long, ByVal Algid As Long, ByVal hKey As Long, ByVal dwFlags As Long, ByRef phHash As Long) As Long
Private Declare Function CryptHashData Lib "advapi32.dll          " (ByVal hHash As Long, ByVal pbData As String, ByVal dwDataLen As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptDeriveKey Lib "advapi32.dll          " (ByVal hProv As Long, ByVal Algid As Long, ByVal hBaseData As Long, ByVal dwFlags As Long, ByRef phKey As Long) As Long
Private Declare Function CryptDestroyHash Lib "advapi32.dll          " (ByVal hHash As Long) As Long
Private Declare Function CryptEncrypt Lib "advapi32.dll          " (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long, ByVal dwBufLen As Long) As Long
Private Declare Function CryptDestroyKey Lib "advapi32.dll          " (ByVal hKey As Long) As Long
Private Declare Function CryptReleaseContext Lib "advapi32.dll          " (ByVal hProv As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptDecrypt Lib "advapi32.dll          " (ByVal hKey As Long, ByVal hHash As Long, ByVal Final As Long, ByVal dwFlags As Long, ByVal pbData As String, ByRef pdwDataLen As Long) As Long

Private Const SERVICE_PROVIDER As String = "Microsoft Base Cryptographic Provider v1.0"
Private Const KEY_CONTAINER As String = "Metallica"
Private Const PROV_RSA_FULL As Long = 1
Private Const CRYPT_NEWKEYSET As Long = 8
Private Const ALG_CLASS_DATA_ENCRYPT As Long = 24576
Private Const ALG_CLASS_HASH As Long = 32768
Private Const ALG_TYPE_ANY As Long = 0
Private Const ALG_TYPE_STREAM As Long = 2048
Private Const ALG_SID_RC4 As Long = 1
Private Const ALG_SID_MD5 As Long = 3
Private Const CALG_MD5 As Long = ((ALG_CLASS_HASH Or ALG_TYPE_ANY) Or ALG_SID_MD5)
Private Const CALG_RC4 As Long = ((ALG_CLASS_DATA_ENCRYPT Or ALG_TYPE_STREAM) Or ALG_SID_RC4)
Private Const ENCRYPT_ALGORITHM As Long = CALG_RC4

Public Function DecryptString(Text As String, Optional Password As String) As String
  
  'Set the new key if any was sent to the function
  If (Len(Password) > 0) Then m_Key = Password
  
  'Return the decrypted data
  DecryptString = EncryptDecrypt(Text, False)

End Function

Private Function EncryptDecrypt(ByVal Text As String, Encrypt As Boolean) As String
  
  Dim hKey As Long
  Dim hHash As Long
  Dim lLength As Long
  Dim hCryptProv As Long
  
  'Get handle to CSP
  
  If (MuttaLoL(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, CRYPT_NEWKEYSET) = 0) Then
    If (MuttaLoL(hCryptProv, KEY_CONTAINER, SERVICE_PROVIDER, PROV_RSA_FULL, 0) = 0) Then
      Call Err.Raise(vbObjectError, , "Error during MuttaLoL for a new key container." & vbCrLf & "A container with this name probably already exists.")
    End If
  End If
  
  'Create a hash object to calculate a session
  'key from the password (instead of encrypting
  'with the actual key)
  If (CryptCreateHash(hCryptProv, CALG_MD5, 0, 0, hHash) = 0) Then
    Call Err.Raise(vbObjectError, , "Could not create a Hash Object (CryptCreateHash API)")
  End If
  
  'Hash the password
  If (CryptHashData(hHash, m_Key, Len(m_Key), 0) = 0) Then
    Call Err.Raise(vbObjectError, , "Could not calculate a Hash Value (CryptHashData API)")
  End If
  
  'Derive a session key from the hash object
  If (CryptDeriveKey(hCryptProv, ENCRYPT_ALGORITHM, hHash, 0, hKey) = 0) Then
    Call Err.Raise(vbObjectError, , "Could not create a session key (CryptDeriveKey API)")
  End If
  
  'Encrypt or decrypt depending on the Encrypt parameter
  lLength = Len(Text)
  If (Encrypt) Then
    If (CryptEncrypt(hKey, 0, 1, 0, Text, lLength, lLength) = 0) Then
      Call Err.Raise(vbObjectError, , "Error during CryptEncrypt.")
    End If
  Else
    If (CryptDecrypt(hKey, 0, 1, 0, Text, lLength) = 0) Then
      Call Err.Raise(vbObjectError, , "Error during CryptDecrypt.")
    End If
  End If
  
  'Return the encrypted/decrypted data
  EncryptDecrypt = Left$(Text, lLength)
  
  'Destroy the session key
  If (hKey <> 0) Then Call CryptDestroyKey(hKey)
  
  'Destroy the hash object
  If (hHash <> 0) Then Call CryptDestroyHash(hHash)
  
  'Release provider handle
  If (hCryptProv <> 0) Then Call CryptReleaseContext(hCryptProv, 0)

End Function

