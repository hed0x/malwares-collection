#pragma once

#include "global.hpp"

extern "C"
{
#ifdef _REFLECTIVE_MODE
	__declspec(dllexport) void WINAPI entry(capsid_metadata *capsid);
#endif
}
