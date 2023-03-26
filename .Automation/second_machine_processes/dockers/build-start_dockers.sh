#!/bin/bash

# Define the path to the file containing script paths
SCRIPT_FILE="/home/chronos/processes/dockers/containers.txt"

# Read the script paths from the file into an array
readarray -t SCRIPTS < "$SCRIPT_FILE"

# Initialize a variable to keep track of whether all scripts are running
all_running=true

# Define ANSI escape codes for collored messages
BLUE='\033[94m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Loop over the script paths and check if each script is running
for script in "${SCRIPTS[@]}"
do
    name=$(echo $script | awk -F/ '{print $6}')
    echo -e "\nChecking container \"$name\""
    if docker-compose -f "$script" ps 2>/dev/null | grep -q "Up"; then
        echo -e "${BLUE}Container already running.${NC}"
    else
        all_running=false
        echo -e "${RED}Container not running, building...${NC}"
        docker-compose -f "$script" up --build --force-recreate --remove-orphans --detach

        # Check if the container is running now
        exists=$(docker ps -a --filter "name=$name" | grep -o "$name")
        if [ -n "$exists" ]; then
            all_running=true
        fi
    fi
done


if "$all_running"; then
    echo -e "\n${BLUE}All containers are running.${NC}"
else
    echo -e "\n${RED}Not all containers are running.${NC}"
fi

