:: ！！请用管理员权限运行！！链接: (Aseprite)[https://github.com/aseprite/aseprite/releases] (Skia)[https://github.com/aseprite/skia/releases] (Ninja)[https://github.com/ninja-build/ninja/releases]
@echo off
::
:: ==========配置 VsDevCmd路径==========
echo Searching vsdevcmd.bat in your PC...
setlocal enabledelayedexpansion
set "_outer_temp="
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        for /f "delims=" %%c in ('dir /s /b /ad "%%d:\Common7" 2^>nul') do (
            set "common7_path=%%c"
            if exist "!common7_path!\Tools\VsDevCmd.bat" (
                endlocal & (
                    set "VsDevCmd=%%c\Tools\VsDevCmd.bat"
                    set "_outer_temp=%%c\Tools\VsDevCmd.bat"
                )
                goto :BREAK_LOOP
            )
        )
    )
)
:BREAK_LOOP
endlocal & (
    if defined _outer_temp set "VsDevCmd=%_outer_temp%"
    if defined VsDevCmd set "VsDevCmd=%VsDevCmd%"
)
:: ================================
::
set "scriptPath=%~dp0"
:: 
:: ==========配置源码路径==========
set "source_dir=%scriptPath%Source"
:: ================================
:: 
cd /d %scriptPath%
if exist "build" (
	rd /s /q "build"
)
mkdir "build"
set "build_dir=%scriptPath%build"
:: 
:: ==========配置Skia安装目录==========
set "skia_dir=%scriptPath%Skia-Windows-Release-x64"
:: ==============================
:: 
set skia_library_dir=%skia_dir%\out\Release-x64
set skia_library=%skia_dir%\out\Release-x64\skia.lib
:: 
 
call %VsDevCmd% -arch=x64
cd /d %source_dir%
cmake  -S %source_dir%  -B %build_dir%  -DCMAKE_BUILD_TYPE=RelWithDebInfo  -DLAF_BACKEND=skia  -DSKIA_DIR=%skia_dir%  -DSKIA_LIBRARY_DIR=%skia_library_dir%  -DSKIA_LIBRARY=%skia_library%   -G Ninja
cmake --build %build_dir%
cd /d %build_dir%
ninja aseprite
echo Finish
pause
if exist "%build_dir%/bin/aseprite.exe" (
	echo Build Success!
	echo Aseprite will run automatically  after 10 seconds...
	timeout /t 10 /nobreak
	start "" "%build_dir%/bin/aseprite.exe"
)
exit
