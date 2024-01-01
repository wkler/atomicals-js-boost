#!/bin/bash

# Specify the number of loops
numberOfLoops=10

# Specify the output file
outputFile="output.log"

# Use a for loop to execute a specified number of times
for ((i=1; i<=numberOfLoops; i++))
do
    echo "This is the ${i}th loop" | tee -a $outputFile

    # Run yarn command and append output to the file
    yarn cli mint-dft quark --satsbyte 100 >> $outputFile 2>&1

    # Check whether the command was executed successfully
    if [ $? -ne 0 ]; then
        echo "Command execution failed, try to run again..." | tee -a $outputFile
    else
        echo "The command was executed successfully and is ready for the next cycle..." | tee -a $outputFile
    fi

    # Wait for some time (optional)
    sleep 1
done

echo "loop completed" | tee -a $outputFile
