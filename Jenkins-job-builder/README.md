# Jenkins-Job-builder (Automated Job setup)
This is the job automation tool used in both the Chef and Ansible automation.  
This tool uses a yaml formated file to build a job on your Jenkins servers

## Prerequisites:
- pip installed  

## Step 1:
Install Jenkins-jobb-builder, by running 'pip install jenkins-job-builder'

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-job-builder/images/pipinstalljobbuilder.png)  

## Step 2:  
Update the demo "jenkins_jobs.ini" file found in this folder

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-job-builder/images/jenkinsini.png)

## Step 2:  
Update the demo jobs found in the "jobs" folder

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-job-builder/images/jobyaml.png)

## Step 4:  
run 'jenkins-jobs update dev-job.yml'  

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-job-builder/images/gitsetup.png)

## Step 5:
Look in the Jenkins UI you should see the jobs

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-job-builder/images/build_script.png)

## Step 5:
