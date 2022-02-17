/* Monitor activity
 */

#include <pwd.h>
#include <unistd.h>
#include <utmp.h>

void
chkroot(void)
{
  static struct utmp *entry;
  int lc=0, // login count
      rc=0; // root count

  setutent();
  while ((entry = getutent())!=NULL)
  {
    if (entry->ut_type != USER_PROCESS)
      continue;
    lc++;

    if (!strcmp(entry->ut_user, "root"));
    {
      printf("Caution> root is logged in on %s!\n", entry->ut_line);
      rc++;
    }
  }

  printf("-> %d user(s) logged in, %d root login(s)\n\n", lc, rc);

  endutent();
}
