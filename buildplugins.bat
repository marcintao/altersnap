@echo off
setlocal
set wd=%CD%

for /f "usebackq" %%v in (`go env GOOS`) do set GOOS=%%v
for /f "usebackq" %%v in (`go env GOARCH`) do set GOARCH=%%v

set prefix="%SNAP_PATH%\%GOOS%\%GOARCH:amd64=x86_64%\plugins
echo "prefix=%prefix%"
mkdir "%prefix%"
pushd plugin
for %%c in (collector processor publisher) do (
	pushd %%c
	for /f "usebackq" %%p in (`"dir /b /a:d"`) do (
		pushd %%p
		echo inside %%c/%%p
		go build
		copy *.exe "%prefix%"
		popd
	)
	popd
)
popd
dir /s %SNAP_PATH%

