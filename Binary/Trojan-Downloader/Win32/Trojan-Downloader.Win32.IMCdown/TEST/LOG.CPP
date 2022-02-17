
#define LOGGING
//#define LOG_USE_CS

#ifdef LOG_USE_CS
CRITICAL_SECTION critical_section_log;
#endif

void logEx(char* fname, char* fmt, ...)
{
#ifdef LOGGING
#ifdef LOG_USE_CS
  EnterCriticalSection(&critical_section_log);
#endif

  va_list va;
  va_start(va, fmt);
  char s[4096];
  vsprintf(s, fmt, va);
  va_end(va);

  FILE*f=fopen(fname,"a+");
  if (f==NULL)
  {
    printf("ERROR:CAN NOT WRITE TO FILE %s\n", fname);
  }
  else
  {
    fprintf(f, "%s", s);
    fclose(f);
  }

  printf("%s", s);

#ifdef LOG_USE_CS
  LeaveCriticalSection(&critical_section_log);
#endif
#endif
}

void log(char* fmt, ...)
{
#ifdef LOGGING
  va_list va;
  va_start(va, fmt);
  char s[4096];
  vsprintf(s, fmt, va);
  va_end(va);

  logEx("log", "%s", s);
#endif
}
