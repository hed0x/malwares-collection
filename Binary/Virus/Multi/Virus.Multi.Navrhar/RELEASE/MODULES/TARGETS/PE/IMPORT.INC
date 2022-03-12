
_IMAGE_IMPORT_BY_NAME struc
Hind                  dd ?
impName               db 1 dup (?)
                      ends

_IMAGE_THUNK_DATA     struc
tempdata              dd ?
                      ends
ForwarderString = tempdata
Function        = tempdata
Ordinal         = tempdata
AddressOfData   = tempdata


_IMAGE_IMPORT_DESCRIPTOR struc
Characteristics          dd ?
OriginalFirstThunk = Characteristics
TimeDateStamp            dd ?
ForwarderChain           dd ?
ModName                  dd ?
FirstThunk               dd ?
                         ends

