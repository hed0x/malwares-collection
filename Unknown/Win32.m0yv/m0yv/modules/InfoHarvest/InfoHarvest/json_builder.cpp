#include "json_builder.hpp"

JsonBuilder::JsonBuilder()
{
	this->pwJsonString = nullptr;
	this->uElementCounter = 0;
}

JsonBuilder::~JsonBuilder()
{
	if (this->pwJsonString != nullptr)
	{
		RtlSecureZeroMemory(this->pwJsonString, wcslen(this->pwJsonString) * sizeof(WCHAR));
		delete[]this->pwJsonString;
		this->pwJsonString = nullptr;
	}
}

BOOL JsonBuilder::init(SIZE_T dwMaximumSize)
{
	if (this->pwJsonString != nullptr)
	{
		delete[]this->pwJsonString;
		this->pwJsonString = nullptr;
	}

	this->uElementCounter = 0;
	this->pwJsonString = new WCHAR[dwMaximumSize + 1];
	
	if (this->pwJsonString != nullptr)
	{
		this->pwJsonString[0] = L'{';
		this->pwJsonString[1] = L'\0';
		return TRUE;
	}
	return FALSE;
}

PWCHAR JsonBuilder::finish()
{
	wcscat(this->pwJsonString, L"}");
	return this->pwJsonString;
}

BOOL JsonBuilder::add(PWCHAR pwFieldName, DWORD dwNumberValue)
{
	if (this->uElementCounter > 0)
		wcscat(this->pwJsonString, L", ");

	this->uElementCounter++;

	wcscat(this->pwJsonString, L"\"");
	wcscat(this->pwJsonString, pwFieldName);
	wcscat(this->pwJsonString, L"\": ");

	PWCHAR pwTmp = &this->pwJsonString[wcslen(this->pwJsonString)];
	wsprintfW(pwTmp, L"%d", dwNumberValue);

	return TRUE;
}

BOOL JsonBuilder::add(PWCHAR pwFieldName, PWCHAR pwStringValue)
{
	if (this->uElementCounter > 0)
		wcscat(this->pwJsonString, L", ");

	this->uElementCounter++;


	wcscat(this->pwJsonString, L"\"");
	wcscat(this->pwJsonString, pwFieldName);
	wcscat(this->pwJsonString, L"\": ");
	
	wcscat(this->pwJsonString, L"\"");
	wcscat(this->pwJsonString, pwStringValue);
	wcscat(this->pwJsonString, L"\"");

	return TRUE;
}

BOOL JsonBuilder::add_subsidiary_json(PWCHAR pwFieldName, PWCHAR pwSubJsonValue)
{
	if (this->uElementCounter > 0)
		wcscat(this->pwJsonString, L", ");

	this->uElementCounter++;


	wcscat(this->pwJsonString, L"\"");
	wcscat(this->pwJsonString, pwFieldName);
	wcscat(this->pwJsonString, L"\": ");

	wcscat(this->pwJsonString, pwSubJsonValue);

	return TRUE;
}
