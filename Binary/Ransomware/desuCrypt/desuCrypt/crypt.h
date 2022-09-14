#pragma once
BOOL initializeCrypt();
void destroyKeys();
void encryptBuffer(byte *buf, DWORD bufLen, BOOL isLastBlock);
void decryptBuffer(byte *buf, DWORD bufLen, BOOL isLastBlock);
BOOL writeKeyToFile();
BOOL importKeyFromFile();