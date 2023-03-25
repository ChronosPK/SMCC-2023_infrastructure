#!/bin/bash

# fake flag
echo 'flag{sorry_but_wrong_flagg}' > fake_flag

# real flag
echo 'flag{awesome_thing_you_did}' > real_flag

# each character on lewline to be transferrer to a file
sed 's/./\0\n/g' -i {real,fake}_flag


iter=50

for l in $(eval echo "{1..$iter}"); do
	i=1
	mkdir -p files-$l
	mkdir -p images-$l
	
	# add the wrong flag
	while read -r line; do
		# add each character of the wrong flag to an individual file
		echo -n ".{.$line.}." > files-$l/$i.pdf
		# each character is converted to a QR code
		qrencode `cat files-$l/$i.pdf` -o images-$l/796F75$i.png 
		let i+=1
	done < fake_flag
done


# one directory will contain the right flag
right=`for r in $(eval echo "{25..$iter}"); do echo $r >> shuf ; done; cat shuf|shuf -n 1`
echo "The flag is in folder $right"


# add the right flag
i=1
while read -r line; do
	echo -n ".{.$line.}." > files-$right/$i.pdf
	qrencode `cat files-$right/$i.pdf` -o images-$right/796F75$i.png 
	let i+=1
done < real_flag	


# add a password 
echo "nice find" > 'images-10/X2FuZF9tZQo='

# archive everything with a password
zip -r --password 'you_and_me' archive images-* 'images-10/X2FuZF9tZQo='

# test - manually is working
# define iter 

for i in $(eval echo "{1..$iter}"); do zbarimg images-$i/* > out-$i; done
for i in $(eval echo "{1..$iter}"); do cat out-$i| cut -d "." -f3 | tr -d "\n"; echo ; done | sort -u

# remove evrything but the archive and the script
find . ! -name "*.sh" ! -name "*.zip" -delete

# clean the excess files
# find . ! -name *.sh -delete
