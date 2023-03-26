#!/usr/bin/python3

import re
import string
import random
from inputimeout import inputimeout, TimeoutOccurred
import base64
import textwrap
import sys

# digits and letters
digits = string.digits
letters = string.ascii_lowercase

# random digits, letters and number of repetitions for each
r_letter = random.choice(letters)
r_num_letters = int(random.randrange(30,100))

# request
print("Give me the letter \"%s\" %d times." % (r_letter,r_num_letters))
sol_letter = r_letter * r_num_letters


f_open = open("/home/chronos/challenges/misc/faster/flag.txt","r")
f = f_open.read()

# validate input
try:
   response= inputimeout(prompt='>> ', timeout=3)
   if (re.match(sol_letter,response)):
      print("Nice work! ",f)
   else:
      print("Too bad, try again!")
      exit()

except TimeoutOccurred:
   print("Too slow!")
   exit()

except OSError:
    print('Input/output error occurred. Exiting.')
    sys.exit(1)

