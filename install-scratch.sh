#!/bin/bash
SCRIPT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Set parameters
ORG_ALIAS="er01"

echo ""
echo "Installing Escape Room ($ORG_ALIAS)"
echo ""

# Install script
echo "Cleaning previous scratch org..."
sf org delete scratch -p -o $ORG_ALIAS &> /dev/null
echo ""

echo "Creating scratch org..." && \
sf org create scratch -f config/project-scratch-def.json -a $ORG_ALIAS -d -y 8 && \
echo "" && \

echo "Pushing source..." && \
sfdx force:source:deploy -m Settings:Security && \
sf project deploy start && \
echo "" && \

echo "Assigning permission sets..." && \
sf org assign permset -n ebikes && \
echo "" && \

echo "Importing sample data..." && \
sf data tree import -p data/sample-data-plan.json && \
echo "" && \

echo "Creating order and user data..." && \
sf apex run --file scripts/apex/users.apex && \
echo "" && \

echo "Opening org..." && \
sf org open -p lightning/n/Product_Explorer && \
echo ""

EXIT_CODE="$?"
echo ""

# Check exit code
echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Installation completed."
else
    echo "Installation failed."
fi
exit $EXIT_CODE
