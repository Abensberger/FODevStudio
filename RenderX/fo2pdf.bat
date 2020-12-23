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

SET MissingGraphic=""
set XEPError=""

if EXIST %XEP% del %XEP%
if EXIST %PDF% del %PDF%
if EXIST %PDF% goto Fehler

ECHO Calling %CurPath%xep.bat -fo %FO% -xep %XEP%
CALL %CurPath%xep.bat -fo %FO% -xep %XEP%

goto WEITER

:WEITER
ECHO Calling %CurPath%xep.bat -xep %XEP% -pdf %PDF%
CALL %CurPath%xep.bat -xep %XEP% -pdf %PDF%

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
