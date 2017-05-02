@echo off
for %%t in (control core examples grpc mgmt pkg plugin scheduler) do ( @echo running %T% tests in %%t && go test -v -tags=%T% ./%%t/... ) >> report-%T%.txt


