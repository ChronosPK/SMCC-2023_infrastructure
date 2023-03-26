#!/usr/bin/python3

import re
from inputimeout import inputimeout, TimeoutOccurred
import sys


# user interation
print("""Salut! Concursul se apropie!
Veti mai primi cateva exercitii pentru acomodare, sper sa va placa.
Pentru inceput, raspunde la aceasta intrebare (ai doar 3 secunde):

In ce luna are loc concursul?
""")

# correct response
correct = "martie"

# read the flag from local machine
f_open = open("/home/chronos/challenges/pre-ctf/give-me-the-date/flag.txt","r")
f = f_open.read()

try:
   # input gets only 3 seconds before timeout
   response= inputimeout(prompt='>> ', timeout=3)

   # compare solution with input
   if (re.match(correct,response.lower())):
      print("Super! Uite un flag: ", f)
   else:
      print("Nu chiar, mai incearca.")
      exit()

# case if timeout is hit
except TimeoutOccurred:
   print("Prea lent!")
   exit()
# in case the user exists unexpectedly
except OSError:
    print('Input/output error occurred. Exiting.')
    sys.exit(1)
