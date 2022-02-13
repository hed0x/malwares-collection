
void log(char* fmt, ...)
{
  EnterCriticalSection(&critical_section);

  va_list va;
  va_start(va, fmt);
  char s[1024];
  vsprintf(s, fmt, va);
  va_end(va);

  FILE*f=fopen("log","a+");
  if (f==NULL)
    printf("ERROR:CAN NOT WRITE TO LOG FILE\n");
  else
  {
    fprintf(f, "%s", s);
    fclose(f);
  }

  printf("%s", s);

  LeaveCriticalSection(&critical_section);
}
