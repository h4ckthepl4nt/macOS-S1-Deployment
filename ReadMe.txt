SentinelOne Agent deployment via MDM on headless Macs

I have 3 different scripts for managing S1 Deployments.

S1Install.sh - Used for new device enrollments
S1Upgrade.sh - Used to upgrade the S1 Agent
S1Downgrade.sh - Used to download the S1 Agent

MDM Settings could vary depending on the MDM you are using.

1. Use the Workspace ONE Admin Assistant tool to prep the pkg for deployment
2. Import the pkg and plist into your MDM and assign
3. Add the scripts to your MDM and assign
