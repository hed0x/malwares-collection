#!/usr/bin/python
import os
import shutil
import struct
import sys

assert len(sys.argv) == 8

str_site = sys.argv[1]
id_web = int(sys.argv[2])
str_sub_acc = sys.argv[3]
id_land = int(sys.argv[4])
id_prod = int(sys.argv[5])
str_hash = sys.argv[6]
str_dest_path = sys.argv[7]

assert len(str_site) <= 32
assert len(str_sub_acc) == 32
assert len(str_hash) == 32

str_dest_path += "/%s/%s/%s/" % (str(id_web), str(str_sub_acc), str(id_land))
if os.path.exists(str_dest_path) == False:
  os.makedirs(str_dest_path)
str_dest_path += "Installer.exe"
shutil.copyfile("/home/www/winreanimator.com/htdocs/land/Installer.exe", str_dest_path)

file = open(str_dest_path, "r+b")
file.seek(0,2)
file_size = file.tell()

pos = file_size - 16*7
file.seek(pos,0)
file.write(str_site)
file.write('\0')
pos = file_size - 16*7 + 33
file.seek(pos,0)
file.write(struct.pack("l", id_web))
file.write(str_sub_acc)
file.write('\0')
file.write(struct.pack("l", id_land))
file.write(struct.pack("l", id_prod))
file.write(str_hash)
file.write('\0')

file.close()
os._exit(0)
