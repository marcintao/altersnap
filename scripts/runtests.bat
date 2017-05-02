@echo off
setlocal

goto main

REM testpackages TEST_TYPE
:testpackages
set T=%1
for %%t in (control core examples grpc mgmt pkg plugin scheduler) do ( @echo running %T% tests in %%t && go test -v -tags=%T% ./%%t/... )
goto :EOF

:main
call :testpackages small
call :testpackages legacy
call :testpackages medium

goto :EOF
