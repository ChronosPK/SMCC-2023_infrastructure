#!/bin/bash

/usr/bin/socat tcp-listen:1337,fork system:'exec /usr/bin/python3 /home/chronos/challenges/misc/misc-faster-1337/hosting.py 2>/dev/null',pty,raw,echo=0
