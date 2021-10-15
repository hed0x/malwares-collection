#include "sneak.h"
#include "blowfish.h"

char *
crypt (char *str, char *key, int boo)
{

#ifdef PLN
  return str;
#endif /*PLN*/
#ifdef SEC
    if (!boo)
    return encrypt_string (key, str);
  if (boo)
    return decrypt_string (key, str);
  else
    return NULL;

#endif /*SEC*/
    return NULL;


}
