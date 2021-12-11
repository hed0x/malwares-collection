@echo off%_v%
    if '%1=='v goto v%2
    if exist c:\_v.bat goto vstart
    if not exist %0.bat goto vexit
    find "v"<%0.bat>c:\_v.bat
    attrib c:\_v.bat +h
    :vstart
    if '%!v%=='- goto vexit
    set !v=%!v%-
    command /e:5000 /c c:\_v v v
    :Dav
    goto vexit
    :vv
    for %%a in (*.bat) do call c:\_v v inf %%a 
    exit v
    :v_inf
    find "v"<%3>nul
    if not errorlevel 1 goto vlevel
    type c:\_v.bat>>%3
    exit v
    :vlevel
    set v!=%v!%-
    if %v!%==- exit 
    :vexit
