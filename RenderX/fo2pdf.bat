@echo off

set CurPath=%~dp0

@ECHO ************************************************
@ECHO ** %CurPath%FO2PDF.BAT
@ECHO ************************************************
::
rem   This batch file encapsulates a standard XEP call. 

set FO=%1
set PDF="%~dpn1%.PDF"
set XEP="%~dpn1%.XEP"
set TRIMMEDXEP="%~dpn1%_.XEP"
set TRIMMEDPDF="%~dpn1%_TRIMMED.PDF"

SET MissingGraphic=""
set XEPError=""

if EXIST %XEP% del %XEP%
if EXIST %PDF% del %PDF%
if EXIST %PDF% goto Fehler

ECHO Calling %CurPath%xep.bat -fo %FO% -xep %XEP%
CALL %CurPath%xep.bat -fo %FO% -xep %XEP%
rem CALL %CurPath%xep.bat -xep %XEP% -pdf %PDF%
rem goto END
rem PAUSE

goto WEITER

ECHO CALLING C:\tools\xsltproc.exe ...
CALL C:\tools\xsltproc.exe -o %TRIMMEDXEP% c:\svn\trunk\templateeditor\trunk\stylesheets_produktiv\trim_xep.xsl %XEP%
CALL %CurPath%xep.bat -xep %TRIMMEDXEP% -pdf %TRIMMEDPDF%

if not EXIST %TRIMMEDPDF% (
ECHO %trimmedpdf% nicht gefunden
PAUSE
)

if EXIST %TRIMMEDPDF% Y:\RenderX\XEP427\SUMATRAPDF.EXE -reuse-instance %TRIMMEDPDF%
PAUSE
goto ENDE

:WEITER
ECHO Calling %CurPath%xep.bat -xep %XEP% -pdf %PDF%
CALL %CurPath%xep.bat -xep %XEP% -pdf %PDF%
REM if EXIST %PDF% start "C:\Program Files\SumatraPDF\SumatraPDF.exe" %PDF%

goto ENDE

:END



:Fehler
ECHO PDF kann nicht neuerzeugt werden
GOTO ENDE

:MISSING_GRAPHIC
ECHO GRAFIK NICHT GEFUNDEN
GOTO ENDE

:XEP_ERROR
ECHO XEP ERROR
FIND "[error]" < log.txt
GOTO ENDE

:ENDE
set CP=
