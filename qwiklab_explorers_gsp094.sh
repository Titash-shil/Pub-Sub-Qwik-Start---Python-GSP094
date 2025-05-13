#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

clear


# Authenticate gcloud
gcloud auth list 

sudo apt-get install -y virtualenv

# Set up Python virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install --upgrade google-cloud-pubsub

# Clone repository
git clone https://github.com/googleapis/python-pubsub.git

# Navigate to scripts directory
cd python-pubsub/samples/snippets

# Display usage help
python publisher.py -h

# Create a topic
python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic

# Create a subscription
python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub

# Completion Message

echo -e "${GREEN_TEXT}${BOLD_TEXT}Subscribe to my Channel QwikLab Explorers:${RESET_FORMAT} ${BLUE_TEXT}${BOLD_TEXT}https://www.youtube.com/@qwiklabexplorers${RESET_FORMAT}"
echo
