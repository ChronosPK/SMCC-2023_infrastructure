#!/bin/bash

/usr/bin/socat tcp-listen:9999,fork system:'exec /usr/bin/python3 /home/chronos/challenges/prep/prep-date-9999/hosting.py 2>/dev/null',pty,raw,echo=0
