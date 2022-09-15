@ECHO OFF

IF "%1%" NEQ "debug" (
  IF "%1%" NEQ "release" (
    ECHO Usage build.bat debug/release
    GOTO:END
  )
)

SET "PROJECT_BUILD=%1%"
SET "PROJECT_OBJECT_PATH=%PROJECT_PATH%\objects\%1%"
SET "PROJECT_LIB_PATH=%PROJECT_PATH%\libs\"

:END