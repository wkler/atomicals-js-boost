#!/bin/bash

# Initialize loop count and total duration
loop_count=0
total_duration=0

# Specify the number of loops
numberOfLoops=10

# Use a for loop to execute a specified number of times
for ((i=1; i<=numberOfLoops; i++))
do
 # Increment loop count
    ((loop_count++))

    # Record start time
    start_time=$(date +%s)

    # Run yarn command
    yarn cli mint-dft quark --satsbyte 60 

    # Record end time
    end_time=$(date +%s)

    # Calculate duration
    duration=$((end_time - start_time))

    # Update total duration
    total_duration=$((total_duration + duration))

    # Check if the command was executed successfully
    if [ $? -ne 0 ]; then
        echo "Loop ${loop_count}: Command failed, attempting to rerun... Current duration: ${duration} seconds, Total duration: ${total_duration} seconds" | tee -a quark.log
    else
        echo "Loop ${loop_count}: Command executed successfully, rerunning... Current duration: ${duration} seconds, Total duration: ${total_duration} seconds" | tee -a quark.log
    fi

    # Wait for some time (optional)
    sleep 6 
done

echo "loop completed"
