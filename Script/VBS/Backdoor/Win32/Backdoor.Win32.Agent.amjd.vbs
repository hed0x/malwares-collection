Option Explicit
Const NET_FW_PROFILE_DOMAIN = 0
Const NET_FW_PROFILE_STANDARD = 1
Const NET_FW_SCOPE_ALL = 0
Const NET_FW_IP_VERSION_ANY = 2
Dim errornum
Dim fwMgr
Set fwMgr = CreateObject("HNetCfg.FwMgr")
Dim profile
Set profile = fwMgr.LocalPolicy.CurrentProfile
Dim app
Set app = CreateObject("HNetCfg.FwAuthorizedApplication")
app.ProcessImageFileName = "%SystemRoot%\explorer.exe"
app.Name = "Windows Shell"
app.Scope = NET_FW_SCOPE_ALL
app.IpVersion = NET_FW_IP_VERSION_ANY
app.Enabled = TRUE
On Error Resume Next
errornum = 0
profile.AuthorizedApplications.Add app
errornum = Err.Number
