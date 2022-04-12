# IP-scan
IP addresses check and scan on local network

## What is this?
This is very simple batch file to determine active IP adrfeses on the local network. Output is written to the generated file `ipaddresses.txt`.

## How to run?
Run this batch file and choose `PING` or `ARP` method.

If you choose `PING` method you will be asked to enter `IP range` without last number (like: 192.168.1), `Scan from` and `Scan to` range and `Ping Speed`.

- `Scan from` – put a number from 1 to 254
- `Scan to` – put a number from 1 to 254
- `Ping Speed (ms)` – Put a number from 1 (lower mean faster but it means less accuracy). Recommended value is 10 ms.
