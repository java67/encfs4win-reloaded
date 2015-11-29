@echo Cleaning project, but keeping Debug and Stable library dependencies (.lib)
@REM Temporary save libraries
if not exist bin\ mkdir bin
if not exist bin\Debug mkdir bin\Debug
if not exist bin\Release mkdir bin\Release

rmdir /S /Q bin\Debug
rmdir /S /Q bin\Release
if not exist bin\Debug\ mkdir bin\Debug
if not exist bin\Release\ mkdir bin\Release

move /Y "dokany\Win32\Debug\dokanfuse.lib" "bin\Debug\"
move /Y "dokany\Win32\Release\dokanfuse.lib" "bin\Release\"
move /Y "rlog\win32\Debug\rlog.lib" "bin\Debug\"
move /Y "rlog\win32\Release\rlog.lib" "bin\Release\"
move /Y "rlog\win32\Debug\rlog.dll" "bin\Debug\"
move /Y "rlog\win32\Release\rlog.dll" "bin\Release\"

del encfs\msvc\*.user
del encfs\msvc\encfs.ncb
del encfs\msvc\encfs.suo
del encfs\msvc\encfs.sdf
del encfs\msvc\encfs.opensdf
rmdir /S /Q encfs\msvc\Debug
rmdir /S /Q encfs\msvc\Release

del encfs\encfs\*.user
del encfs\encfs\encfs.ncb
del encfs\encfs\encfs.suo
del encfs\encfs\encfs.sdf
del encfs\encfs\encfs.opensdf
rmdir /S /Q encfs\encfs\Debug
rmdir /S /Q encfs\encfs\Release

del dokany\*.user
del dokany\dokan.ncb
del dokany\dokan.suo
del dokany\dokan.sdf
del dokany\dokan.opensdf
rmdir /S /Q dokany\Win32
rmdir /S /Q dokany\dokan\Win32
rmdir /S /Q dokany\dokan_control\Win32
rmdir /S /Q dokany\dokan_fuse\Win32
rmdir /S /Q dokany\dokan_mirror\Win32
rmdir /S /Q dokany\dokan_mount\Win32
rmdir /S /Q dokany\dokan_np\Win32
rmdir /S /Q dokany\dokan_sys\Win32

del rlog\win32\*.user
del rlog\win32\rlog.ncb
del rlog\win32\rlog.suo
del rlog\win32\rlog.sdf
del rlog\win32\rlog.opensdf
rmdir /S /Q rlog\win32\Debug
rmdir /S /Q rlog\win32\Release

if not exist dokany\Win32\ mkdir dokany\Win32
if not exist dokany\Win32\Debug\ mkdir dokany\Win32\Debug
if not exist dokany\Win32\Release\ mkdir dokany\Win32\Release

if not exist rlog\win32\ mkdir rlog\win32
if not exist rlog\win32\Debug\ mkdir rlog\win32\Debug
if not exist rlog\win32\Release\ mkdir rlog\win32\Release

move /Y "bin\Debug\dokanfuse.lib" "dokany\Win32\Debug\"
move /Y "bin\Release\dokanfuse.lib" "dokany\Win32\Release\"
move /Y "bin\Debug\rlog.lib" "rlog\win32\Debug\"
move /Y "bin\Release\rlog.lib" "rlog\win32\Release\"
move /Y "bin\Debug\rlog.dll" "rlog\win32\Debug\"
move /Y "bin\Release\rlog.dll" "rlog\win32\Release\"
rmdir /S /Q bin\Debug
rmdir /S /Q bin\Release
