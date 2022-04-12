@ECHO OFF
CLS
ipconfig /all
ECHO.

Rem INPUTS
SET /p ARGUMENT=Enter type of test (P)ING or (A)RP:%=%
IF "%ARGUMENT%"=="P" SET /p SUBNET=Enter IP range without last station number (like: 192.168.1):%=%
IF "%ARGUMENT%"=="P" SET /p FROM=Scan from:%=%
IF "%ARGUMENT%"=="P" SET /p TO=Scan to:%=%
IF "%ARGUMENT%"=="P" SET /p SPEED=Ping Speed (ms):%=%
ECHO.

ECHO #############################################################
IF "%ARGUMENT%"=="P" GOTO PING
IF "%ARGUMENT%"=="A" GOTO ARP
GOTO END

Rem PING method
:PING
  ECHO START SCANNING %SUBNET%.%FROM% - %TO% (%SPEED% ms per ping)
  ECHO %0 > ipaddresses.txt
  DATE /T >> ipaddresses.txt
  TIME /T >> ipaddresses.txt
  FOR /L %%i IN (%FROM%,1,%TO%) DO ping -n 1 -w %SPEED% %SUBNET%.%%i | FIND /i "Reply" >> ipaddresses.txt
  ECHO.
  type ipaddresses.txt
  GOTO END

Rem ARP method
:ARP
  ECHO ARP
  ARP -a > ipaddresses.txt
  type ipaddresses.txt
  GOTO END

Rem Done
:END
  ECHO.
  ECHO DONE %0
  ECHO #############################################################
  ECHO.
  PAUSE