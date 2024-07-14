@echo off
setlocal

rem Set variables
set INTERFACE_NAME=Ethernet
set STATIC_IP=192.168.1.100
set SUBNET_MASK=255.255.255.0
set DEFAULT_GATEWAY=192.168.1.1
set DNS_SERVER=8.8.8.8
set ALTERNATE_DNS=8.8.4.4

rem Remove existing IP address configuration (if any)
netsh interface ipv4 delete address name="%INTERFACE_NAME%" addr=%STATIC_IP%

rem Set static IP address
netsh interface ipv4 set address name="%INTERFACE_NAME%" static %STATIC_IP% %SUBNET_MASK% %DEFAULT_GATEWAY%

rem Set DNS server address
netsh interface ipv4 set dns name="%INTERFACE_NAME%" static %DNS_SERVER%
netsh interface ipv4 add dns name="%INTERFACE_NAME%" addr=%ALTERNATE_DNS% index=2

endlocal
pause
