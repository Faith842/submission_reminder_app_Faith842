#!/bin/bash

#Prompt for user's name 
read -p "Enter your name: " userName

#Define main directory
Sub_Directory="submission_reminder_${userName}"

#Create directory structure
mkdir -p "$Sub_Directory/config"
mkdir -p "$Sub_Directory/modules"
mkdir -p "$Sub_Directory/app"
mkdir -p "$Sub_Directory/assets"

#Create necessary files
touch "$Sub_Directory/config/config.env"
touch "$Sub_Directory/assets/submissions.txt"
touch "$Sub_Directory/app/reminder.sh"
touch "$Sub_Directory/modules/functions.sh"
touch "$Sub_Directory/startup.sh"

#Populate config.env
cat << EOF > "$Sub_Directory/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
Days_Remaining=3
EOF

#Populate submissions.txt with sample students records
cat << EOF > "$Sub_Directory/assets/submissions.txt"
students, assignment, submission status
Faith, Shell init, submitted
Kezia, Shell Navigation, submitted
Sissy, Shell Basics, not submitted
Fadhilla, Git, submitted
John, Shell Script, not submitted
Jason, Shell Navigation, not submitted
Chris, Shell Basics, submitted
EOF

#Populate functions.sh
cat << 'EOF' > "$Sub_Directory/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check submissions {
    local submissions_file+#1
    echo "Check submissions in $submissions_file"

    #Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
    # Remove leading and trailing whitespace
    student=#(echo "$student" | xargs)
    assignment=$(echo "$assignment" | xargs)
    status=$(echo "$status" | xargs)

   # Check if assignment matches and status is 'not submitted'
   if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted"]]; then 
       echo "Reminder: $The student has not submitted the $ASSIGNMENT assignment!"
   fi
 done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

#Populate reminder.sh
cat << 'EOF' > "$Sub_Directory/app/reminder.sh"
#!/bin/bash
#!/bin/bash

#Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

#Path to the submission file
submissions_file="./assets/submissions.txt"

#Print the remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF


