@echo off

set FrameworkVersion=4.0.30319
if exist "%SystemRoot%\Microsoft.NET\Framework\v%FrameworkVersion%\csc.exe" goto :Start
set FrameworkVersion=2.0.50727
if exist "%SystemRoot%\Microsoft.NET\Framework\v%FrameworkVersion%\csc.exe" goto :Start
:Start

pushd ..\Build
if exist Debug rd /s /q Debug
if exist Release rd /s /q Release
popd

pushd ..\Source
if exist bin rd /s /q bin
if exist obj rd /s /q obj
"%SystemRoot%\Microsoft.net\Framework\v%FrameworkVersion%\csc.exe" /target:winexe /out:"..\Build\Resourcer.exe" /recurse:*.cs /resource:Application.ico,Resourcer.Application.ico /resource:Application.png,Resourcer.Application.png /resource:CommandBar.png,Resourcer.CommandBar.png /resource:Browser.png,Resourcer.Browser.png
popd