#pragma once

#include "global.hpp"
#include "config.h"

extern "C"
{
#include "crypto\ecrypt-sync.h"
}

HiveMindConfig *read_config();

namespace config_data
{
	extern HiveMindConfig *cfg;
}