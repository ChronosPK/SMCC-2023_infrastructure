#!/bin/bash

/usr/bin/python3 -c 'print(" ".join([str(ord(i)) for i in "flag{the_new_guy_is_weird}"]))' > encflag
# redirect to file "encflag" for later
```

- create blank (white) pdf file (we only need one)
```bash
vim blank.txt -c "hardcopy > blank.ps | q" # blank text file
ps2pdf blank.ps # created blank.pdf
```

- encode each character of the flag in the serial information (one character for one pdf)
```bash
for i in {1..26}; do deda_create_dots --serial $(echo -en "000";cat encflag| cut -d " " -f $i) blank.pdf; mv new_dots.pdf $i.pdf; pdftoppm $i.pdf scan -png; mv scan-1.png $i.png ; done
```

- merge all pdf files into one
```bash
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf *.pdf
```
