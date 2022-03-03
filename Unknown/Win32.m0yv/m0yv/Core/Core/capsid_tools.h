#pragma once
#include "global.hpp"

namespace capsid_tools
{
	// расшифровывает extended_data в выходное значение pExtendedData_out
	VOID get_extended(capsid_metadata *capsid, capsid_extended *pExtendedData_out, SIZE_T dwExtendedSize);
	// принимает pExtendedData_in и шифрует новосгенерированной гаммой сохраняя в капсид
	VOID set_extended(capsid_metadata *capsid, capsid_extended *pExtendedData_in, SIZE_T dwExtendedSize);
}