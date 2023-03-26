#!/bin/bash

# Define the path to the file containing script paths
SCRIPT_FILE="/home/chronos/processes/scripts/scripts.txt"

# Read the script paths from the file into an array
readarray -t SCRIPTS < "$SCRIPT_FILE"

# Initialize a variable to keep track of whether all scripts are running
all_running=true

# Loop over the script paths and check if each script is running
for script in "${SCRIPTS[@]}"
do
    #script_dir=$(echo $script | xargs dirname)
    if ! pgrep -f "$script" > /dev/null
    then
        all_running=false
        echo "Script '$script' is not running. Starting..."
        "$script" &

        sleep 3

        # Check if the script started successfully
        if pgrep -f "$script" > /dev/null
        then
            echo -e "Script '$script' started successfully.\n"
            all_running=true
        else
            echo -e "Failed to start script '$script'.\n"
        fi
    fi
done

# Check if all scripts are running and print a message
if $all_running
then
    echo -e "All scripts are running."
else
    echo -e "\nNot all scripts are running."
fi
