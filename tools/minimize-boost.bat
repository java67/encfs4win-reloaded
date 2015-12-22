@echo BUILD and MINIMIZE required boost dependencies
@echo.
@echo Make bcp.exe
@IF not exist ..\boost-full\ (
@echo ERROR: boost-full folder doesn't exists in parent directory, exiting.
@echo You need to download Boost C++ Libraries 1.60 from official site and extract it in /boost-full at root.
@EXIT /B 2
)
cd ..
if not exist boost\ mkdir boost
@IF not exist boost-full\dist\bin\bcp.exe (
cd boost-full
@echo Initializing bootstrap
call bootstrap.bat
@echo Building boost libraries from source
b2 --with-filesystem stage
b2 --with-serialization stage
b2 --with-system stage
@echo Building boost minimizer ^(bcp.exe^) from source
b2 tools/bcp
cd ..
)
@echo Copying necessary files
@REM Find all "boost/" whole word in /encfs | replace "^[^<\n]+<" by " " | replace ">[^\n]+" by "" | remove duplicates | replace "\n" by ""
cd boost-full
dist\bin\bcp boost/scoped_array.hpp boost/version.hpp boost/filesystem/fstream.hpp boost/archive/xml_iarchive.hpp boost/archive/xml_oarchive.hpp boost/serialization/binary_object.hpp boost/serialization/nvp.hpp boost/serialization/split_free.hpp ../boost
cd ..
if not exist boost\lib32-msvc-14.0\ mkdir boost\lib32-msvc-14.0
copy /Y boost-full\stage\lib\libboost_filesystem-vc140-mt-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\stage\lib\libboost_serialization-vc140-mt-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\stage\lib\libboost_system-vc140-mt-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\stage\lib\libboost_filesystem-vc140-mt-gd-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\stage\lib\libboost_serialization-vc140-mt-gd-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\stage\lib\libboost_system-vc140-mt-gd-1_60.lib boost\lib32-msvc-14.0\
copy /Y boost-full\dist\bin\bcp.exe boost\bcp.exe
cd tools
@echo You can now delete boost-full if needed
