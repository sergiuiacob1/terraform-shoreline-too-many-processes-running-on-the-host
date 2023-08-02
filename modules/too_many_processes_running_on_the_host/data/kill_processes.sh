#!/bin/bash



# Use pkill with the -f option to match against the full command line

pkill -f ${REGEX_PATTERN}



# Check if any matching processes were terminated

if [ $? -eq 0 ]; then

  echo "Processes matching pattern '$regex_pattern' were terminated."

else

  echo "No processes found matching the pattern '$regex_pattern'."

fi