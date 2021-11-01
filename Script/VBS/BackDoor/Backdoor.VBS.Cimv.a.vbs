cmdl="HKLM\SOFTWARE\Microsoft\WBEM\CIMOM\CmdLength"
createobject("WScript.Shell").regdelete cmdl        '删除保存命令长度的键值'
nslink="winmgmts:\\.\root\cimv2:"
doorname="vbscript_backdoor"            '根据脚本后门的名字找到各个对象实例'
myconsumer=doorname&"_consumer"
mytimer=doorname&"_itimer"
myfilter=doorname&"_filter"
set binds=getobject(nslink&"__FilterToConsumerBinding").instances_
for each bind in binds
   if strcomp(right(bind.consumer,len(myconsumer)+1),myconsumer&chr(34),1)=0 _
      and strcomp(right(bind.filter,len(myfilter)+1),myfilter&chr(34),1)=0 then
      bind.delete_
      exit for
   end if
next
getobject(nslink&"ActiveScriptEventConsumer.Name="""&myconsumer&"""").delete_
getobject(nslink&"__IntervalTimerInstruction.TimerId="""&mytimer&"""").delete_
getobject(nslink&"__EventFilter.Name="""&myfilter&"""").delete_
wscript.echo "卸载完成"