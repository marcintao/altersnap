@echo off
setlocal
set wd=%CD%

for /f "usebackq" %%v in (`go env GOOS`) do set GOOS=%%v
for /f "usebackq" %%v in (`go env GOARCH`) do set GOARCH=%%v

set prefix="%SNAP_PATH%\%GOOS%\%GOARCH:amd64=x86_64%"
echo "prefix=%prefix%"
mkdir "%prefix%"
echo "building snapteld"
go build -o "%prefix%\snapteld.exe"
echo "building snaptel"
pushd cmd\snaptel
go build -o "%prefix%\snaptel.exe"
popd
dir /s %SNAP_PATH%
echo "finished"
