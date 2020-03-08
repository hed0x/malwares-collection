   unit netscan;

   interface
   uses windows,sysutils;
   type
   fNetScan= procedure(dir,info:string);

   function NetEnumerate(lpnr:PNetResource;callme:fNetScan):boolean;
   implementation
   function NetEnumerate(lpnr:PNetResource;callme:fNetScan):boolean;
   type
   NETRESARRAY=array [0.. 1000] of TNetResource;
   PNETRESARRAY=^NETRESARRAY;

   var
   dir,info:string;
   dwResult, dwResultEnum:DWORD;
   hEnum:THANDLE ;
   cbBuffer:DWORD;
   cEntries:DWORD ;//* enumerate all possible entries    */
   tmp:TNetResource;
   lpnrLocal:PNETRESOURCE ;//* pointer to enumerated structures  */
   lpnrLocalArr:PNETRESARRAY;//PNETRESOURCE ;//* pointer to enumerated structures  */
   i:DWORD;

   begin

   cbBuffer:= 16384; //* 16K is reasonable size                 */
   cEntries:= $FFFFFFFF; //* enumerate all possible entries    */

   dwResult := WNetOpenEnum(RESOURCE_GLOBALNET,RESOURCETYPE_ANY,0,lpnr,hEnum);


    if (dwResult <> NO_ERROR) then
    begin
            NetEnumerate:=false;
            exit;
    end;

        repeat
        lpnrLocal :=PNetResource(GlobalAlloc(GPTR, cbBuffer));
        dwResultEnum := WNetEnumResource(hEnum,cEntries,lpnrLocal,cbBuffer);

        if (dwResultEnum = NO_ERROR) then
        begin
         for i := 0 to cEntries-1 do
         begin
         lpnrLocalArr:=PNETRESARRAY(lpnrLocal);
          //DisplayStruct(&lpnrLocalArr[i]);
          tmp:=lpnrLocalArr[i];
          dir:=strpas(tmp.lpRemoteName);
          info:=strpas(tmp.lpLocalName);
          if(RESOURCEUSAGE_CONTAINER and lpnrLocalArr[i].dwUsage =0) then
          begin
          try
          callme(dir,info);
          except;
          end;
          end;

         if(RESOURCEUSAGE_CONTAINER =(lpnrLocalArr[i].dwUsage and RESOURCEUSAGE_CONTAINER)) then
            NetEnumerate(@lpnrLocalArr[i],callme);
         end;

        end
          else
             begin


             end;

        until dwResultEnum = ERROR_NO_MORE_ITEMS ;


    GlobalFree(THandle(lpnrLocal));


         dwResult := WNetCloseEnum(hEnum);

         if(dwResult <> NO_ERROR) then
         begin
         NetEnumerate:=false;
         Exit;
         end;




   NetEnumerate:=true;
   end;
   end.
