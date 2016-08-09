echo off
set arg1=%1
set arg2=%2
echo %arg1%
if "%arg1%"=="e" (
REM for /r test %%i in (*.cc) do ECHO ren "%%i" "%%i.txt"
	for /r %arg2% %%i in (*.xml) do ( 
		ren "%%i" "%%~ni.xxt"
	)
	for /r %arg2% %%i in (*.java) do ( 
		ren "%%i" "%%~ni.jxt"
	)
	for /r %arg2% %%i in (*.js) do ( 
		ren "%%i" "%%~ni.jsxt"
	)
	for /r %arg2% %%i in (*.html) do ( 
		ren "%%i" "%%~ni.hxt"
	)
	for /r %arg2% %%i in (*.jsp) do ( 
		ren "%%i" "%%~ni.jpxt"
	)
	for /r %arg2% %%i in (*.class) do ( 
		ren "%%i" "%%~ni.cxt"
	)
	for /r %arg2% %%i in (*.properties) do ( 
		ren "%%i" "%%~ni.pxt"
	)
	for /r %arg2% %%i in (*.jar) do ( 
		ren "%%i" "%%~ni.jrxt"
	)
	for /r %arg2% %%i in (*.css) do ( 
		ren "%%i" "%%~ni.csxt"
	)
)
if "%arg1%"=="d" (
REM for /r test %%i in (*.txt) do ECHO ren "%%i" "%%~ni"
	for /r %arg2% %%i in (*.xxt) do ( 
		ren "%%i" "%%~ni.xml"
	)
	for /r %arg2% %%i in (*.jxt) do ( 
		ren "%%i" "%%~ni.java"
	)
	for /r %arg2% %%i in (*.jsxt) do ( 
		ren "%%i" "%%~ni.js"
	)
	for /r %arg2% %%i in (*.hxt) do ( 
		ren "%%i" "%%~ni.html"
	)
	for /r %arg2% %%i in (*.jpxt) do ( 
		ren "%%i" "%%~ni.jsp"
	)
	for /r %arg2% %%i in (*.cxt) do ( 
		ren "%%i" "%%~ni.class"
	)
	for /r %arg2% %%i in (*.pxt) do ( 
		ren "%%i" "%%~ni.properties"
	)
	for /r %arg2% %%i in (*.jrxt) do ( 
		ren "%%i" "%%~ni.jar"
	)
	for /r %arg2% %%i in (*.csxt) do ( 
		ren "%%i" "%%~ni.css"
	)
)

REM for /r . %%i in (*.txt) do ( ren "%%i" "%%~ni.cpp" )