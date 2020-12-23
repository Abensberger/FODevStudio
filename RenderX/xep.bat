@echo off
rem   This batch file encapsulates a standard XEP call. 

set CP=C:\RenderX\XEP-4.30\lib\xep.jar;C:\RenderX\XEP-4.30\lib\saxon6.5.5\saxon.jar;C:\RenderX\XEP-4.30\lib\saxon6.5.5\saxon-xml-apis.jar;C:\RenderX\XEP-4.30\lib\xt.jar;C:\RenderX\XEP-4.30\lib\ZXing-core-3.3.2.jar

if x%OS%==xWindows_NT goto WINNT
rem "java" -Xms256m -Xmx256m -Dhttp.proxyHost=194.173.174.108 -Dhttp.proxyPort=8081 -Dhttps.proxyHost=194.173.174.108 -Dhttps.proxyPort=8081 -classpath "%CP%" com.renderx.xep.XSLDriver "-DCONFIG=C:\RenderX\XEP-4.30\xep.xml" %1 %2 %3 %4 %5 %6 %7 %8 %9
"java" -Xms256m -Xmx256m -classpath "%CP%" com.renderx.xep.XSLDriver -DCONFIG="C:\Lazarusprojekte\trunk\FODevStudio\RenderX\xep.xml" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto END

:WINNT
rem "java" -Xms256m -Xmx256m -Dhttp.proxyHost=194.173.174.108 -Dhttp.proxyPort=8081 -Dhttps.proxyHost=194.173.174.108 -Dhttps.proxyPort=8081 -classpath "%CP%" com.renderx.xep.XSLDriver "-DCONFIG=C:\RenderX\XEP-4.30\xep.xml" %*
"java" -Xms256m -Xmx256m -classpath "%CP%" com.renderx.xep.XSLDriver -DCONFIG="C:\Lazarusprojekte\trunk\FODevStudio\RenderX\xep.xml" %*

:END


set CP=
