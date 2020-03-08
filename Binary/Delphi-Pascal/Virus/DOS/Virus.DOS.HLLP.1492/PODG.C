   #include <alloc.h>
   main()
   {
   int n,n2;
   char *a;
   unsigned int k;

       n=_open("r.exe",0);
       a=farmalloc(60000l);  if(a==0) abort();
       if(n<1) abort();
        k=1492;
       k=_read(n,a,30000);
       close(n);

       n2=_open("klei.exe",4);    if(n2<1) abort();
       lseek(n2,0x1992l,0);
          _write(n2,a,k);
   /* *ã«¥¢®©  ä ©« áª®¯¨à®¢   */
       close(n2);
   }
