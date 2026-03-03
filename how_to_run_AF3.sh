#!/bin/bash

###############################################################################
# AlphaFold3 Manual Workflow on DKUCC
#
# This script documents the standard procedure for running AlphaFold3 (AF3)
# on the DKUCC cluster.
#
# Execute commands step-by-step as needed.
###############################################################################


############################
# 1. Login to DKUCC
############################

# Run this command from your local terminal:
ssh your_netid@dkucc-login-01.rc.duke.edu

# Example:
# ssh tz141@dkucc-login-01.rc.duke.edu


############################
# 2. Enter Your Working Directory
############################

cd /work/your_netid

# Example:
# cd /work/tz141

# Your directory should contain:
#   AF3_Input/
#   AF3_Output/
#   run_AF3.sh
#
# If not, create them:

mkdir -p AF3_Input AF3_Output


############################
# 3. Upload Input JSON Files
############################

cd AF3_Input

# Connect to the remote server containing your JSON files:
sftp user@remote_ip
get *.json (upload all json files)
exit (return to DKUCC)

# IMPORTANT:
# After connecting via sftp, navigate step-by-step into the directory
# containing your JSON files.
# Avoid jumping directly to deep directories in a single command,
# as this may cause connection issues.

# Example SFTP session:
#
# sftp test@10.200.20.112
#   cd /u02
#   cd tianyue
#   cd AF3
#   cd input_files
#   get *.json (upload all json files)
#   exit
#

# After exiting SFTP, you will return to DKUCC.


############################
# 4. Submit AF3 Job
############################

# Make sure you are still inside:
# /work/your_netid/AF3_Input

sbatch /work/your_netid/run_AF3.sh


############################
# 5. Monitor Job Status
############################

# View running jobs and elapsed runtime:
squeue


############################
# 6. View Output Files
############################

cd ../AF3_Output

# For each input JSON file:
#   - An output folder will be created.
#   - The folder name matches the "name" field in the input JSON.
#   - Each folder contains:
#       6 files
#       5 subdirectories
#
# Key output files:
#
#   pTM and/or ipTM scores:
#       name_summary_confidences.json
#
#   Predicted structure:
#       name_model.cif
#
###############################################################################
# End of workflow
###############################################################################
