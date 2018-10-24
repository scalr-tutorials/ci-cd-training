# Jenkins Jobs (Manual setup)
The following stpes will show you how to setup the same basic Jenkins Job as will be setup later in the `build-cicd-farm` automation.

## Step 1:
Logon to the Jenkins server and choose "New Item"  

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-manual-setup/images/newitem.png)  

## Step 2:  
Enter the name of your new JOB and choose Freestyle.  

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-manual-setup/images/newjob.png)

## Step 3:  
Under Source Control choose git and enter the URL for your git repo.  

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-manual-setup/images/gitsetup.png)

## Step 4:
Under the Build section choose "Shell Script" then paste in the contents of jenkins_jobs_script.sh  

![Image description](https://github.com/scalr-tutorials/ci-cd-training/blob/master/Jenkins-manual-setup/images/build_script.png)
