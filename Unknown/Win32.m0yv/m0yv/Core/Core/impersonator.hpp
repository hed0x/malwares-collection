#pragma once

#include "global.hpp"


class IImpersonate
{
public:
	virtual ~IImpersonate() = default;
	// параметр зависит от конкретной имплементации
	virtual BOOL initialize(LPBYTE lpParameter, SIZE_T dwParamSize) = 0;
	virtual BOOL impersonate() = 0;
	virtual BOOL revert() = 0;
};

namespace sessionimpersonator
{
	struct thrImpersonateParam
	{
		// в каллбек вызываемый каждый раз как произошла имперсонация передается &callbackParam
		blob callbackParam;
		// адрес функции для вызова после каждой имперсонации
		LPTHREAD_START_ROUTINE fnCallback;
		// если задана в TRUE, то fnCallback будет вызван также до всех операций по имперсонации из текущего потока
		BOOL bInvokeNoImp;
	};
	

	// создает новый поток, который имперсонируется 
	class ThreadSessionImpersonator : public ::IImpersonate
	{
	public:
		ThreadSessionImpersonator();
		~ThreadSessionImpersonator();

		// lpParameter каст к thImpersonateParam
		BOOL initialize(LPBYTE lpParameter, SIZE_T dwParamSize);
		// если задан bInvokeNoImp, то вызывает сразу же fnCallback
		// после чего вне зависимости от bInvokeNoImp создает новый поток и ожидает его завершения
		// новый поток итерирует имперсонацию на токен explorer.exe из каждой сессии и вызывает fnCallback после успешной имперсонации
		BOOL impersonate();
		// не выполняется, так как вся имперсонация происходит в новом потоке
		BOOL revert();
	private:
		thrImpersonateParam *imParameter;
	};
}