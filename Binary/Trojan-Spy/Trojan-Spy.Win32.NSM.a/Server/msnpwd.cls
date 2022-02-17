VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "msnpwd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private m_kullaniciadi As String
Private m_sifre As String
Private m_sürümadi As String
Friend Sub Init(kullaniciadi As String, sifre As String, sürümadi As String)
    m_sifre = sifre
    m_kullaniciadi = kullaniciadi
    m_sürümadi = sürümadi
End Sub

Public Property Get Password() As String
    Password = m_sifre
End Property

Public Property Get Login() As String
    Login = m_kullaniciadi
End Property

Public Property Get TargetName() As String
    TargetName = m_sürümadi
End Property
