# Tomcat_Deployment_with_Ansible
Automate Tomcat deployment with Ansible

## Overview:
The purpose of this project is to automate the deployment of tomcat with Ansible and to test it in a container.

## Docker Image
In the Dockerfile to create the image, the `FROM` command is used to determine the base image, the `CMD` command :  
`chmod +x /data/tomcat_test.sh && /data/tomcat_test.sh $ENVIRONMENT` to give permission to run the tomcat_test.sh script under the /data volume and set the command to run the script with the environment variable.

## Deploy
In the "tomcat_deploy.sh" file, we made the build to create the image named "ansible" using the command :  
`docker image build -t ansible .`.

Then we did the run to build the container and start and delete it (--rm) with the command :  
`docker run --rm --privileged -p 8080:8080 -v $(pwd)/deploy/:/data -e ENVIRONMENT='${ENVIRONMENT}' ansible` .  
We put --privileged as requested in the statement, we exposed the port with -p 8080:8080, we created a volume to do the mount with -v $(pwd)/deploy/:/data 
and we declared a variable with - e ENVIRONMENT='${ENVIRONMENT}.

The deploy folder is the volume folder.
It contains the files needed to deploy our application. The “tomcat_deploy.yml” file is the ansible playbook to manage configuration and automate deployment.
Apart from the “sample.war” file which is the war to deploy and the “tomcat_test.sh” file to check the steps, the other files are Apache Tomcat configuration files.
