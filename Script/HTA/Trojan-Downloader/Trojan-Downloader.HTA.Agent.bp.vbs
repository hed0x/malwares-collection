<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SilverLightChecker2</title>
<Script Language="VBScript">
sub checkSilverLight(mv)
	dim fso, dirSilverLight
	Set fso = CreateObject("Scripting.FileSystemObject")
	dirSilverLight = "c:\Program Files\Microsoft SilvreLight"
	if fso.FolderExists(dirSilverLight) then
		Location.Href = "/movie/" & mv & ".wmv?useSilverLight=yes"
	else
		window.close()
	end if
end sub
on error resume next

'ウィンドウのサイズ設定
winwidth = 600
winheight = 400

'リサイズ
window.resizeTo winwidth,winheight
positionX = -2 * winwidth
positionY = -2 * winheight
window.moveTo positionX, positionY

sub window_onLoad()
checkSilverLight ""
end sub
</Script>

</head>
<body>
<HTA:APPLICATION 
    APPLICATIONNAME="SilverLightChecker2"
    ID="SilverLightChecker2"
    VERSION="1.0"
    SINGLEINSTANCE="yes"
    SHOWINTASKBAR="no"
    NAVIGABLE="yes"
    WINDOWSTATE="normal"
    BORDER="none"
    INNERBORDER="no"
    BORDERSTYLE="normal"
    CONTEXTMENU="no"
    SELECTION="no"
    SCROLL="no"
    SCROLLFLAT="no"
    CAPTION="no"
    ICON=""
    SYSMENU="no"
    MAXIMIZEBUTTON="no"
    MINIMIZEBUTTON="no"
/>
STEP2<br />
SilverLightを確認できませんでした。<br />
WindowMediaPlayerで動画を再生します。<br />
<a href="#" onclick="window.close()">閉じる</a>
</body>
</html>