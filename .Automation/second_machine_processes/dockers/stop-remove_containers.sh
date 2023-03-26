#!/bin/bash

# Define the path to the file containing container paths
CONTAINER_FILE="/home/chronos/processes/dockers/containers.txt"

# Read the container paths from the file into an array
readarray -t CONTAINERS < "$CONTAINER_FILE"

# Define ANSI escape codes for colored messages
BLUE='\033[94m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Stop all containers
for container in "${CONTAINERS[@]}"
do
    name=$(echo "$container" | awk -F/ '{print $6}')
    echo -e "\nStopping and removing container \"$name\""
    docker-compose -f "$container" down --remove-orphans --volumes 2>/dev/null

    # Check if the container is still running
    exists=$(docker ps -a --filter "name=$name" | grep -o "$name")
    if [ -z "$exists" ]; then
        echo -e "${BLUE}Container \"$name\" has been removed.${NC}"
    else
        echo -e "${RED}Failed to remove container \"$name\".${NC}"
    fi
done
