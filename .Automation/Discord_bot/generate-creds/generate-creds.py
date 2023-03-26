import random
import string
import sys

# How many sets of credentials do you want to have?
nr_creds = int(sys.argv[1])

def generate_creds(length):
    # Set of characters used for both the username and passowrd
    chars_user = string.ascii_lowercase + string.digits
    chars_pass = string.ascii_lowercase + string.digits + string.ascii_uppercase + string.punctuation

    # Put together the usernames and passwords
    user = 'user_' + ''.join(random.choice(chars_user) for i in range(round(length/2-1)))
    password = ''.join(random.choice(chars_pass) for i in range(length))
    line = user + ' : ' + password
    return line

# Generate the pairs of credentials
for i in range(nr_creds):
    print(generate_creds(10))
