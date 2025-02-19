# submission reminder app Faith842

## What is the app
This app is a simple bash-based script designed to help administrator and instructors track submissions for a given assignment.

## The structure
When you run the script you see it as follows
submission_reminder_<userName>/
├── config/
│   └── config.env
├── modules/
│   └── functions.sh
├── app/
│   └── reminder.sh
└── assets/

## What does each file do
1. config/config.env: This file contains environment variables used by thescripts
2. assets/submissions.txt: This file holds a list of students' names, assignments, and their submission statuses.
3. modules/functions.sh: Contains the functions check_submissions, which readsthe submissions.txt files and checks for students who have not submitted their assignment.
4. app/reminder.sh: Is responsible for printing the assignment name, remaining days,and then calling check_submissions to printout reminders for those who have not yet submitted their work.
5. startup.sh: When this script runs, it starts the app by calling reminder.sh

## How to set it up
1. Download or clone the project.
2. Go to the project folder.
3. Run the script:bash create_environment.sh
4. cd submission_reminder_<yourName>
5. Run the script:./ startup.sh to launch the app
