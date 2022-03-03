#pragma once

#include "global.hpp"

#define BASIC_POLYMORPHIC_ALGO_IL_BYTECODE_LEN 5


// интерфейс генератора алгоритмов криптора
class IEncgen
{
public:
	virtual ~IEncgen() = default;
	// инициализирует алгоритм генерируя соответствующую последовательность IL
	// BlockSize - размер блока 
	virtual BOOL init(UINT dwBlockSize, DWORD dwPolyEncSeed) = 0;
	// шифрует буфер сгенерированным алгоритмом, интерпретируя IL dwBufferSize должен быть кратен dwBlockSize
	virtual BOOL encrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize) = 0;
	// генерирует декриптор блока архитектуры dwArch
	// uRegisterNumber - регистр содержащий указатель на блок, после декрипта будет содержать указатель на следующий блок
	// lpOutBuffer - выходной буфер содержащий байткод
	// dwOutBufferSize - размер выходного буфера
	// dwArch - архитектура генерируемого кода
	virtual BOOL generate_block_decryptor(UINT uRegisterNumber, LPBYTE *lpOutBuffer, SIZE_T *dwOutBufferSize, DWORD dwArch) = 0;
	virtual DWORD get_blocksize() = 0;
#ifdef _DEBUG
	// расшифровывает, нужно для юнит тестов
	virtual BOOL decrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize) = 0;
#endif
};

// генерирует случайный алгоритм шифрования блока состоящего из операций xor, add, sub, not и подобных
// генерирует создавая последовательность виртуальных опкодов с операндом, например:
// 0x0 - значит xor
// 0x1 - значит +
// 0x2 - значит -
// 0x3 - значит инверсию битов
// индекс опкода в последовательности совпадает с индексом дворда 
// таким образом для блока размером N будет сгенерировано N / sizeof(DWORD) операций
// после опкода идет операнд 4 байт, даже у not хотя там игнорируется
// вида - 0x0 0xFFAA19EA 0x3 0x00000000 0x1 0x00000082 и тд
// это будет означать следующее:
// dwBlock[0] ^= 0xFFAA19EA
// dwBlock[1] = ~dwBlock[1];
// dwBlock[2] += 0x82;
// декриптор соответственно будет
// xor dword ptr DS:[esi], 0xFFAA19EA
// not dword ptr ds:[esi + 4]
// sub dword ptr DS:[esi + 8], 0x82

enum BYTECODE_OPCODE_TYPE
{
	XOR = 0,
	ADD,
	SUBSTRACT,
	INVERSE,
	AMOUNT_MAX // количество инструкций
};

#pragma pack(1)
struct basic_instructions
{
	BYTECODE_OPCODE_TYPE opcode;
	DWORD dwOperand;
};
#pragma pack()

class BasicPolymorphicEncryptionAlgorithm : public IEncgen
{
public:

	BasicPolymorphicEncryptionAlgorithm();
	~BasicPolymorphicEncryptionAlgorithm();
	BOOL init(UINT dwBlockSize, DWORD dwPolyEncSeed);
	BOOL encrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize);
	BOOL generate_block_decryptor(UINT uRegisterNumber, LPBYTE *lpOutBuffer, SIZE_T *dwOutBufferSize, DWORD dwArch);
	DWORD get_blocksize();
#ifdef _DEBUG
	// расшифровывает, нужно для юнит тестов
	BOOL decrypt_buffer(LPBYTE lpBuffer, SIZE_T dwBufferSize);
#endif
private:
	basic_instructions *IL;
	SIZE_T dwILSize; // в байтах
	UINT _dwBlockSize;
	long holdrand;

private:
	void encrypt_block(PDWORD pdwBuffer, DWORD dwCounter, DWORD dwInstructionsAmount);
#ifdef _DEBUG
	void decrypt_block(PDWORD pdwBuffer, DWORD dwCounter, DWORD dwInstructionsAmount);
#endif

	void create_sub(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch);
	void create_add(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch);
	void create_xor(ULONG uRegisterNumber, DWORD dwOperand, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch);
	void create_not(ULONG uRegisterNumber, UINT iIndex, LPBYTE lpPlaceholder, PSIZE_T pdwDelta, DWORD dwArch);

	// генерирует случайно расположенные индексы инструкций, чтобы генератор декриптора компилировал IL нелинейно
	BOOL reorder_instructions(PINT indexarr, DWORD dwInstructionsAmount);
};