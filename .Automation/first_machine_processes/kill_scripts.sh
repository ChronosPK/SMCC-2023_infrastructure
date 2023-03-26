#!/bin/bash


# Define the path to the file containing script paths
SCRIPT_FILE="/home/chronos/processes/scripts.txt"

# Read the script paths from the file into an array
readarray -t SCRIPTS < "$SCRIPT_FILE"

# Loop over the script names and find the process IDs of each script
for script in "${SCRIPTS[@]}"
do
    # Use pgrep to find the process ID(s) of the script
    pids=$(pgrep -f "$script")

    if [ -z "$pids" ]; then
        echo "Script $script is not running."
    else
        echo "Script $script is running with PID(s): $pids"
        # Loop over the process IDs and kill each one
        for pid in $pids
        do
            if [[ $pid != $$ ]]; then # skip the current process running the script
                echo "Killing process with ID $pid (script: $script)..."
                kill $pid
            fi
        done
        echo ""
    fi
done
