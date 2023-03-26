#!/bin/bash

/usr/bin/socat tcp-listen:5001,fork exec:/home/chronos/challenges/linux/linux-nc-5001/flag.sh
