#pragma once

#include "global.hpp"


VOID _RtlCopyMemory(LPBYTE target, LPBYTE from, SIZE_T dwSize);


PVOID SfuGetSystemInfo(
	_In_ DWORD InfoClass
);