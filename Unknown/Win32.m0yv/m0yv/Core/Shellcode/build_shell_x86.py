import subprocess
import os
from shutil import copyfile


extensive_target = ["shellcode.cpp"]
extensive_repeat = 1

ignore_names = []

NoExtensive = True

work_dir = "ShellcodeLdr"

cpp_noopt = []
cppfiles = ["shellcode.cpp"]
cfiles = []

cppcompile_command =  "clang++ -S -O3 -fno-jump-tables -mno-sse -fno-builtin -fno-exceptions -D_CRT_SECURE_NO_WARNINGS -Wdeprecated-declarations -Wno-macro-redefined -Wno-write-strings -std=c++14 -fno-rtti -target i386-pc-win32"
cpp_nooptimize = ""

default_salt = "salt"
next_salt = "_t"

permutator_command = "ipython C:\Tools\InstructionMixer\mixasm.py {} {} 1 0 {}"

lastpass_permutator = "ipython C:\Tools\InstructionMixer\mixasm.py {} {} 4 0 {}"
link_command = "clang++ -target i386-pc-win32 {} -llibucrt -luser32 -lkernel32 -ladvapi32 -lshell32 -lgdiplus -lnetapi32 -lgdi32 -lole32 -Xlinker /ALIGN:16 -Xlinker /DEBUG:NONE -Xlinker /subsystem:windows -Xlinker /entry:entry -Xlinker /NODEFAULTLIB -o Release\\x86.exe"

link_files = [] 


def get_only_name(file):
    obj = file.split('\\')
    obj = obj[len(obj) - 1]
    obj = obj.split('.')
    del obj[-1]

    filef = ""
    for parts in obj:
        filef += (parts + '.')
    return (filef.strip('.'))

def get_s_file(file):
    return (get_only_name(file) + '.s')

def get_output_s_file(file):
    return (get_only_name(file) + '_out.s')

# компилируем плюсовые файлы
print("Compling C++ {} files".format(len(cppfiles)))

for file in cppfiles:
    if (file in cpp_noopt):
        print("No optimize file {}".format(file))
        commandline = "{} {}\\{} ".format(cppcompile_nooptimize, work_dir, file) 
    else:
        commandline = "{} {}\\{} ".format(cppcompile_command, work_dir, file)
    print(commandline)
    subprocess.call(commandline, shell=True)

    link_files.append(file)

# компилируем си файлы
print("Compling C {} files".format(len(cfiles)))

for file in cfiles:
    commandline = "{} {}\\{} ".format(ccompile_command, work_dir, file)
    print(commandline)
    subprocess.call(commandline, shell=True)

    link_files.append(file)

# морфим все
print("\n\nMorphing {} files".format(len(link_files)))


for file in link_files:
    bIgnore = False
    for ign in ignore_names:
        if (get_only_name(file) == ign):
            bIgnore = True
            break
    if (bIgnore):
        print("Blacklisted {}.".format(file))
        continue

    commandline = permutator_command.format(get_s_file(file), get_output_s_file(file), default_salt)
    print(commandline)
    subprocess.call(commandline, shell=True)

print("\n\nMorphing {} extensively in {} passes".format(len(extensive_target), extensive_repeat))
for i in range(0, extensive_repeat):
    if (NoExtensive):
        break

    print("Pass {}".format(i))
    salt = "s_{}_t".format(i)
    for file in extensive_target:
        os.remove(get_s_file(file))
        copyfile(get_output_s_file(file), get_s_file(file))
        if (i + 1 != extensive_repeat):
            commandline = permutator_command.format(get_s_file(file), get_output_s_file(file), salt)
        else:
            commandline = lastpass_permutator.format(get_s_file(file), get_output_s_file(file), salt)
    
        print(commandline)
        subprocess.call(commandline, shell=True)


all_files = ""
for file in link_files:

    bIgnore = False
    for ign in ignore_names:
        if (get_only_name(file) == ign):
            bIgnore = True
    if (bIgnore):
        all_files += (get_s_file(file) + " ")
    else:
        all_files += (get_output_s_file(file) + " ")

commandline = link_command.format(all_files)
print(commandline)
subprocess.call(commandline, shell=True)

# подчистим
for file in link_files:
    print("Deleting {}...".format(get_s_file(file)))
    try:
        os.remove(get_s_file(file))
    except:
        print("")
    try:
        os.remove(get_output_s_file(file))
    except:
        print("")
    try:
        os.remove(get_only_name(file) + '.o')
    except:
        print("")
    try: 
        os.remove(get_only_name(file) + '_out.o')
    except:
        print("")


