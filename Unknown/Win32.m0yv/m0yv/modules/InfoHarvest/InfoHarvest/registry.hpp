#pragma once

#include "global.hpp"

namespace registry_api
{
	BOOL read_registry_key(HKEY hKey_path, PWCHAR wchKey_path, PWCHAR wchValue_name, blob *pblOutput, DWORD dwWow64Flag);
}