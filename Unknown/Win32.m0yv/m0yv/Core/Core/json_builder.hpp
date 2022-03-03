#pragma once

#include "global.hpp"

// для гарантированно небольших данных
#define DEFAULT_JSON_MAXLENGTH 10240

class JsonBuilder
{
public:
	JsonBuilder();
	~JsonBuilder();

	// инициализирует json билдер максимальной длиной и записывает туда открывающий символ {
	BOOL init(SIZE_T dwMaximumSize);
	// закрывает json строку символами }\0 и возвращает указатель на сбилженные данные
	PWCHAR finish();

	// добавляет числовое значение
	BOOL add(PWCHAR pwFieldName, DWORD dwNumberValue);
	// добавляет строковое значение
	BOOL add(PWCHAR pwFieldName, PWCHAR pwStringValue);
	// добавляет значение из json строки, разница с добавлением строкового в том, что не оборачивает в кавычки
	BOOL add_subsidiary_json(PWCHAR pwFieldName, PWCHAR pwSubJsonValue);
private:
	PWCHAR pwJsonString;
	// счетчик количества элементов
	UINT uElementCounter = 0;
};