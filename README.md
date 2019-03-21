# Sample php website : Docker edition

To run this project, you first have to clone this repository. Though it should be alright, make sure you're placed on the `jenkins` branch. Then, type `./start.sh` and it'll guide you through the whole testing process. 

For MAC users, you'll have to authorize docker to share the folder `/var/jenkins_home`. To do that, type this command : 
`sudo mkdir /var/jenkins_home`
and then 
`sudo chmod -R 777 /var/jenkins_home` 

It'll create the directory in which we'll store the jenkins config, so it can communicate with docker freely. It's a little workarround I had to come with to allow jenkins to run a docker-compose stack. 

Then, go to the Docker app, in `preferences` then `share folders` or something like that, and manually add `/var/jenkins_home`. And that should do it. 

In ANY CASE (MAC OS, Linux, or whatever), once you cloned the repo, `cd` in the repo folder and  just type 
`cp -R jenkins_home/* /var/jenkins_home`, so you'll have my jenkins config working as it should (normally)

For the rest, let the `start.sh` script guide you :) 