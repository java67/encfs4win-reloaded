@echo Generating boost minimal Debug and Stable distribution (/boost)
@echo from boost official binary distribution (/boost-full).
@echo This is only needed if you want to upgrade boost, or use more boost functions, and then distribute a lightweight source. You need to download boost binary distribution in /boost of source root folder, and preferably remove existing /boost
@echo.
@echo Make bcp.exe
@IF not exist ..\boost-full\ (
@echo ERROR: boost-full folder doesn't exists in parent directory, exiting.
@EXIT /B 2
)
cd ..
if not exist boost\ mkdir boost
@IF not exist boost-full\dist\bin\bcp.exe (
@echo Building boost minimizer ^(bcp.exe^) from source
cd boost-full
call bootstrap.bat
b2 tools/bcp
cd ..
)
@echo Copying necessary files
@REM Find all "boost/" whole word in /encfs | replace "^[^<\n]+<" by " " | replace ">[^\n]+" by "" | remove duplicates | replace "\n" by ""
cd boost-full
dist\bin\bcp boost/scoped_array.hpp boost/version.hpp boost/filesystem/fstream.hpp boost/archive/xml_iarchive.hpp boost/archive/xml_oarchive.hpp boost/serialization/binary_object.hpp boost/serialization/nvp.hpp boost/serialization/split_free.hpp ../boost
cd ..
if not exist boost\lib32-msvc-14.0\ mkdir boost\lib32-msvc-14.0
copy /Y boost-full\lib32-msvc-14.0\libboost_filesystem-vc140-mt-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\lib32-msvc-14.0\libboost_serialization-vc140-mt-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\lib32-msvc-14.0\libboost_system-vc140-mt-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\lib32-msvc-14.0\libboost_filesystem-vc140-mt-gd-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\lib32-msvc-14.0\libboost_serialization-vc140-mt-gd-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\lib32-msvc-14.0\libboost_system-vc140-mt-gd-1_59.lib boost\lib32-msvc-14.0\
copy /Y boost-full\dist\bin\bcp.exe boost\bcp.exe
cd tools
@echo You can now delete boost-full if needed
