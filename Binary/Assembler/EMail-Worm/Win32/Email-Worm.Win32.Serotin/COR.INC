;
;                       . .: .:.. :.. .. .:.::. :. ..:
;                     <<-==ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ===<
;                      .:: ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ .:.
;                      . .:.ÜÜÜÛÛß.ßÛÛÛÛÛÛ.ÛÛÛÛÛÛÛ:..
;                       ...ÛÛÛÜÜÜÜ:ÜÜÜÜÛÛÛ:ÛÛÛ ÛÛÛ.::.
;                      >===ÛÛÛÛÛÛÛ=ÛÛÛÛÛÛß=ÛÛÛ ÛÛÛ=->>
;                     .: .:.. ..:. .: ..:.::. ::.. :.:.
;
;                              [29A INC files]
;           Common Language Runtime Portable Executable file format
;                               by Benny/29A
;
; Description
; ÄÄÄÄÄÄÄÄÄÄÄ
; This include file contains all the constantz and structurez needed to work
; with the CLR (Common Language Runtime) environment from inside ASM filez.
;
;
; (C)ompiled by Benny/29A, Jan 2003. No rightz reserved.



; ÄÄ´ GUIDs and interface definitions ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


GUID	STRUC
	DD1	DD	?
	DW1	DW	?
	DW2	DW	?
	DB1	DB	?
	DB2	DB	?
	DB3	DB	?
	DB4	DB	?
	DB5	DB	?
	DB6	DB	?
	DB7	DB	?
	DB8	DB	?
GUID	ENDS



IUnknown	STRUC
	IUnknown_QueryInterface	DD	?
	IUnknown_AddRef		DD	?
	IUnknown_Release	DD	?
IUnknown	ENDS



;{BED7F4EA-1A96-11d2-8F08-00A0C9A6186D}
LIBID_ComPlusRuntime		EQU	GUID	<0BED7F4EAh,1A96h,11D2h,8Fh,8,00h,0A0h,0C9h,0A6h,18h,6Dh>


;{90883F05-3D28-11D2-8F17-00A0C9A6186D}
GUID_ExportedFromComPlus	EQU	GUID	<90883F05h,3D28h,11D2h,8Fh,17h,0,0A0h,0C9h,0A6h,18h,6Dh>


;{0F21F359-AB84-41E8-9A78-36D110E6D2F9}
GUID_ManagedName		EQU	GUID	<0F21F359h,0AB84h,41E8h,9A78h,36h,0D1h,10h,0E6h,0D2h,0F9h>


;{54FC8F55-38DE-4703-9C4E-250351302B1C}
GUID_Function2Getter		EQU	GUID	<54FC8F55h,38DEh,4703h,9Ch,4Eh,25h,03h,51h,30h,2Bh,1Ch>


;Dispenser coclass for version 1.5 and 2.0 meta data.  To get the "latest" bind to CLSID_MetaDataDispenser.
;{1EC2DE53-75CC-11D2-9775-00A0C9B4D50C}
CLSID_CorMetaDataDispenserRuntime	EQU	GUID	<1EC2DE53h,75CCh,11D2h,97h,75h,00h,0A0h,0C9h,0B4h,0D5,0Ch>


;For Common Language Runtime Meta Data, managed program meta data.
;{005023CA-72B1-11D3-9FC4-00C04F79A0A3}
CLSID_CorMetaDataRuntime	EQU	GUID	<005023CAh,72B1h,11D3h,9Fh,0C4h,00h,0C0h,4Fh,79h,0A0h,0A3h>


;{90883F06-3D28-11D2-8F17-00A0C9A6186D}
GUID_ImportedToComPlus		EQU	GUID	<90883F06h,3D28h,11D2h,8Fh,17h,00h,0A0h,0C9h,0A6h,18h,6Dh>


;{30FE7BE8-D7D9-11D2-9F80-00C04F79A0A3}
MetaDataCheckDuplicatesFor	EQU	GUID	<30FE7BE8h,0D7D9h,11D2h,9Fh,80h,00h,0C0h,4Fh,79h,0A0h,0A3h>


;{DE3856F8-D7D9-11D2-9F80-00C04F79A0A3}
MetaDataRefToDefCheck		EQU	GUID	<0DE3856F8h,0D7D9h,11D2h,9Fh,80h,00h,0C0h,4Fh,79h,0A0h,0A3h>


;{E5D71A4C-D7DA-11D2-9F80-00C04F79A0A3}
MetaDataNotificationForTokenMovement	EQU	GUID	<0E5D71A4Ch,0D7DAh,11D2h,9Fh,80h,00h,0C0h,4Fh,79h,0A0h,0A3h>


;{2EEE315C-D7DB-11D2-9F80-00C04F79A0A3}
MetaDataSetUpdate		EQU	GUID	<2EEE315Ch,0D7DBh,11D2h,9Fh,80h,00h,0C0h,4Fh,79h,0A0h,0A3h>


MetaDataSetENC			EQU	MetaDataSetUpdate


;Use this guid in SetOption to indicate if the import enumerator should skip over delete items or not. The default is yes.
;{79700F36-4AAC-11D3-84C3-009027868CB1}
MetaDataImportOption		EQU	GUID	<79700F36h,4AACh,11D3h,84h,0C3h,00h,90h,27h,86h,8Ch,0B1h>


;Use this guid in the SetOption if compiler wants to have MetaData API to take reader/writer lock CorThreadSafetyOptions.
;{F7559806-F266-42ea-8C63-0ADB45E8B234}
MetaDataThreadSafetyOptions	EQU	GUID	<0F7559806h,0F266h,42EAh,8Ch,63h,0Ah,0DBh,45h,0E8h,0B2h,34h>


;Use this guid in the SetOption if compiler wants error when some tokens are emitted out of order
;{1547872D-DC03-11D2-9420-0000F8083460}
MetaDataErrorIfEmitOutOfOrder	EQU	GUID	<1547872Dh,0DC03h,11D2h,94h,20h,00h,00h,0F8h,08h,34h,60h>


;Use this guid in the SetOption to indicate if the tlbimporter should generate the TCE adapters for COM connection point containers.
;{DCC9DE90-4151-11D3-88D6-00902754C43A}
MetaDataGenerateTCEAdapters	EQU	GUID	<0DCC9DE90h,4151h,11D3h,88h,0D6h,00h,90h,27h,54h,0C4h,3Ah>


;Use this guid in the SetOption to specifiy a non-default namespace for typelib import.
;{F17FF889-5A63-11D3-9FF2-00C04FF7431A}
MetaDataTypeLibImportNamespace	EQU	GUID	<0F17FF889h,5A63h,11D3h,9Fh,0F2h,00h,0C0h,4Fh,0F7h,43h,1Ah>


;Use this guid in the SetOption to specify the behavior of UnmarkAll. See CorLinkerOptions. 
;{47E099B6-AE7C-4797-8317-B48AA645B8F9}
MetaDataLinkerOptions		EQU	GUID	<47E099B6h,0AE7Ch,4797h,83h,17h,0B4h,8Ah,0A6h,45h,0B8h,0F9h>


;Use this guid in the SetOption to specify the runtime version stored in the CLR metadata.
;{47E099B7-AE7C-4797-8317-B48AA645B8F9}
MetaDataRuntimeVersion		EQU	GUID	<47E099B7h,0AE7Ch,4797h,83h,17h,0B4h,8Ah,0A6h,45h,0B8h,0F9h>


;{BEE00000-EE77-11D0-A015-00C04FBBB884}
CLSID_Cor			EQU	GUID	<0BEE00000h,0EE77h,11D0h,0A0h,15h,00h,0C0h,4Fh,0BBh,0B8h,84h>


;This is the "Master Dispenser", always guaranteed to be the most recent dispenser on the machine.
;{E5CB7A31-7512-11D2-89CE-0080C792E5D8}
CLSID_CorMetaDataDispenser	EQU	GUID	<0E5CB7A31h,7512h,11D2h,89h,0CEh,00h,80h,0C7h,92h,0E5h,0D8h>


;Dispenser coclass for version 1.0 meta data.  To get the "latest" bind to CLSID_CorMetaDataDispenser.
;{435755FF-7397-11D2-9771-00A0C9B4D50C}
CLSID_CorMetaDataDispenserReg	EQU	GUID	<435755FFh,7397h,11D2h,97h,71h,00h,0A0h,0C9h,0B4h,0D5h,0Ch>


;For COM+ Meta Data, Data Driven Registration
;{87F3A1F5-7397-11D2-9771-00A0C9B4D50C}
CLSID_CorMetaDataReg		EQU	GUID	<87F3A1F5h,7397h,11D2h,97h,71h,00h,0A0h,0C9h,0B4h,0D5h,0Ch>


;{39EE28B3-0181-4D48-B53C-2FFAFFD5FEC1}
IID_IMetaDataInternal		EQU	GUID	<39EE28B3h,0181h,4D48h,0B5h,3Ch,2Fh,0FAh,0FFh,0D5h,0FEh,0C1h>


;{B81FF171-20F3-11D2-8DCC-00A0C9B09C19}
IID_IMetaDataError		EQU	GUID	<0B81FF171h,20F3h,11D2h,8DCCh,00h,0A0h,0C9h,0B0h,9Ch,19h>

IMetaDataError	STRUC
				IUnknown	?
	IMetaDataError_OnError	DD		?
IMetaDataError	ENDS


;{06A3EA8B-0225-11D1-BF72-00C04FC31E12}
IID_IMapToken			EQU	GUID	<06A3EA8Bh,0225h,11D1h,0BFh,72h,00h,0C0h,4Fh,0C3h,1Eh,12h>

IMapToken	STRUC
			IUnknown	?
	IMapToken_Map	DD		?
IMapToken	ENDS


;{B81FF171-20F3-11D2-8DCC-00A0C9B09C19}
IID_IMetaDataDispenser		EQU	GUID	<0B81FF171h,20F3h,11D2h,8Dh,0CCh,00h,0A0h,0C9h,0B0h,9Ch,19h>

IMetaDataDispenser	STRUC
						IUnknown	?
	IMetaDataDispenser_DefineScope		DD		?
	IMetaDataDispenser_OpenScope		DD		?
	IMetaDataDispenser_OpenScopeOnMemory	DD		?
IMetaDataDispenser	ENDS


;{BA3FEE4C-ECB9-4E41-83B7-183FA41CD859}
IID_IMetaDataEmit		EQU	GUID	<0BA3FEE4Ch,0ECB9h,4E41h,83h,0B7h,18h,3Fh,0A4h,1Ch,0D8h,59h>

IMetaDataEmit	STRUC
							IUnknown	?
	IMetaDataEmit_SetModuleProps			DD		?
	IMetaDataEmit_Save				DD		?
	IMetaDataEmit_SaveToStream			DD		?
	IMetaDataEmit_GetSaveSize			DD		?
	IMetaDataEmit_DefineTypeDef			DD		?
	IMetaDataEmit_DefineNestedType			DD		?
	IMetaDataEmit_SetHandler			DD		?
	IMetaDataEmit_DefineMethod			DD		?
	IMetaDataEmit_DefineMethodImpl			DD		?
	IMetaDataEmit_DefineTypeRefByName		DD		?
	IMetaDataEmit_DefineImportType			DD		?
	IMetaDataEmit_DefineMemberRef			DD		?
	IMetaDataEmit_DefineImportMember		DD		?
	IMetaDataEmit_DefineEvent			DD		?
	IMetaDataEmit_SetClassLayout			DD		?
	IMetaDataEmit_DeleteClassLayout			DD		?
	IMetaDataEmit_SetFieldMarshal			DD		?
	IMetaDataEmit_DeleteFieldMarshal		DD		?
	IMetaDataEmit_DefinePermissionSet		DD		?
	IMetaDataEmit_SetRVA				DD		?
	IMetaDataEmit_GetTokenFromSig			DD		?
	IMetaDataEmit_DefineModuleRef			DD		?
	IMetaDataEmit_SetParent				DD		?
	IMetaDataEmit_GetTokenFromTypeSpec		DD		?
	IMetaDataEmit_SaveToMemory			DD		?
	IMetaDataEmit_DefineUserString			DD		?
	IMetaDataEmit_DeleteToken			DD		?
	IMetaDataEmit_SetMethodProps			DD		?
	IMetaDataEmit_SetTypeDefProps			DD		?
	IMetaDataEmit_SetEventProps			DD		?
	IMetaDataEmit_SetPermissionSetProps		DD		?
	IMetaDataEmit_DefinePinvokeMap			DD		?
	IMetaDataEmit_SetPinvokeMap			DD		?
	IMetaDataEmit_DeletePinvokeMap			DD		?
	IMetaDataEmit_DefineCustomAttribute		DD		?
	IMetaDataEmit_SetCustomAttributeValue		DD		?
	IMetaDataEmit_DefineField			DD		?
	IMetaDataEmit_DefineProperty			DD		?
	IMetaDataEmit_DefineParam			DD		?
	IMetaDataEmit_SetFieldProps			DD		?
	IMetaDataEmit_SetPropertyProps			DD		?
	IMetaDataEmit_SetParamProps			DD		?
	IMetaDataEmit_DefineSecurityAttributeSet	DD		?
	IMetaDataEmit_ApplyEditAndContinue		DD		?
	IMetaDataEmit_TranslateSigWithScope		DD		?
	IMetaDataEmit_SetMethodImplFlags		DD		?
	IMetaDataEmit_SetFieldRVA			DD		?
	IMetaDataEmit_Merge				DD		?
	IMetaDataEmit_MergeEnd				DD		?
IMetaDataEmit	ENDS


;{7DAC8207-D3AE-4C75-9B67-92801A497D44}
IID_IMetaDataImport		EQU	GUID	<7DAC8207h,0D3AEh,4C75h,9Bh,67h,92h,80h,1Ah,49h,7Dh,44h>

IMetaDataImport	STRUC
							IUnknown	?
	IMetaDataImport_CloseEnum			DD		?
	IMetaDataImport_CountEnum			DD		?
	IMetaDataImport_ResetEnum			DD		?
	IMetaDataImport_EnumTypeDefs			DD		?
	IMetaDataImport_EnumInterfaceImpls		DD		?
	IMetaDataImport_EnumTypeRefs			DD		?
	IMetaDataImport_FindTypeDefByName		DD		?
	IMetaDataImport_GetScopeProps			DD		?
	IMetaDataImport_GetModuleFromScope		DD		?
	IMetaDataImport_GetTypeDefProps			DD		?
	IMetaDataImport_GetInterfaceImplProps		DD		?
	IMetaDataImport_GetTypeRefProps			DD		?
	IMetaDataImport_ResolveTypeRef			DD		?
	IMetaDataImport_EnumMembers			DD		?
	IMetaDataImport_EnumMembersWithName		DD		?
	IMetaDataImport_EnumMethods			DD		?
	IMetaDataImport_EnumMethodsWithName		DD		?
	IMetaDataImport_EnumFields			DD		?
	IMetaDataImport_EnumFieldsWithName		DD		?
	IMetaDataImport_EnumParams			DD		?
	IMetaDataImport_EnumMemberRefs			DD		?
	IMetaDataImport_EnumMethodImpls			DD		?
	IMetaDataImport_EnumPermissionSets		DD		?
	IMetaDataImport_FindMember			DD		?
	IMetaDataImport_FindMethod			DD		?
	IMetaDataImport_FindField			DD		?
	IMetaDataImport_FindMemberRef			DD		?
	IMetaDataImport_GetMethodProps			DD		?
	IMetaDataImport_GetMemberRefProps		DD		?
	IMetaDataImport_EnumProperties			DD		?
	IMetaDataImport_EnumEvents			DD		?
	IMetaDataImport_GetEventProps			DD		?
	IMetaDataImport_EnumMethodSemantics		DD		?
	IMetaDataImport_GetMethodSemantics		DD		?
	IMetaDataImport_GetClassLayout			DD		?
	IMetaDataImport_GetFieldMarshal			DD		?
	IMetaDataImport_GetRVA				DD		?
	IMetaDataImport_GetPermissionSetProps		DD		?
	IMetaDataImport_GetSigFromToken			DD		?
	IMetaDataImport_GetModuleRefProps		DD		?
	IMetaDataImport_EnumModuleRefs			DD		?
	IMetaDataImport_GetTypeSpecFromToken		DD		?
	IMetaDataImport_GetNameFromToken		DD		?
	IMetaDataImport_EnumUnresolvedMethods		DD		?
	IMetaDataImport_GetUserString			DD		?
	IMetaDataImport_GetPinvokeMap			DD		?
	IMetaDataImport_EnumSignatures			DD		?
	IMetaDataImport_EnumTypeSpecs			DD		?
	IMetaDataImport_EnumUserStrings			DD		?
	IMetaDataImport_GetParamForMethodIndex		DD		?
	IMetaDataImport_EnumCustomAttributes		DD		?
	IMetaDataImport_GetCustomAttributeProps		DD		?
	IMetaDataImport_FindTypeRef			DD		?
	IMetaDataImport_GetMemberProps			DD		?
	IMetaDataImport_GetFieldProps			DD		?
	IMetaDataImport_GetPropertyProps		DD		?
	IMetaDataImport_GetParamProps			DD		?
	IMetaDataImport_GetCustomAttributeByName	DD		?
	IMetaDataImport_IsValidToken			DD		?
	IMetaDataImport_GetNestedClassProps		DD		?
	IMetaDataImport_GetNativeCallConvFromSig	DD		?
	IMetaDataImport_IsGlobal			DD		?
IMetaDataImport	ENDS


;{D0E80DD1-12D4-11D3-B39D-00C04FF81795}
IID_IMetaDataFilter		EQU	GUID	<0D0E80DD1h,12D4h,11D3h,0B3h,9Dh,00h,0C0h,4Fh,0F8h,17h,95h>

IMetaDataFilter	STRUC
					IUnknown	?
	IMetaDataFilter_UnmarkAll	DD		?
	IMetaDataFilter_MarkToken	DD		?
	IMetaDataFilter_IsTokenMarked	DD		?
IMetaDataFilter	ENDS


;{D0E80DD3-12D4-11D3-B39D-00C04FF81795}
IID_IHostFilter			EQU	GUID	<0D0E80DD3h,12D4h,11D3h,0B3h,9Dh,00h,0C0h,4Fh,0F8h,17h,95h>

IHostFilter	STRUC
				IUnknown	?
	IHostFilter_MarkToken	DD		?
IHostFilter	ENDS


;{D9DEBD79-2992-11D3-8BC1-0000F8083A57}
IID_IMetaDataConverter		EQU	GUID	<0D9DEBD79h,2992h,11D3h,8Bh,0C1h,00h,00h,0F8h,08h,3Ah,57h>

IMetaDataConverter	STRUC
							IUnknown	?
	IMetaDataConverter_GetMetaDataFromTypeInfo	DD		?
	IMetaDataConverter_GetMetaDataFromTypeLib	DD		?
	IMetaDataConverter_GetTypeLibFromMetaData	DD		?
IMetaDataConverter	ENDS


;{211EF15B-5317-4438-B196-DEC87B887693}
IID_IMetaDataAssemblyEmit	EQU	GUID	<211EF15Bh,5317h,4438h,0B1h,96h,0DEh,0C8h,7Bh,88h,76h,93h>

IMetaDataAssemblyEmit	STRUC
							IUnknown	?
	IMetaDataAssemblyEmit_DefineAssembly		DD		?
	IMetaDataAssemblyEmit_DefineAssemblyRef		DD		?
	IMetaDataAssemblyEmit_DefineFile		DD		?
	IMetaDataAssemblyEmit_DefineExportedType	DD		?
	IMetaDataAssemblyEmit_DefineManifestResource	DD		?
	IMetaDataAssemblyEmit_SetAssemblyProps		DD		?
	IMetaDataAssemblyEmit_SetAssemblyRefProps	DD		?
	IMetaDataAssemblyEmit_SetFileProps		DD		?
	IMetaDataAssemblyEmit_SetExportedTypeProps	DD		?
	IMetaDataAssemblyEmit_SetManifestResourceProps	DD		?
IMetaDataAssemblyEmit	ENDS


;{EE62470B-E94B-424E-9B7C-2F00C9249F93}
IID_IMetaDataAssemblyImport	EQU	GUID	<0EE62470Bh,0E94Bh,424Eh,9Bh,7Ch,2Fh,00h,0C9h,24h,9Fh,93h>

IMetaDataAssemblyImport	STRUC
								IUnknown	?
	IMetaDataAssemblyImport_GetAssemblyProps		DD		?
	IMetaDataAssemblyImport_GetAssemblyRefProps		DD		?
	IMetaDataAssemblyImport_GetFileProps			DD		?
	IMetaDataAssemblyImport_GetExportedTypeProps		DD		?
	IMetaDataAssemblyImport_GetManifestResourceProps	DD		?
	IMetaDataAssemblyImport_EnumAssemblyRefs		DD		?
	IMetaDataAssemblyImport_EnumFiles			DD		?
	IMetaDataAssemblyImport_EnumExportedTypes		DD		?
	IMetaDataAssemblyImport_EnumManifestResources		DD		?
	IMetaDataAssemblyImport_GetAssemblyFromScope		DD		?
	IMetaDataAssemblyImport_FindExportedTypeByName		DD		?
	IMetaDataAssemblyImport_FindManifestResourceByName	DD		?
	IMetaDataAssemblyImport_CloseEnum			DD		?
	IMetaDataAssemblyImport_FindAssembliesByName		DD		?
IMetaDataAssemblyImport	ENDS


;{4709C9C6-81FF-11D3-9FC7-00C04F79A0A3}
IID_IMetaDataValidate		EQU	GUID	<4709C9C6h,81FFh,11D3h,9Fh,0C7h,00h,0C0h,4Fh,79h,0A0h,0A3h>

IMetaDataValidate	STRUC
						IUnknown	?
	IMetaDataValidate_ValidatorInit		DD		?
	IMetaDataValidate_ValidateMetaData	DD		?
IMetaDataValidate	ENDS


;{31BCFCE2-DAFB-11D2-9F81-00C04F79A0A3}
IID_IMetaDataDispenserEx	EQU	GUID	<31BCFCE2h,0DAFBh,11D2h,9Fh,81h,00h,0C0h,4Fh,79h,0A0h,0A3h>

IMetaDataDispenserEx	STRUC
							IMetaDataDispenser	?
	IMetaDataDispenserEx_SetOption			DD			?
	IMetaDataDispenserEx_GetOption			DD			?
	IMetaDataDispenserEx_OpenScopeOnITypeInfo	DD			?
	IMetaDataDispenserEx_GetCORSystemDirectory	DD			?
	IMetaDataDispenserEx_FindAssembly		DD			?
	IMetaDataDispenserEx_FindAssemblyModule		DD			?
IMetaDataDispenserEx	ENDS


;{7ED1BDFF-8E36-11D2-9C56-00A0C9B7CC45}
IID_ICeeGen			EQU	GUID	<7ED1BDFFh,8E36h,11D2h,9Ch,56,00h,0A0h,0C9h,0B7h,0CCh,45h>

ICeeGen	STRUC
					IUnknown	?
	ICeeGen_EmitString		DD		?
	ICeeGen_GetString		DD		?
	ICeeGen_AllocateMethodBuffer	DD		?
	ICeeGen_GetMethodBuffer		DD		?
	ICeeGen_GetIMapTokenIface	DD		?
	ICeeGen_GenerateCeeFile		DD		?
	ICeeGen_GetIlSection		DD		?
	ICeeGen_GetStringSection	DD		?
	ICeeGen_AddSectionReloc		DD		?
	ICeeGen_GetSectionCreate	DD		?
	ICeeGen_GetSectionDataLen	DD		?
	ICeeGen_GetSectionBlock		DD		?
	ICeeGen_TruncateSection		DD		?
	ICeeGen_GenerateCeeMemoryImage	DD		?
	ICeeGen_ComputePointer		DD		?
ICeeGen	ENDS


;{2629F8E1-95E5-11D2-9C56-00A0C9B7CC45}
IID_ICorModule			EQU	GUID	<2629F8E1h,95E5h,11D2h,9Ch,56h,00h,0A0h,0C9h,0B7h,0CCh,45h>

ICorModule	STRUC
					IUnknown	?
	ICorModule_Initialize		DD		?
	ICorModule_GetCeeGen		DD		?
	ICorModule_GetMetaDataEmit	DD		?
ICorModule	ENDS


;{D8F579AB-402D-4B8E-82D9-5D63B1065C68}
IID_IMetaDataTables		EQU	GUID	<D8F579ABh,402Dh,4B8Eh,82h,0D9h,5Dh,63h,0B1h,06h,5Ch,68h>

IMetaDataTables	STRUC
						IUnknown	?
	IMetaDataTables_GetStringHeapSize	DD		?
	IMetaDataTables_GetBlobHeapSize		DD		?
	IMetaDataTables_GetGuidHeapSize		DD		?
	IMetaDataTables_GetUserStringHeapSize	DD		?
	IMetaDataTables_GetNumTables		DD		?
	IMetaDataTables_GetTableIndex		DD		?
	IMetaDataTables_GetTableInfo		DD		?
	IMetaDataTables_GetColumnInfo		DD		?
	IMetaDataTables_GetCodedTokenInfo	DD		?
	IMetaDataTables_GetRow			DD		?
	IMetaDataTables_GetColumn		DD		?
	IMetaDataTables_GetString		DD		?
	IMetaDataTables_GetBlob			DD		?
	IMetaDataTables_GetGuid			DD		?
	IMetaDataTables_GetUserString		DD		?
	IMetaDataTables_GetNextString		DD		?
	IMetaDataTables_GetNextBlob		DD		?
	IMetaDataTables_GetNextGuid		DD		?
	IMetaDataTables_GetNextUserString	DD		?
IMetaDataTables	ENDS


;Following structure is converted from ICeeFileGen.h

ICeeFileGen	STRUC
	ICeeFileGen_CreateCeeFile		DD	?
	ICeeFileGen_EmitMetaData		DD	?
	ICeeFileGen_EmitLibraryName		DD	?
	ICeeFileGen_EmitMethod			DD	?
	ICeeFileGen_GetMethodRVA		DD	?
	ICeeFileGen_EmitSignature		DD	?
	ICeeFileGen_EmitString			DD	?
	ICeeFileGen_GenerateCeeFile		DD	?
	ICeeFileGen_SetOutputFileName		DD	?
	ICeeFileGen_GetOutputFileName		DD	?
	ICeeFileGen_SetResourceFileName		DD	?
	ICeeFileGen_GetResourceFileName		DD	?
	ICeeFileGen_SetImageBase		DD	?
	ICeeFileGen_SetSubsystem		DD	?
	ICeeFileGen_SetEntryClassToken		DD	?
	ICeeFileGen_GetEntryClassToken		DD	?
	ICeeFileGen_SetEntryPointDescr		DD	?
	ICeeFileGen_GetEntryPointDescr		DD	?
	ICeeFileGen_SetEntryPointFlags		DD	?
	ICeeFileGen_GetEntryPointFlags		DD	?
	ICeeFileGen_SetDllSwitch		DD	?
	ICeeFileGen_GetDllSwitch		DD	?
	ICeeFileGen_SetLibraryName		DD	?
	ICeeFileGen_GetLibraryName		DD	?
	ICeeFileGen_SetLibraryGuid		DD	?
	ICeeFileGen_DestroyCeeFile		DD	?
	ICeeFileGen_GetSectionCreate		DD	?
	ICeeFileGen_GetIlSection		DD	?
	ICeeFileGen_GetRdataSection		DD	?
	ICeeFileGen_GetSectionDataLen		DD	?
	ICeeFileGen_GetSectionBlock		DD	?
	ICeeFileGen_TruncateSection		DD	?
	ICeeFileGen_AddSectionReloc		DD	?
	ICeeFileGen_SetSectionDirectoryEntry	DD	?
	ICeeFileGen_CreateSig			DD	?
	ICeeFileGen_AddSigArg			DD	?
	ICeeFileGen_SetSigReturnType		DD	?
	ICeeFileGen_SetSigCallingConvention	DD	?
	ICeeFileGen_DeleteSig			DD	?
	ICeeFileGen_SetEntryPoint		DD	?
	ICeeFileGen_GetEntryPoint		DD	?
	ICeeFileGen_SetComImageFlags		DD	?
	ICeeFileGen_GetComImageFlags		DD	?
	ICeeFileGen_GetIMapTokenIface		DD	?
	ICeeFileGen_SetDirectoryEntry		DD	?
	ICeeFileGen_EmitMetaDataEx		DD	?
	ICeeFileGen_EmitLibraryNameEx		DD	?
	ICeeFileGen_GetIMapTokenIfaceEx		DD	?
	ICeeFileGen_EmitMacroDefinitions	DD	?
	ICeeFileGen_CreateCeeFileFromICeeGen	DD	?
	ICeeFileGen_SetManifestEntry		DD	?
	ICeeFileGen_SetEnCRVABase		DD	?
	ICeeFileGen_GenerateCeeMemoryImage	DD	?
	ICeeFileGen_ComputeSectionOffset	DD	?
	ICeeFileGen_ComputeOffset		DD	?
	ICeeFileGen_GetCorHeader		DD	?
	ICeeFileGen_LinkCeeFile			DD	?
	ICeeFileGen_FixupCeeFile		DD	?
	ICeeFileGen_GetSectionRVA		DD	?
	ICeeFileGen_ComputeSectionPointer	DD	?
	ICeeFileGen_SetObjSwitch		DD	?
	ICeeFileGen_GetObjSwitch		DD	?
	ICeeFileGen_SetVTableEntry		DD	?
	ICeeFileGen_SetStrongNameEntry		DD	?
	ICeeFileGen_EmitMetaDataAt		DD	?
	ICeeFileGen_GetFileTimeStamp		DD	?
	ICeeFileGen_AddNotificationHandler	DD	?
	ICeeFileGen_SetFileAlignment		DD	?
	ICeeFileGen_ClearComImageFlags		DD	?
ICeeFileGen	ENDS



; ÄÄ´ CoInitializeCor flags ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

COINITCOR_DEFAULT		EQU	0	;Default initialization mode.



; ÄÄ´ CoInitializeEE flags ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

COINITCOR_DEFAULT		EQU	0	;Default initialization mode.
COINITEE_DLL			EQU	1	;Initialization mode for loading DLL.
COINITEE_MAIN			EQU	2	;Initialize prior to entering the main routine.



; ÄÄ´ CorValidatorModuleType flags ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;Specifies the type of the module, PE file vs. .obj file.

ValidatorModuleTypeInvalid	EQU	0
ValidatorModuleTypeMin		EQU	1
ValidatorModuleTypePE		EQU	1
ValidatorModuleTypeObj		EQU	2
ValidatorModuleTypeEnc		EQU	3
ValidatorModuleTypeIncr		EQU	4
ValidatorModuleTypeMax		EQU	4



; ÄÄ´ CorRegFlags flags ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;Various flags for use in installing a module or a composite

regNoCopy			EQU	1	;Don't copy files into destination
regConfig			EQU	2	;Is a configuration
regHasRefs			EQU	4	;Has class references



; ÄÄ´ OSINFO structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

OSINFO	STRUC
	OSINFO_dwOSPlatformId	DD	?	;Operating system platform.
	OSINFO_dwOSMajorVersion	DD	?	;OS Major version.
	OSINFO_dwOSMinorVersion	DD	?	;OS Minor version.
OSINFO	ENDS



; ÄÄ´ ASSEMBLYMETADATA header structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

ASSEMBLYMETADATA	STRUC
	AMD_usMajorVersion	DW	?	;Major Version.
	AMD_usMinorVersion	DW	?	;Minor Version.
	AMD_usBuildNumber	DW	?	;Build Number.
	AMD_usRevisionNumber	DW	?	;Revision Number.
	AMD_szLocale		DD	?	;Locale.
	AMD_cbLocale		DD	?	;[IN/OUT] Size of the buffer in wide chars/Actual size.
	AMD_rProcessor		DD	?	;Processor ID array.
	AMD_ulProcessor		DD	?	;[IN/OUT] Size of the Processor ID array/Actual # of entries filled in.
	AMD_rOS			OSINFO	?	;OSINFO array.
	AMD_ulOS		DD	?	;[IN/OUT]Size of the OSINFO array/Actual # of entries filled in.
ASSEMBLYMETADATA	ENDS



; ÄÄ´ CVStruct structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

CVStruct	STRUC
	CVStruct_Major		DW	?
	CVStruct_Minor		DW	?
	CVStruct_Sub		DW	?
	CVStruct_Build		DW	?
CVStruct	ENDS



; ÄÄ´ CLR relocation types ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_REL_CEE_ABSOLUTE          EQU	0x0000	;Reference is absolute, no relocation is necessary
IMAGE_REL_CEE_ADDR32            EQU	0x0001	;32-bit address (VA).
IMAGE_REL_CEE_ADDR64            EQU	0x0002	;64-bit address (VA).
IMAGE_REL_CEE_ADDR32NB          EQU	0x0003	;32-bit address w/o image base (RVA).
IMAGE_REL_CEE_SECTION           EQU	0x0004	;Section index
IMAGE_REL_CEE_SECREL            EQU	0x0005	;32 bit offset from base of section containing target
IMAGE_REL_CEE_TOKEN             EQU	0x0006	;32 bit metadata token



; ÄÄ´ ICorModuleInitializeFlags values ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

CORMODULE_MATCH			EQU	0	;Find an existing module that matches interfaces supported
CORMODULE_NEW			EQU	1	;Always create a new module and interfaces



; ÄÄ´ META_DATA_META_CONSTANTS values ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

iRidMax          		EQU	63
iCodedToken          		EQU	64	;Base of coded tokens
iCodedTokenMax          	EQU	95
iSHORT          		EQU	96	;Fixed types
iUSHORT          		EQU	97
iLONG          			EQU	98
iULONG          		EQU	99
iBYTE          			EQU	100
iSTRING          		EQU	101	;Pool types
iGUID          			EQU	102
iBLOB          			EQU	103



; ÄÄ´ PE.INC compatibility ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT	EQU	13
IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR	EQU	14

DE_DID				EQU	68h
DE_CLR				EQU	70h



; ÄÄ´ CLR header version 2.0 structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR20_HEADER	STRUC

 ;header versioning:
	CH_Cb				DD		?	;size of struct
	CH_MajorRuntimeVersion		DW		?
	CH_MinorRuntimeVersion		DW		?

 ;Symbol table and startup information:
	CH_MetaData		IMAGE_DATA_DIRECTORY	?
	CH_Flags			DD		?
	CH_EntryPointToken		DD		?

 ;Binding information:
	CH_Resources		IMAGE_DATA_DIRECTORY	?
	CH_StrongNameSignature	IMAGE_DATA_DIRECTORY	?

 ;Regular fixup and binding information:
	CH_CodeManagerTable	IMAGE_DATA_DIRECTORY	?
	CH_VTableFixups		IMAGE_DATA_DIRECTORY	?
	CH_ExportAddressTableJumps	IMAGE_DATA_DIRECTORY	?

 ;Precompiled image info (internal use only - set to zero):
	CH_ManagedNativeHeader	IMAGE_DATA_DIRECTORY	?

	CH_HelperTable		IMAGE_DATA_DIRECTORY    ?
	CH_DynamicInfo		IMAGE_DATA_DIRECTORY    ?
	CH_DelayLoadInfo	IMAGE_DATA_DIRECTORY    ?
	CH_ModuleImage		IMAGE_DATA_DIRECTORY    ?
	CH_ExternalFlags	IMAGE_DATA_DIRECTORY    ?
	CH_RidMap		IMAGE_DATA_DIRECTORY    ?
	CH_DebugMap		IMAGE_DATA_DIRECTORY    ?
	CH_IPMap		IMAGE_DATA_DIRECTORY    ?
IMAGE_COR20_HEADER	ENDS

IMAGE_SIZEOF_COR20_HEADER = SIZE IMAGE_COR20_HEADER



; ÄÄ´ CH_Flags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

COMIMAGE_FLAGS_ILONLY		EQU	1h	;contains IL code only
COMIMAGE_FLAGS_32BITREQUIRED	EQU	2h	;may be loaded only into 32-bit process
COMIMAGE_FLAGS_IL_LIBRARY	EQU	4h
COMIMAGE_FLAGS_TRACKDEBUGDATA	EQU	10000h	;CLR and JIT required for debug tracking



; ÄÄ´ VTableFixup format ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR_VTABLEFIXUP	STRUC
	VTF_RVA			DD	?	;Offset of v-table array in image.
	VTF_Count		DW	?	;How many entries at location
	VTF_Type		DW	?	;COR_VTABLE_xxx type of entries
IMAGE_COR_VTABLEFIXUP	ENDS



; ÄÄ´ definitions for the MIH FLAGS ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR_MIH_METHODRVA		EQU	1
IMAGE_COR_MIH_EHRVA		EQU	2
IMAGE_COR_MIH_BASICBLOCK	EQU	8



; ÄÄ´ VTF_Type valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

COR_VTABLE_32BIT		EQU	1h	;V-table slotz are 32-bits in size
COR_VTABLE_64BIT		EQU	2h	;V-table slotz are 64-bits in size
COR_VTABLE_FROM_UNMANAGED	EQU	4h	;transition from unmanaged
COR_VTABLE_CALL_MOST_DERIVED	EQU	10h	;Call most derived method described by token, only valid for virtuals



; ÄÄ´ EATJ constants ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR_EATJ_THUNK_SIZE	EQU	32	;Size of a jump thunk reserved range.



; ÄÄ´ Max name lengths ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

MAX_CLASS_NAME			EQU	1024
MAX_PACKAGE_NAME		EQU	1024



; ÄÄ´ CorTypeAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;Use this mask to retrieve the type visibility information.
tdVisibilityMask		EQU	7
tdNotPublic			EQU	0	;Class is not public scope.
tdPublic			EQU	1	;Class is public scope.
tdNestedPublic			EQU	2	;Class is nested with public visibility.
tdNestedPrivate			EQU	3	;Class is nested with private visibility.
tdNestedFamily			EQU	4	;Class is nested with family visibility.
tdNestedAssembly		EQU	5	;Class is nested with assembly visibility.
tdNestedFamANDAssem		EQU	6	;Class is nested with family and assembly visibility.
tdNestedFamORAssem		EQU	7	;Class is nested with family or assembly visibility.

;Use this mask to retrieve class layout information
tdLayoutMask			EQU	18h
tdAutoLayout			EQU	00h	;Class fields are auto-laid out
tdSequentialLayout		EQU	08h	;Class fields are laid out sequentially
tdExplicitLayout		EQU	10h	;Layout is supplied explicitly

;Use this mask to retrieve class semantics information.
tdClassSemanticsMask		EQU	20h
tdClass				EQU	00h	;Type is a class.
tdInterface			EQU	20h	;Type is an interface.

;Special semantics in addition to class semantics.
tdAbstract			EQU	080h	;Class is abstract
tdSealed			EQU	100h	;Class is concrete and may not be extended
tdSpecialName			EQU	400h	;Class name is special.  Name describes how.

;Implementation attributes.
tdImport			EQU	1000h	;Class / interface is imported
tdSerializable			EQU	2000h	;The class is Serializable.

;Use tdStringFormatMask to retrieve string information for native interop
tdStringFormatMask		EQU	30000h
tdAnsiClass			EQU	00000h	;LPTSTR is interpreted as ANSI in this class
tdUnicodeClass			EQU	10000h	;LPTSTR is interpreted as UNICODE
tdAutoClass			EQU	20000h	;LPTSTR is interpreted automatically

tdBeforeFieldInit		EQU	100000h	;Initialize the class any time before first static field access.

;Flags reserved for runtime use.
tdReservedMask			EQU	40800h
tdRTSpecialName			EQU	00800h	;Runtime should check name encoding.
tdHasSecurity			EQU	40000h	;Class has security associate with it.



; ÄÄ´ CorMethodAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;member access mask - Use this mask to retrieve accessibility information.
mdMemberAccessMask		EQU	7
mdPrivateScope			EQU	0	;Member not referenceable.
mdPrivate			EQU	1	;Accessible only by the parent type.
mdFamANDAssem			EQU	2	;Accessible by sub-types only in this Assembly.
mdAssem				EQU	3	;Accessibly by anyone in the Assembly.
mdFamily			EQU	4	;Accessible only by type and sub-types.
mdFamORAssem			EQU	5	;Accessibly by sub-types anywhere, plus anyone in assembly.
mdPublic			EQU	6	;Accessibly by anyone who has visibility to this scope.

;method contract attributes.
mdStatic			EQU	10h	;Defined on type, else per instance.
mdFinal				EQU	20h	;Method may not be overridden.
mdVirtual			EQU	40h	;Method virtual.
mdHideBySig			EQU	80h	;Method hides by name+sig, else just by name.

;vtable layout mask - Use this mask to retrieve vtable attributes.
mdVtableLayoutMask		EQU	100h
mdReuseSlot			EQU	000h	;The default.
mdNewSlot			EQU	100h	;Method always gets a new slot in the vtable.

;method implementation attributes.
mdAbstract			EQU	400h	;Method does not provide an implementation.
mdSpecialName			EQU	800h	;Method is special.  Name describes how.

;interop attributes
mdPinvokeImpl			EQU	2000h	;Implementation is forwarded through pinvoke.
mdUnmanagedExport		EQU	0008h	;Managed method exported via thunk to unmanaged code.

;Reserved flags for runtime use only.
mdReservedMask			EQU	0D000h
mdRTSpecialName			EQU	01000h	;Runtime should check name encoding.
mdHasSecurity			EQU	04000h	;Method has security associate with it.
mdRequireSecObject		EQU	08000h	;Method calls another method containing security code.



; ÄÄ´ CorFieldAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;member access mask - Use this mask to retrieve accessibility information.
fdFieldAccessMask		EQU	7
fdPrivateScope			EQU	0	;Member not referenceable.
fdPrivate			EQU	1	;Accessible only by the parent type.
fdFamANDAssem			EQU	2	;Accessible by sub-types only in this Assembly.
fdAssem				EQU	3	;Accessibly by anyone in the Assembly.
fdFamily			EQU	4	;Accessible only by type and sub-types.
fdFamORAssem			EQU	5	;Accessibly by sub-types anywhere, plus anyone in assembly.
fdPublic			EQU	6	;Accessibly by anyone who has visibility to this scope.

;field contract attributes.
fdStatic			EQU	10h	;Defined on type, else per instance.
fdInitOnly			EQU	20h	;Field may only be initialized, not written to after init.
fdLiteral			EQU	40h	;Value is compile time constant.
fdNotSerialized			EQU	80h	;Field does not have to be serialized when type is remoted.

fdSpecialName			EQU	200h	;field is special.  Name describes how.

;interop attributes
fdPinvokeImpl			EQU	2000h	;Implementation is forwarded through pinvoke.

;Reserved flags for runtime use only.
fdReservedMask			EQU	9500h
fdRTSpecialName			EQU	0400h	;Runtime(metadata internal APIs) should check name encoding.
fdHasFieldMarshal		EQU	1000h	;Field has marshalling information.
fdHasDefault			EQU	8000h	;Field has default.
fdHasFieldRVA			EQU	0100h	;Field has RVA.



; ÄÄ´ CorParamAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

pdIn				EQU	01h	;Param is [In]
pdOut				EQU	02h	;Param is [out]
pdOptional			EQU	10h	;Param is optional

;Reserved flags for Runtime use only.
pdReservedMask			EQU	0F000h
pdHasDefault			EQU	01000h	;Param has default value.
pdHasFieldMarshal		EQU	02000h	;Param has FieldMarshal.

pdUnused			EQU	0CFE0h



; ÄÄ´ CorPropertyAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

prSpecialName			EQU	200h	;property is special.  Name describes how.

;Reserved flags for Runtime use only.
prReservedMask			EQU	0F400h
prRTSpecialName			EQU	00400h	;Runtime(metadata internal APIs) should check name encoding.
prHasDefault			EQU	01000h	;Property has default 

prUnused			EQU	0E9FFh



; ÄÄ´ CorEventAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

evSpecialName			EQU	200h	;event is special.  Name describes how.

;Reserved flags for Runtime use only.
evReservedMask			EQU	400h
evRTSpecialName			EQU	400h	;Runtime(metadata internal APIs) should check name encoding.



; ÄÄ´ CorMethodSemanticsAttr valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

msSetter			EQU	01h	;Setter for property
msGetter			EQU	02h	;Getter for property
msOther				EQU	04h	;other method for property or event
msAddOn				EQU	08h	;AddOn method for event
msRemoveOn			EQU	10h	;RemoveOn method for event
msFire				EQU	20h	;Fire method for event



; ÄÄ´ CorDeclSecurity valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

dclActionMask			EQU	0Fh	;Mask allows growth of enum.
dclActionNil			EQU	00h
dclRequest			EQU	01h
dclDemand			EQU	02h
dclAssert			EQU	03h
dclDeny				EQU	04h
dclPermitOnly			EQU	05h
dclLinktimeCheck		EQU	06h
dclInheritanceCheck		EQU	07h
dclRequestMinimum		EQU	08h
dclRequestOptional		EQU	09h
dclRequestRefuse		EQU	0Ah
dclPrejitGrant			EQU	0Bh	;Persisted grant set at prejit time
dclPrejitDenied			EQU	0Ch	;Persisted denied set at prejit time
dclNonCasDemand			EQU	0Dh
dclNonCasLinkDemand		EQU	0Eh
dclNonCasInheritance		EQU	0Fh
dclMaximumValue			EQU	0Fh	;Maximum legal value



; ÄÄ´ CorMethodImpl valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;code impl mask
miCodeTypeMask			EQU	3	;Flags about code type.
miIL				EQU	0	;Method impl is IL.
miNative			EQU	1	;Method impl is native.
miOPTIL				EQU	2	;Method impl is OPTIL
miRuntime			EQU	3	;Method impl is provided by the runtime.

;managed mask
miManagedMask			EQU	4	;Flags specifying whether the code is managed or unmanaged.
miUnmanaged			EQU	4	;Method impl is unmanaged, otherwise managed.
miManaged			EQU	0	;Method impl is managed.

;implementation info and interop
miForwardRef			EQU	10h	;Indicates method is defined; used primarily in merge scenarios.
miPreserveSig			EQU	80h	;Indicates method sig is not to be mangled to do HRESULT conversion.

miInternalCall			EQU	1000h	;Reserved for internal use.

miSynchronized			EQU	00020h	;Method is single threaded through the body.
miNoInlining			EQU	00008h	;Method may not be inlined.
miMaxMethodImplVal		EQU	0FFFFh	;Range check value.



; ÄÄ´ CorPinvokeMap valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

pmNoMangle			EQU	1	;Pinvoke is to use the member name as specified.

;Use this mask to retrieve the CharSet information.
pmCharSetMask			EQU	6
pmCharSetNotSpec		EQU	0
pmCharSetAnsi			EQU	2
pmCharSetUnicode		EQU	4
pmCharSetAuto			EQU	6

pmSupportsLastError		EQU	40h	;Information about target function. Not relevant for fields.

;None of the calling convention flags is relevant for fields.
pmCallConvMask			EQU	700h
pmCallConvWinapi		EQU	100h	;Pinvoke will use native callconv appropriate to target windows platform.
pmCallConvCdecl			EQU	200h
pmCallConvStdcall		EQU	300h
pmCallConvThiscall		EQU	400h	;In M9, pinvoke will raise exception.
pmCallConvFastcall		EQU	500h



; ÄÄ´ CorAssemblyFlags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

afPublicKey			EQU	1	;The assembly ref holds the full (unhashed) public key.

afCompatibilityMask		EQU	70h
afSideBySideCompatible		EQU	00h	;The assembly is side by side compatible.
afNonSideBySideAppDomain	EQU	10h	;The assembly cannot execute with other versions if
						;they are executing in the same application domain.
afNonSideBySideProcess		EQU	20h	;The assembly cannot execute with other versions if
						;they are executing in the same process.
afNonSideBySideMachine		EQU	30h	;The assembly cannot execute with other versions if
						;they are executing on the same machine.

afEnableJITcompileTracking	EQU	8000h	;From "DebuggableAttribute".
afDisableJITcompileOptimizer	EQU	4000h	;From "DebuggableAttribute".



; ÄÄ´ CorManifestResourceFlags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

mrVisibilityMask		EQU	7
mrPublic			EQU	1	;The Resource is exported from the Assembly.
mrPrivate			EQU	2	;The Resource is private to the Assembly.



; ÄÄ´ CorFileFlags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

ffContainsMetaData		EQU	0	;This is not a resource file
ffContainsNoMetaData		EQU	1	;This is a resource file or other non-metadata-containing file



; ÄÄ´ CorElementType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

ELEMENT_TYPE_END		EQU	00h
ELEMENT_TYPE_VOID		EQU	01h
ELEMENT_TYPE_BOOLEAN		EQU	02h
ELEMENT_TYPE_CHAR		EQU	03h
ELEMENT_TYPE_I1			EQU	04h
ELEMENT_TYPE_U1			EQU	05h
ELEMENT_TYPE_I2			EQU	06h
ELEMENT_TYPE_U2			EQU	07h
ELEMENT_TYPE_I4			EQU	08h
ELEMENT_TYPE_U4			EQU	09h
ELEMENT_TYPE_I8			EQU	0Ah
ELEMENT_TYPE_U8			EQU	0Bh
ELEMENT_TYPE_R4			EQU	0Ch
ELEMENT_TYPE_R8			EQU	0Dh
ELEMENT_TYPE_STRING		EQU	0Eh

;every type above PTR will be simple type
ELEMENT_TYPE_PTR		EQU	0Fh	;PTR <type>
ELEMENT_TYPE_BYREF		EQU	10h	;BYREF <type>

;Please use ELEMENT_TYPE_VALUETYPE. ELEMENT_TYPE_VALUECLASS is deprecated.
ELEMENT_TYPE_VALUETYPE		EQU	11h	;VALUETYPE <class Token>
ELEMENT_TYPE_CLASS		EQU	12h	;CLASS <class Token>

ELEMENT_TYPE_ARRAY		EQU	14h	;MDARRAY <type> <rank> <bcount> <bound1> ... <lbcount> <lb1> ...

ELEMENT_TYPE_TYPEDBYREF		EQU	16h	;This is a simple type.

ELEMENT_TYPE_I			EQU	18h	;native integer size
ELEMENT_TYPE_U			EQU	19h	;native unsigned integer size
ELEMENT_TYPE_FNPTR		EQU	1Bh	;FNPTR <complete sig for the function including calling convention>
ELEMENT_TYPE_OBJECT		EQU	1Ch	;Shortcut for System.Object
ELEMENT_TYPE_SZARRAY		EQU	1Dh	;Shortcut for single dimension zero lower bound array
						;SZARRAY <type>
;This is only for binding
ELEMENT_TYPE_CMOD_REQD		EQU	1Fh	;required C modifier : E_T_CMOD_REQD <mdTypeRef/mdTypeDef>
ELEMENT_TYPE_CMOD_OPT		EQU	20h	;optional C modifier : E_T_CMOD_OPT <mdTypeRef/mdTypeDef>

;This is for signatures generated internally (which will not be persisted in any way).
ELEMENT_TYPE_INTERNAL		EQU	21h	;INTERNAL <typehandle>

;Note that this is the max of base type excluding modifiers
ELEMENT_TYPE_MAX		EQU	22h	;first invalid element type

ELEMENT_TYPE_MODIFIER		EQU	40h
ELEMENT_TYPE_SENTINEL		EQU	01h or ELEMENT_TYPE_MODIFIER	;sentinel for varargs
ELEMENT_TYPE_PINNED		EQU	05h or ELEMENT_TYPE_MODIFIER



; ÄÄ´ CorSerializationType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

SERIALIZATION_TYPE_BOOLEAN		EQU	ELEMENT_TYPE_BOOLEAN
SERIALIZATION_TYPE_CHAR			EQU	ELEMENT_TYPE_CHAR
SERIALIZATION_TYPE_I1			EQU	ELEMENT_TYPE_I1
SERIALIZATION_TYPE_U1			EQU	ELEMENT_TYPE_U1
SERIALIZATION_TYPE_I2			EQU	ELEMENT_TYPE_I2
SERIALIZATION_TYPE_U2			EQU	ELEMENT_TYPE_U2
SERIALIZATION_TYPE_I4			EQU	ELEMENT_TYPE_I4
SERIALIZATION_TYPE_U4			EQU	ELEMENT_TYPE_U4
SERIALIZATION_TYPE_I8			EQU	ELEMENT_TYPE_I8
SERIALIZATION_TYPE_U8			EQU	ELEMENT_TYPE_U8
SERIALIZATION_TYPE_R4			EQU	ELEMENT_TYPE_R4
SERIALIZATION_TYPE_R8			EQU	ELEMENT_TYPE_R8
SERIALIZATION_TYPE_STRING		EQU	ELEMENT_TYPE_STRING
SERIALIZATION_TYPE_SZARRAY		EQU	ELEMENT_TYPE_SZARRAY	;Shortcut for single dimension zero lower bound array 
SERIALIZATION_TYPE_TYPE			EQU	0x50
SERIALIZATION_TYPE_TAGGED_OBJECT	EQU	0x51
SERIALIZATION_TYPE_FIELD		EQU	0x53
SERIALIZATION_TYPE_PROPERTY		EQU	0x54
SERIALIZATION_TYPE_ENUM			EQU	0x55



; ÄÄ´ CorCallingConvention valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_CEE_CS_CALLCONV_DEFAULT		EQU	00h
IMAGE_CEE_CS_CALLCONV_VARARG		EQU	05h
IMAGE_CEE_CS_CALLCONV_FIELD		EQU	06h
IMAGE_CEE_CS_CALLCONV_LOCAL_SIG		EQU	07h
IMAGE_CEE_CS_CALLCONV_PROPERTY		EQU	08h
IMAGE_CEE_CS_CALLCONV_UNMGD		EQU	09h
IMAGE_CEE_CS_CALLCONV_MAX		EQU	10h	;first invalid calling convention

;The high bits of the calling convention convey additional info
IMAGE_CEE_CS_CALLCONV_MASK		EQU	0Fh	;Calling convention is bottom 4 bits
IMAGE_CEE_CS_CALLCONV_HASTHIS		EQU	20h	;Top bit indicates a 'this' parameter
IMAGE_CEE_CS_CALLCONV_EXPLICITTHIS	EQU	40h	;This parameter is explicitly in the signature



; ÄÄ´ CorUnmanagedCallingConvention valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_CEE_UNMANAGED_CALLCONV_C		EQU	1
IMAGE_CEE_UNMANAGED_CALLCONV_STDCALL	EQU	2
IMAGE_CEE_UNMANAGED_CALLCONV_THISCALL	EQU	3
IMAGE_CEE_UNMANAGED_CALLCONV_FASTCALL	EQU	4

IMAGE_CEE_CS_CALLCONV_C			EQU	IMAGE_CEE_UNMANAGED_CALLCONV_C
IMAGE_CEE_CS_CALLCONV_STDCALL		EQU	IMAGE_CEE_UNMANAGED_CALLCONV_STDCALL
IMAGE_CEE_CS_CALLCONV_THISCALL		EQU	IMAGE_CEE_UNMANAGED_CALLCONV_THISCALL
IMAGE_CEE_CS_CALLCONV_FASTCALL		EQU	IMAGE_CEE_UNMANAGED_CALLCONV_FASTCALL



; ÄÄ´ CorArgType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_CEE_CS_END		EQU	00h
IMAGE_CEE_CS_VOID		EQU	01h
IMAGE_CEE_CS_I4			EQU	02h
IMAGE_CEE_CS_I8			EQU	03h
IMAGE_CEE_CS_R4			EQU	04h
IMAGE_CEE_CS_R8			EQU	05h
IMAGE_CEE_CS_PTR		EQU	06h
IMAGE_CEE_CS_OBJECT		EQU	07h
IMAGE_CEE_CS_STRUCT4		EQU	08h
IMAGE_CEE_CS_STRUCT32		EQU	09h
IMAGE_CEE_CS_BYVALUE		EQU	0Ah



; ÄÄ´ CorNativeType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

NATIVE_TYPE_END			EQU	00h	;DEPRECATED
NATIVE_TYPE_VOID		EQU	01h	;DEPRECATED
NATIVE_TYPE_BOOLEAN		EQU	02h	;(4 byte boolean value: TRUE = non-zero, FALSE = 0)
NATIVE_TYPE_I1			EQU	03h
NATIVE_TYPE_U1			EQU	04h
NATIVE_TYPE_I2			EQU	05h
NATIVE_TYPE_U2			EQU	06h
NATIVE_TYPE_I4			EQU	07h
NATIVE_TYPE_U4			EQU	08h
NATIVE_TYPE_I8			EQU	09h
NATIVE_TYPE_U8			EQU	0Ah
NATIVE_TYPE_R4			EQU	0Bh
NATIVE_TYPE_R8			EQU	0Ch
NATIVE_TYPE_SYSCHAR		EQU	0Dh	;DEPRECATED
NATIVE_TYPE_VARIANT		EQU	0Eh	;DEPRECATED
NATIVE_TYPE_CURRENCY		EQU	0Fh
NATIVE_TYPE_PTR			EQU	10h	;DEPRECATED

NATIVE_TYPE_DECIMAL		EQU	11h	;DEPRECATED
NATIVE_TYPE_DATE		EQU	12h	;DEPRECATED
NATIVE_TYPE_BSTR		EQU	13h
NATIVE_TYPE_LPSTR		EQU	14h
NATIVE_TYPE_LPWSTR		EQU	15h
NATIVE_TYPE_LPTSTR		EQU	16h
NATIVE_TYPE_FIXEDSYSSTRING	EQU	17h
NATIVE_TYPE_OBJECTREF		EQU	18h	;DEPRECATED
NATIVE_TYPE_IUNKNOWN		EQU	19h
NATIVE_TYPE_IDISPATCH		EQU	1Ah
NATIVE_TYPE_STRUCT		EQU	1Bh
NATIVE_TYPE_INTF		EQU	1Ch
NATIVE_TYPE_SAFEARRAY		EQU	1Dh
NATIVE_TYPE_FIXEDARRAY		EQU	1Eh
NATIVE_TYPE_INT			EQU	1Fh
NATIVE_TYPE_UINT		EQU	20h

NATIVE_TYPE_NESTEDSTRUCT	EQU	21h	;DEPRECATED (use NATIVE_TYPE_STRUCT)
NATIVE_TYPE_BYVALSTR		EQU	22h
NATIVE_TYPE_ANSIBSTR		EQU	23h
NATIVE_TYPE_TBSTR		EQU	24h	;select BSTR or ANSIBSTR depending on platform
NATIVE_TYPE_VARIANTBOOL		EQU	25h	;(2-byte boolean value: TRUE = -1, FALSE = 0)
NATIVE_TYPE_FUNC		EQU	26h

NATIVE_TYPE_ASANY		EQU	28h
NATIVE_TYPE_ARRAY		EQU	2Ah
NATIVE_TYPE_LPSTRUCT		EQU	2Bh
NATIVE_TYPE_CUSTOMMARSHALER	EQU	2Ch	;Custom marshaler native type. This must be followed 
						;by a string of the following format:
						;"Native type name/0Custom marshaler type name/0Optional cookie/0"
						;Or
						;"{Native type GUID}/0Custom marshaler type name/0Optional cookie/0"
NATIVE_TYPE_ERROR		EQU	2Dh	;This native type coupled with ELEMENT_TYPE_I4 will map to VT_HRESULT
NATIVE_TYPE_MAX			EQU	50h	;first invalid element type

DESCR_GROUP_METHODDEF		EQU	0	;DESCR group for MethodDefs
DESCR_GROUP_METHODIMPL		EQU	1	;DESCR group for MethodImpls



; ÄÄ´ Method body format ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR_ILMETHOD_TINY	RECORD	{
	T_CodeSize	:5		;size of IL code
	T_Flags		:3		;1st 2-3 bitz are flags (CORILMETHOD_xxxx)
}


IMAGE_COR_ILMETHOD_FAT_REC	RECORD {
	F_MaxStack	:16	;Maximum number of items (I4, I, I8, obj ...), on the operand stack
	F_Size		:4	;Size in DWords of this structure (currently 3)
	F_Flags		:12	;Flags (CORILMETHOD_xxxx)
}


IMAGE_COR_ILMETHOD_FAT	STRUC
	F_ddRecord	IMAGE_COR_ILMETHOD_FAT_REC	?
	F_CodeSize		DD	?	;Size of IL code
	F_LocalVarSigTok	DD	?	;Token that indicates the signature of the local vars (0 means none)
IMAGE_COR_ILMETHOD_FAT	ENDS


COR_ILMETHOD	UNION
		IMAGE_COR_ILMETHOD_TINY	?
		IMAGE_COR_ILMETHOD_FAT	?
COR_ILMETHOD	ENDS



; ÄÄ´ F_Flags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

CORILMETHOD_SMALLFORMAT	EQU	0h
CORILMETHOD_TINYFORMAT	EQU	2h	;The method header is defined by the IMAGE_COR_ILMETHOD_TINY structure and the size of the code is even
CORILMETHOD_FATFORMAT	EQU	3h	;The method header is defined by the IMAGE_COR_ILMETHOD_FAT structure
CORILMETHOD_TINYFORMAT1	EQU	6h	;The method header is defined by the IMAGE_COR_ILMETHOD_TINY structure and the size of the code is odd.  Using two values for tiny allows for an extra bit of size data

;Additional fat format valuez:
CORILMETHOD_INITLOCALS	EQU	10h	;Call default constructor on all local variables
CORILMETHOD_MORESECTS	EQU	08h	;Set to indicate a section attribute follows the current attribute. Used to chain in exception information among other things

;Additional section valuez (found after method header):
CORILMETHOD_SECT_RESERVED	EQU	0	;Reserved for future use
CORILMETHOD_SECT_EHTABLE	EQU	1	;Exception handling data.  See the IMAGE_COR_ILMETHOD_SECT_EH structure for more encoding details
CORILMETHOD_SECT_OPTILTABLE	EQU	2	;Reserved for future use
CORILMETHOD_SECT_KINDMASK	EQU	3Fh	;The mask for decoding the type code
CORILMETHOD_SECT_FATFORMAT	EQU	40h	;Data format is of the fat variety, meaning there is a 3 byte length. If not set, the header is small with a  1 byte length
CORILMETHOD_SECT_MORESECTS	EQU	80h	;Another data section occurs after this current section



; ÄÄ´ Exception Handling information format ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;!!! NOTE this structure must be DWORD aligned !!!

IMAGE_COR_ILMETHOD_SECT_SMALL	STRUC
	SS_Kind		DB	?		;Which type of exception block is being used
	SS_DataSize	DB	?		;How big is the data excluding the header size
IMAGE_COR_ILMETHOD_SECT_SMALL	ENDS

;!!! NOTE this structure must be DWORD aligned !!!

IMAGE_COR_ILMETHOD_SECT_FAT	RECORD {
	SF_DataSize	:24			;How big is the data excluding the header size
	SF_Kind		:8			;Which type of exception block is being used
}

IMAGE_COR_ILMETHOD_SECT_EH_SMALL	STRUC
	EHS_dwRecord	IMAGE_COR_ILMETHOD_SECT_SMALL	?
	EHS_Reserved		DW	?		;DWORD padding
	EHS_Clauses		DB	? DUP (?)	;One or more clauses as defined by SS_DataSize
IMAGE_COR_ILMETHOD_SECT_EH_SMALL	ENDS


IMAGE_COR_ILMETHOD_SECT_EH_FAT	STRUC
	EHF_ddRecord	IMAGE_COR_ILMETHOD_SECT_FAT	?
	EHF_Clauses		DB	? DUP (?)
IMAGE_COR_ILMETHOD_SECT_EH_FAT	ENDS


IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL	STRUC
	CS_Flags		DW	?	;CorExceptionFlag type for this block
	CS_TryOffset		DW	?	;Offset of a try block
	CS_Length		DB	?	;Length in bytes of the try block
	CS_HandlerOffset	DW	?	;Location of the handler for this try block
	CS_HandlerLength	DB	?	;Size of the handler code in bytes		
	UNION
		CS_ClassToken	DD	?	;Meta data token for a type-based exception handler
		CS_FilterOffset	DD	?	;Offset in method body for filter-based exception handler
	ENDS
IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_SMALL	ENDS


IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT	STRUC
	CF_Flags		DD	?	;CorExceptionFlag type for this block
	CF_TryOffset		DD	?	;Offset of a try block
	CF_TryLength		DD	?	;Length in bytes of the try block
	CF_HandlerOffset	DD	?	;Location of the handler for this try block
	CF_HandlerLength	DD	?	;Size of the handler code in bytes
	UNION
		CF_ClassToken	DD	?	;Meta data token for a type-based exception handler
		CF_FilterOffset	DD	?	;Offset in method body for filter-based exception handler
	ENDS
IMAGE_COR_ILMETHOD_SECT_EH_CLAUSE_FAT	ENDS



; ÄÄ´ CorExceptionFlag valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

COR_ILEXCEPTION_CLAUSE_NONE		EQU	0	;This is a typed handler
COR_ILEXCEPTION_CLAUSE_OFFSETLEN	EQU	0	;Deprecated
COR_ILEXCEPTION_CLAUSE_DEPRECATED	EQU	0	;Deprecated
COR_ILEXCEPTION_CLAUSE_FILTER		EQU	1	;If this bit is on, then this EH entry is for a filter
COR_ILEXCEPTION_CLAUSE_FINALLY		EQU	2	;This clause is a finally clause
COR_ILEXCEPTION_CLAUSE_FAULT		EQU	4	;Fault clause (finally that is called on exception only)



; ÄÄ´ Native method descriptor ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_COR_NATIVE_DESCRIPTOR	STRUC
	ND_GCInfo	DD	?
	ND_EHInfo	DD	?
IMAGE_COR_NATIVE_DESCRIPTOR	ENDS



IMAGE_COR_X86_RUNTIME_FUNCTION_ENTRY	STRUC
	FE_BeginAddress	DD	?	;RVA of start of function
	FE_EndAddress	DD	?	;RVA of end of function
	FE_MIH		DD	?	;Associated MIH
IMAGE_COR_X86_RUNTIME_FUNCTION_ENTRY	ENDS



IMAGE_COR_MIH_ENTRY	STRUC
	ME_EHRVA	DD	?
	ME_MethodRVA	DD	?
	ME_Token	DD	?
	ME_Flags	DB	?
	ME_CodeManager	DB	?
	ME_MIHData	DB	? DUP (?)
IMAGE_COR_MIH_ENTRY	ENDS



; ÄÄ´ CorCheckDuplicatesFor valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

MDDupAll			EQU	0FFFFFFFFh
MDDupENC			EQU	MDDupAll
MDNoDupChecks			EQU	000000000h
MDDupTypeDef			EQU	000000001h
MDDupInterfaceImpl		EQU	000000002h
MDDupMethodDef			EQU	000000004h
MDDupTypeRef			EQU	000000008h
MDDupMemberRef			EQU	000000010h
MDDupCustomAttribute		EQU	000000020h
MDDupParamDef			EQU	000000040h
MDDupPermission			EQU	000000080h
MDDupProperty			EQU	000000100h
MDDupEvent			EQU	000000200h
MDDupFieldDef			EQU	000000400h
MDDupSignature			EQU	000000800h
MDDupModuleRef			EQU	000001000h
MDDupTypeSpec			EQU	000002000h
MDDupImplMap			EQU	000004000h
MDDupAssemblyRef		EQU	000008000h
MDDupFile			EQU	000010000h
MDDupExportedType		EQU	000020000h
MDDupManifestResource		EQU	000040000h

;gap for debug junk
MDDupAssembly			EQU	010000000h

;This is the default behavior on metadata. It will check duplicates for TypeRef, MemberRef, Signature, and TypeSpec
MDDupDefault			EQU	MDNoDupChecks or MDDupTypeRef or MDDupMemberRef or MDDupSignature or MDDupTypeSpec



; ÄÄ´ CorRefToDefCheck valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;default behavior is to always perform TypeRef to TypeDef and MemberRef to MethodDef/FieldDef optimization
MDRefToDefDefault		EQU	000000003h
MDRefToDefAll			EQU	0FFFFFFFFh
MDRefToDefNone			EQU	000000000h
MDTypeRefToDef			EQU	000000001h
MDMemberRefToDef		EQU	000000002h



; ÄÄ´ CorNotificationForTokenMovement valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;default behavior is to notify TypeRef, MethodDef, MemberRef, and FieldDef token remaps
MDNotifyDefault			EQU	00000000Fh
MDNotifyAll			EQU	0FFFFFFFFh
MDNotifyNone			EQU	000000000h
MDNotifyMethodDef		EQU	000000001h
MDNotifyMemberRef		EQU	000000002h
MDNotifyFieldDef		EQU	000000004h
MDNotifyTypeRef			EQU	000000008h

MDNotifyTypeDef			EQU	000000010h
MDNotifyParamDef		EQU	000000020h
MDNotifyInterfaceImpl		EQU	000000040h
MDNotifyProperty		EQU	000000080h
MDNotifyEvent			EQU	000000100h
MDNotifySignature		EQU	000000200h
MDNotifyTypeSpec		EQU	000000400h
MDNotifyCustomAttribute		EQU	000000800h
MDNotifySecurityValue		EQU	000001000h
MDNotifyPermission		EQU	000002000h
MDNotifyModuleRef		EQU	000004000h

MDNotifyNameSpace		EQU	000008000h

MDNotifyAssemblyRef		EQU	001000000h
MDNotifyFile			EQU	002000000h
MDNotifyExportedType		EQU	004000000h
MDNotifyResource		EQU	008000000h



; ÄÄ´ CorSetENC valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

MDSetENCOn			EQU	1	;Deprecated name.
MDSetENCOff			EQU	2	;Deprecated name.

MDUpdateENC			EQU	1	;ENC mode.  Tokens don't move; can be updated.
MDUpdateFull			EQU	2	;"Normal" update mode.
MDUpdateExtension		EQU	3	;Extension mode.  Tokens don't move, adds only.
MDUpdateIncremental		EQU	4	;Incremental compilation
MDUpdateMask			EQU	7

MDUpdateDelta			EQU	8	;If ENC on, save only deltas.



; ÄÄ´ CorErrorIfEmitOutOfOrder valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;flags used in SetOption when pair with MetaDataErrorIfEmitOutOfOrder guid
MDErrorOutOfOrderDefault	EQU	000000000h	;default not to generate any error
MDErrorOutOfOrderNone		EQU	000000000h	;do not generate error for out of order emit
MDErrorOutOfOrderAll		EQU	0FFFFFFFFh	;generate out of order emit for method, field, param, property, and event
MDMethodOutOfOrder		EQU	000000001h	;generate error when methods are emitted out of order
MDFieldOutOfOrder		EQU	000000002h	;generate error when fields are emitted out of order
MDParamOutOfOrder		EQU	000000004h	;generate error when params are emitted out of order
MDPropertyOutOfOrder		EQU	000000008h	;generate error when properties are emitted out of order
MDEventOutOfOrder		EQU	000000010h	;generate error when events are emitted out of order



; ÄÄ´ CorImportOptions valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;flags used in SetOption when pair with MetaDataImportOption guid
MDImportOptionDefault			EQU	000000000h	;default to skip over deleted records
MDImportOptionAll			EQU	0FFFFFFFFh	;Enumerate everything
MDImportOptionAllTypeDefs		EQU	000000001h	;all of the typedefs including the deleted typedef
MDImportOptionAllMethodDefs		EQU	000000002h	;all of the methoddefs including the deleted ones
MDImportOptionAllFieldDefs		EQU	000000004h	;all of the fielddefs including the deleted ones
MDImportOptionAllProperties		EQU	000000008h	;all of the properties including the deleted ones
MDImportOptionAllEvents			EQU	000000010h	;all of the events including the deleted ones
MDImportOptionAllCustomAttributes	EQU	000000020h	;all of the custom attributes including the deleted ones
MDImportOptionAllExportedTypes		EQU	000000040h	;all of the ExportedTypes including the deleted ones



; ÄÄ´ CorThreadSafetyOptions valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;flags for MetaDataThreadSafetyOptions

;default behavior is to have thread safety turn off. This means that MetaData APIs will not take reader/writer
;lock. Clients is responsible to make sure the properly thread synchornization when using MetaData APIs.

MDThreadSafetyDefault		EQU	0
MDThreadSafetyOff		EQU	0
MDThreadSafetyOn		EQU	1



; ÄÄ´ CorLinkerOptions valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;flags for MetaDataLinkerOptions

;default behavior is not to keep private types
MDAssembly			EQU	0
MDNetModule			EQU	1



;struct used to retrieve field offset
;used by GetClassLayout and SetClassLayout

COR_FIELD_OFFSET	STRUC
	FO_ridOfField	DD	?
	FO_ulOffset	DD	?
COR_FIELD_OFFSET	ENDS



IMAGE_COR_FIXUPENTRY	STRUC
	FE_ulRVA	DD	?
	FE_Count	DD	?
IMAGE_COR_FIXUPENTRY	ENDS



; ÄÄ´ CorTokenType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

mdtModule			EQU	00000000h
mdtTypeRef			EQU	01000000h
mdtTypeDef			EQU	02000000h
mdtFieldDef			EQU	04000000h
mdtMethodDef			EQU	06000000h
mdtParamDef			EQU	08000000h
mdtInterfaceImpl		EQU	09000000h
mdtMemberRef			EQU	0A000000h
mdtCustomAttribute		EQU	0C000000h
mdtPermission			EQU	0E000000h
mdtSignature			EQU	11000000h
mdtEvent			EQU	14000000h
mdtProperty			EQU	17000000h
mdtModuleRef			EQU	1A000000h
mdtTypeSpec			EQU	1B000000h
mdtAssembly			EQU	20000000h
mdtAssemblyRef			EQU	23000000h
mdtFile				EQU	26000000h
mdtExportedType			EQU	27000000h
mdtManifestResource		EQU	28000000h

mdtString			EQU	70000000h
mdtName				EQU	71000000h
mdtBaseType			EQU	72000000h	;Leave this on the high end value. This does not correspond to metadata table



; ÄÄ´ CorOpenFlags valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

ofRead				EQU	00h		;Open scope for read
ofWrite				EQU	01h		;Open scope for write.
ofCopyMemory			EQU	02h		;Open scope with memory. Ask metadata to maintain its own copy of memory.
ofCacheImage			EQU	04h		;EE maps but does not do relocations or verify image
ofNoTypeLib			EQU	80h		;Don't OpenScope on a typelib.



; ÄÄ´ CorBaseType valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

mdtBaseType_BOOLEAN		EQU	ELEMENT_TYPE_BOOLEAN or mdtBaseType
mdtBaseType_CHAR		EQU	ELEMENT_TYPE_CHAR or mdtBaseType
mdtBaseType_I1			EQU	ELEMENT_TYPE_I1 or mdtBaseType
mdtBaseType_U1			EQU	ELEMENT_TYPE_U1 or mdtBaseType
mdtBaseType_I2			EQU	ELEMENT_TYPE_I2 or mdtBaseType
mdtBaseType_U2			EQU	ELEMENT_TYPE_U2 or mdtBaseType
mdtBaseType_I4			EQU	ELEMENT_TYPE_I4 or mdtBaseType
mdtBaseType_U4			EQU	ELEMENT_TYPE_U4 or mdtBaseType
mdtBaseType_I8			EQU	ELEMENT_TYPE_I8 or mdtBaseType
mdtBaseType_U8			EQU	ELEMENT_TYPE_U8 or mdtBaseType
mdtBaseType_R4			EQU	ELEMENT_TYPE_R4 or mdtBaseType
mdtBaseType_R8			EQU	ELEMENT_TYPE_R8 or mdtBaseType
mdtBaseType_STRING		EQU	ELEMENT_TYPE_STRING or mdtBaseType
mdtBaseType_I			EQU	ELEMENT_TYPE_I or mdtBaseType
mdtBaseType_U			EQU	ELEMENT_TYPE_U or mdtBaseType



; ÄÄ´ CorAttributeTargets valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;Note that this must be kept in sync with System.AttributeTargets.
catAssembly			EQU	0001h
catModule			EQU	0002h
catClass			EQU	0004h
catStruct			EQU	0008h
catEnum				EQU	0010h
catConstructor			EQU	0020h
catMethod			EQU	0040h
catProperty			EQU	0080h
catField			EQU	0100h
catEvent			EQU	0200h
catInterface			EQU	0400h
catParameter			EQU	0800h
catDelegate			EQU	1000h

catAll				EQU	catAssembly or catModule or catClass or catStruct or catEnum or catConstructor or catMethod or catProperty or catField or catEvent or catInterface or catParameter or catDelegate

catClassMembers			EQU	catClass or catStruct or catEnum or catConstructor or catMethod or catProperty or catField or catEvent or catDelegate or catInterface



; ÄÄ´ CorSaveSize valuez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

cssAccurate			EQU	0	;Find exact save size, accurate but slower.
cssQuick			EQU	1	;Estimate save size, may pad estimate, but faster.
cssDiscardTransientCAs		EQU	2	;remove all of the CAs of discardable types



; ÄÄ´ Security data structure ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

;Descriptor for a single security custom attribute.

COR_SECATTR	STRUC
	SA_tkCtor		DD	?	;Ref to constructor of security attribute.
	SA_pCustomAttribute	DD	?	;Blob describing ctor args and field/property values.
	SA_cbCustomAttribute	DD	?	;Length of the above blob.
COR_SECATTR	ENDS



; ÄÄ´ Metadata physical layout structurez ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

IMAGE_METADATA_SIGNATURE	EQU	424A5342h	;'BSJB' metadata signature

STGHDR_NORMAL			EQU	0		;Normal default flags.
STGHDR_EXTRADATA		EQU	1		;Additional data exists after header.



IMAGE_METADATA_ROOT	STRUC
	MD_Signature		DD	?		;Magic signature for physical metadata: IMAGE_METADATA_SIGNATURE
	MD_MajorVersion		DW	?		;Major version, always 1
	MD_MinorVersion		DW	?		;Minor version, always 1
	MD_Reserved		DD	?		;Reserved, always 0.
	MD_LengthOfVersion	DD	?		;Length of version string in bytes.	
	MD_Version		DB	? DUP (?)	;UTF8-encoded version string of length m (ignore on read)
IMAGE_METADATA_ROOT	ENDS



;This structure follows IMAGE_METADATA_ROOT, on next DWORD boundary

IMAGE_METADATA_NEXT	STRUC
	MD_Flags		DW	?		;Reserved, always 0.
	MD_NumberOfStreams	DW	?		;Number of streams, say n.
	MD_Streams		DB	? DUP (?)	;Array of n StreamHdr structures.
IMAGE_METADATA_NEXT	ENDS



;Follows IMAGE_METADATA_NEXT structure if (MD_Flags & STGHDR_EXTRADATA)

IMAGE_METADATA_EXTRA	STRUC
	MD_iExtraData		DD	?		;number of bytes in pExtraData
	MD_pExtraData		DB	? DUP (?)	;extra data
IMAGE_METADATA_EXTRA	ENDS



IMAGE_METADATA_STREAMHEADER	STRUC
	MSH_Offset		DD	?		;Memory offset to start of this stream from start of the metadata root.
	MSH_Size		DD	?		;Size of this stream in bytes.
	MSH_Name		DB	? DUP (?)	;Name of the stream as null terminated variable length array of ASCII characters, padded with \0 characters. Shall be a multiple of 4.
IMAGE_METADATA_STREAMHEADER	ENDS



IMAGE_METADATA_TILDASTREAM	STRUC
	MTS_Reserved1		DD	?		;Reserved, always 0.
	MTS_MajorVersion	DB	?		;Major version of table schemata, always 1.
	MTS_MinorVersion	DB	?		;Minor version of table schemata, always 0.
	MTS_HeapSizes		DB	?		;Bit vector for heap sizes.
	MTS_Reserved2		DB	?		;Reserved, always 1.
	MTS_Valid		DQ	?		;Bit vector of present tables, let n be the number of bits that are 1.
	MTS_Sorted		DQ	?		;Bit vector of sorted tables.
	MTS_Rows		DD	? DUP (?)	;Array of n four byte unsigned integers indicating the number of rows for each present table.

;The sequence of physical tables follow.

IMAGE_METADATA_TILDASTREAM	ENDS