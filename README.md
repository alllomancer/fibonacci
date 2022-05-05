# fibonacci

the fibonacci go package will output a random number between 1 and 50 every 60 seconds
and it will print out the fibonacci sequence of that number


## Task 1
the code is in golang for simplicity and the built in test framework

## task 2
the dockerfile is building the executalbe in the base image and copies it and all dependecies to the running image, 
final image build size is 3 MB

## task 3
the folder vm contains the vagrantfile to spin up 2 machines
* a jenkins machine
* a node that is capable of running docker
the ansible playbook installs java and jenkins on the jenkins machine
the node is created using a vm box with docker built in

## bonus
the tf folder contains all the code needed to deploy the docker on ecs
it assumes that the vpc used is called "default" and the subnet are tagged with "privata" and "public" tags


## another bonus
for CI the repo is using github actions in order to build the image on any change to the github code in the main branch
