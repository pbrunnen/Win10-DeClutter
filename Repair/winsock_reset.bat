@echo off

REM -- reset winsock entries
netsh winsock reset catalog

REM -- reset TCP/IP stack
netsh int ip reset reset.log hit
