#include "configreader.h"

HiveMindConfig *config_data::cfg = nullptr;

HiveMindConfig *read_config()
{
	if (config_data::cfg != nullptr)
		return config_data::cfg;

	HiveMindConfig *cfg = (HiveMindConfig*)new BYTE[sizeof(config::rawData) + 1];
	if (cfg == nullptr)
		return nullptr;

	ECRYPT_ctx ctx;
	ECRYPT_init();
	ECRYPT_keysetup(&ctx, (const u8*)CONFIG_KEY, ECRYPT_MAXKEYSIZE, ECRYPT_MAXIVSIZE);
	ECRYPT_ivsetup(&ctx, (const u8*)CONFIG_IV);

	ECRYPT_decrypt_bytes(&ctx, config::rawData, (u8*)cfg, sizeof(config::rawData));

	return (config_data::cfg = cfg);
}
