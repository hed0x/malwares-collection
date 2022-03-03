#include "flow_disasm.hpp"

#ifdef _USE_XED
extern "C"
{
#include "xed\xed-interface.h"
}
#endif

#ifdef _USE_XED // эта версия использует Intel XED в качестве дизассемблера
INT flow_disasm::FlowCallDisassembler::begin(LPBYTE lpBase, LPBYTE lpBufferEntryPoint, SIZE_T dwBufferSize, call_list ** lcall_entry, DWORD dwArch, DWORD dwMaximumDepth, DWORD dwInitialDepth)
{
	// ограничение глубины входа дизассемблера
	if (dwMaximumDepth == dwInitialDepth)
	{
#ifdef _DEBUG
		WriteLog(L"::FlowCallDisassembler::begin] maximum depth recursion reached");
#endif
		return DISASM_MAXIMUM_DEPTH_REACHED;
	}

#ifdef _DEBUG
	WCHAR debugOut[1024];
#endif

	if (lcall_entry == nullptr)
		return FALSE;
	if (*lcall_entry != nullptr)
		return FALSE;

	xed_decoded_inst_t xedd;
	xed_state_t dstate;
	flow_disasm::context ctx;

	RtlSecureZeroMemory(&ctx, sizeof(ctx));
	RtlSecureZeroMemory(&xedd, sizeof(xedd));
	RtlSecureZeroMemory(&dstate, sizeof(dstate));

	if (dwArch == IMAGE_FILE_MACHINE_I386)
	{
		dstate.mmode = XED_MACHINE_MODE_LEGACY_32;
		dstate.stack_addr_width = XED_ADDRESS_WIDTH_32b;
	}
	else if (dwArch == IMAGE_FILE_MACHINE_AMD64)
	{
		dstate.mmode = XED_MACHINE_MODE_LONG_64;
		dstate.stack_addr_width = XED_ADDRESS_WIDTH_64b;
	}

	LPBYTE lpInstructionPointer = lpBufferEntryPoint;
	SIZE_T InstructionOffset = ((SIZE_T)lpInstructionPointer - (SIZE_T)lpBase);

	call_list *pListEntry = new call_list;
	if (pListEntry == nullptr)
		return FALSE;

	RtlSecureZeroMemory(pListEntry, sizeof(call_list));
	call_list *pList = pListEntry; // указатель на текущий найденный call
	*lcall_entry = pListEntry; // это выходной параметр

#ifdef _DEBUG
	wsprintfW(debugOut, L"[::FlowCallDisassembler] entering new flow loop %x from instruction offset 0x%x", lpBase, InstructionOffset);
	WriteLog(debugOut);
#endif

	DWORD dwRet = 0;
	UINT iJmpCounter = 0;
	xed_error_enum_t xedRet = xed_error_enum_t::XED_ERROR_NONE;
	while (TRUE)
	{
		// сдизасмим длину инструкции
		xed_decoded_inst_zero_set_mode(&xedd, &dstate);
		xedRet = xed_ild_decode(&xedd, lpInstructionPointer, XED_MAX_INSTRUCTION_BYTES);
		if (xedRet != XED_ERROR_NONE)
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[::FlowCallDisassembler] invalid instruction at offset 0x%x", InstructionOffset);
			WriteLog(debugOut);
#endif
			dwRet = DISASM_INVALID_INSTRUCTION;
			break;
		}

		ctx.dwLength = xed_decoded_inst_get_length(&xedd);
		ctx.opcode = lpBase[InstructionOffset];
		ctx.dwFlags = xedRet;

		// следующая инструкция
		lpInstructionPointer = (LPBYTE)((SIZE_T)lpInstructionPointer + (SIZE_T)ctx.dwLength);

		// дебаг вывод байткода
#ifdef _DEBUG
		RtlSecureZeroMemory(debugOut, sizeof(debugOut));
		wsprintfW(debugOut, L"[::FlowCallDisassembler] .code:0x%X: ", InstructionOffset);
		PWCHAR pdebugOut = &debugOut[lstrlenW(debugOut)];
		for (UINT i = 0; i < ctx.dwLength; i++)
		{
			wsprintfW(pdebugOut, L"%X ", lpBase[InstructionOffset + i]);
			pdebugOut = &pdebugOut[lstrlenW(pdebugOut)];
		}
		WriteLog(debugOut);
#endif

		if ((ctx.opcode == RET_OPCODE1) || (ctx.opcode == RET_OPCODE2) || (ctx.opcode == RET_OPCODE3) || (ctx.opcode == RET_OPCODE4))
		{
#ifdef _DEBUG
			wsprintfW(debugOut, L"[::FlowCallDisassembler] ret opcode 0x%x at offset 0x%x", ctx.opcode, InstructionOffset);
			WriteLog(debugOut);
#endif
			dwRet = DISASM_RET_REACHED;
			break;
		}

		// TODO: сделать тут защиту от зацикливания через логгер JMP переходов: если такой переход уже был, то пропускать прыжок
		// пока сделано через счетчик количества jmp: если их больше 1000, то у нас на лицо зацикливание и пропускаем джампы
#ifdef DISASM_FOLLOW_JMP
		if ((ctx.opcode == JMP_REL_OPCODE) && (ctx.dwLength == 0x5))
		{
			// декодируем офсет, чтобы перевести данный поток на новый адрес дизассемблирования
			int rel32 = this->decode_rel32(&lpBase[InstructionOffset + 1]);
			iJmpCounter += 1;
#ifdef _DEBUG
			wsprintfW(debugOut, L"[::FlowCallDisassembler] jmp rel32 opcode 0x%x at offset 0x%x, jmp relative delta %i, jump No. = %d", ctx.opcode, InstructionOffset, rel32, iJmpCounter);
			WriteLog(debugOut);
#endif
			if (iJmpCounter <= DISASM_LIMIT_JMP_EMUL)
			{
				if (rel32 > 0) // посчитаем адрес перехода на основании адреса следующий за прыжком инструкции (lpInstructionPointer) и rel32 дельты
					lpInstructionPointer = (LPBYTE)((SIZE_T)lpInstructionPointer + (SIZE_T)abs(rel32));
				else
					lpInstructionPointer = (LPBYTE)((SIZE_T)lpInstructionPointer - (SIZE_T)abs(rel32));

				// jmp за пределы секции
				if (((SIZE_T)lpInstructionPointer >= ((SIZE_T)lpBase + dwBufferSize)) || ((SIZE_T)lpInstructionPointer < (SIZE_T)lpBase))
				{
					dwRet = DISASM_INVALID_INSTRUCTION;
					break;
				}
			}
			else // иначе не эмулируем так как достигли лимита
			{
#ifdef _DEBUG
				WriteLog(L"[::FlowCallDisassembler] jmp opcode emulator reach its limit");
#endif
			}
		}
#endif
		

		// такой баг (когда улетает в aligned нули) случается в запакованных UPX'с приложениях 
		// оно дизасмится как 00 00
		if ((ctx.opcode == 0) && (lpBase[InstructionOffset + 1] == 0) && (ctx.dwLength == 2))
		{
#ifdef _DEBUG
			WriteLog(L"::FlowCallDisassembler reached end of code");
#endif
			dwRet = DISASM_NULLPADDING_REACHED;
			break;
		}

		// если call rel32
		if ((ctx.opcode == CALL_REL_OPCODE) && (ctx.dwLength == 0x5))
		{

			pList->call_offset = (DWORD32)InstructionOffset;

			// декодируем офсет и войдем рекурсивно в поиск вызовов
			int rel32 = this->decode_rel32(&lpBase[InstructionOffset + 1]);
			
#ifdef _DEBUG
			wsprintfW(debugOut, L"[::FlowCallDisassembler] call rel32 opcode 0x%x at offset 0x%x, call relative delta %i", ctx.opcode, InstructionOffset, rel32);
			WriteLog(debugOut);
#endif
			LPBYTE lpCallOffset = 0;
			if (rel32 > 0) // посчитаем адрес вызываемой процедуры на основании адреса следующий за call инструкции (lpInstructionPointer) и rel32 дельты
				lpCallOffset = (LPBYTE)((SIZE_T)lpInstructionPointer + (SIZE_T)abs(rel32));
			else
				lpCallOffset = (LPBYTE)((SIZE_T)lpInstructionPointer - (SIZE_T)abs(rel32));

			// проверим что вызов происходит в пределах кодовой секции
			if (((SIZE_T)lpCallOffset < ((SIZE_T)lpBase + dwBufferSize)) && ((SIZE_T)lpCallOffset >= (SIZE_T)lpBase))
			{

				call_list *sub_call_list = nullptr;
				DWORD dwTmpRet = this->begin(lpBase, lpCallOffset, dwBufferSize, &sub_call_list, dwArch, dwMaximumDepth, dwInitialDepth + 1);
				// соединим два списка, если нашли еще вызовы
				if (this->call_amount(&sub_call_list) > 0)
				{
					pList->next_entry = sub_call_list;
					pList = this->get_last_entry(sub_call_list);
				}
				else
				{
					if (sub_call_list != nullptr)
						this->destroy_list(&sub_call_list);

					pList->next_entry = new call_list;
					pList = pList->next_entry;
					RtlSecureZeroMemory(pList, sizeof(call_list));
				}

				// тут БАГ, но который как ФИЧА. Потому что в таком случае при заражении где-то глубоко в недрах апп при повторном проходе он снова заразит
				// и будет аж целых два перехода. Второе заражение гарантированно будет где-то на поверхности. А так как это происходить будет нечасто, то
				// условная лечилка может и не заметить, что файл был заражен дважды. 
				// dwTmpRet не возвращается, а лишь прерывает цикл... Надо где бряк сделать dwRet = dwTmpRet для фикса... Но надо ли?
				// UPD: пофиксил, но не помню зачем, какая-то важная причина была, но какая - ХЗ, так что лучше не разфиксивать
				if (dwTmpRet == DISASM_CALLOUT_SECTION)
				{
					dwRet = dwTmpRet;
					break;
				}

			}
			else
			{
#ifdef _DEBUG
				WriteLog(L"[::FlowCallDisassembler] call outside code section, skiping flow start");
#endif
#ifdef _FNO_FLAGS_USEHEURISTICS // в случае использования вызова за пределы секции как маркера зараженности файла - остановим дизассемблер и вернем специальный код
				dwRet = DISASM_CALLOUT_SECTION;
				break;
#endif
			}

		}
		// обновим числовой офсет имея обновленный поинтер инструкций
		InstructionOffset = ((SIZE_T)lpInstructionPointer - (SIZE_T)lpBase);
	}

	return dwRet;
}
#endif


VOID flow_disasm::FlowCallDisassembler::destroy_list(call_list ** lcall_entry)
{
	if ((lcall_entry == nullptr) || (*lcall_entry == nullptr))
		return;

	call_list *list = *lcall_entry;
	call_list *pTmp = nullptr;
	do
	{
		pTmp = list->next_entry;
		delete[]list;
		list = pTmp;
	} while (list != nullptr);

	*lcall_entry = nullptr;

	return;
}

UINT flow_disasm::FlowCallDisassembler::call_amount(call_list ** lcall_entry)
{
	UINT uResult = 0;
	if (lcall_entry == nullptr)
		return 0;
	if (*lcall_entry == nullptr)
		return 0;

	call_list *pEntry = *lcall_entry;
	do
	{
		if (pEntry->call_offset)
			uResult++;
		pEntry = pEntry->next_entry;
	} while (pEntry != nullptr);

	return uResult;
}

INT flow_disasm::FlowCallDisassembler::decode_rel32(LPBYTE lpOperand)
{
	DWORD dwOpcode = *((PDWORD)lpOperand);

	return (signed int)dwOpcode;
}

VOID flow_disasm::FlowCallDisassembler::list_concatenate(call_list * list_one, call_list * list_two, call_list ** outLastEntry)
{
	if ((list_one == nullptr) || (list_two == nullptr))
		return;

	call_list *pListOneLastEntry = this->get_last_entry(list_one);
	call_list *pListTwoLastEntry = this->get_last_entry(list_two);

	pListOneLastEntry->next_entry = list_two;
	*outLastEntry = pListTwoLastEntry;

	return;
}

flow_disasm::call_list *flow_disasm::FlowCallDisassembler::get_last_entry(call_list *list)
{
	if (list == nullptr)
		return nullptr;

	call_list *pLast = nullptr;
	do
	{
		pLast = list;
		list = list->next_entry;
	} while (list != nullptr);

	return pLast;
}

flow_disasm::call_list * flow_disasm::FlowCallDisassembler::get_i_entry(call_list * list, UINT i)
{
	if (list == nullptr)
		return nullptr;

	UINT counter = 0;
	call_list *pEntry = list;
	do
	{
		if (counter == i)
			break;

		pEntry = pEntry->next_entry;

		counter++;
	} while (pEntry != nullptr);

	return pEntry;
}

#ifdef _DEBUG
VOID flow_disasm::FlowCallDisassembler::print_call_list(call_list * list)
{
	if (list == nullptr)
		WriteLog(L"Error list is not supplied");

	WCHAR debugOut[10240];
	wsprintfW(debugOut, L"[::print_call_list] call list: ");
	PWCHAR pdebugOut = &debugOut[lstrlenW(debugOut)];

	UINT i = 0;
	call_list *pEntry = list;
	do
	{
		wsprintfW(pdebugOut, L"%d:%X  ", i++, pEntry->call_offset);
		pEntry = pEntry->next_entry;
		pdebugOut = &pdebugOut[lstrlenW(pdebugOut)];
		if (lstrlenW(debugOut) > 1024)
			break;

	} while (pEntry != nullptr);

	WriteLog(debugOut);

	return;
}
#endif

