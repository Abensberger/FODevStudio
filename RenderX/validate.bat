@echo off
rem   This batch file encapsulates a standard XEP call. 

set CP=C:\RenderX\XEP-4.30\lib\xep.jar;C:\RenderX\XEP-4.30\lib\saxon6.5.5\saxon.jar;C:\RenderX\XEP-4.30\lib\saxon6.5.5\saxon-xml-apis.jar;C:\RenderX\XEP-4.30\lib\xt.jar

if x%OS%==xWindows_NT goto WINNT
"C:\Program Files\Java\jre1.8.0_221\bin\java" -classpath "%CP%" "-Dcom.renderx.xep.CONFIG=C:\RenderX\XEP-4.30\xep.xml" com.renderx.xep.Validator %1 %2 %3 %4 %5 %6 %7 %8 %9
goto END

:WINNT
"C:\Program Files\Java\jre1.8.0_221\bin\java" -classpath "%CP%" "-Dcom.renderx.xep.CONFIG=C:\RenderX\XEP-4.30\xep.xml" com.renderx.xep.Validator %*

:END

set CP=
