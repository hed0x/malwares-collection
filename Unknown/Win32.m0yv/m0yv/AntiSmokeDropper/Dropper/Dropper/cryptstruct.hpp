#pragma once
#include <Windows.h>
extern "C"
{
#include "sha512.h"
}


#pragma pack(1)
struct crypted_data
{
	
	unsigned char hash[512 / 8];
	unsigned char block[]; // шифрованные данные
};
#pragma pack()