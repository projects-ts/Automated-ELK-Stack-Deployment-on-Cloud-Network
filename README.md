# Automated ELK Stack Deployment
### Created by: Travis Sherwood

The files in this repository were used to configure the network depicted below.

![](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Diagrams/Azure%20Network%20Diagram%20with%20ELK%20Stack%20Configuration%20for%20Cloud%20Monitoring.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML files may be used to install only certain pieces of it, such as Filebeat.

* [ELK Playbook](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Ansible/ELK%20Stack/install-elk.yml)
* [Filebeat Playbook](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Ansible/Filbeat%20Installation/filebeat-playbook.yml)
* [Metricbeat Playbook](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Ansible/Metricbeat%20Installation/metricbeat-playbook.yml)

This document contains the following details:

* Description of the Topology
* Access Policies
* ELK Configuration
  * Beats in Use
  * Machines Being Monitored
* How to Use the Ansible Build

## Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics.

The configuration details of each machine may be found below.
| Name                 | Function                     | IP Address                                   | Operating System |
|----------------------|------------------------------|----------------------------------------------|------------------|
| Jump-Box-Provisioner | Gateway with Ansible Docker  | Private IP: 10.0.0.4 Public IP: 168.61.33.79 | Linux            |
| Web-1                | Web Server with DVWA Docker  | Private IP: 10.0.0.5                         | Linux            |
| Web-2                | Web Server with DVWA Docker  | Private IP: 10.0.0.6                         | Linux            |
| Web-3                | Web Server with DVWA Docker  | Private IP: 10.0.0.7                         | Linux            |
| ELK-SERVER           | Web Server running ELK Stack | Private IP: 10.1.0.4                         | Linux            |

## Access Policies
The machines on the internal network are not exposed to the public Internet.
Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

* Local Machine IP

Machines within the network can only be accessed by the Local Machine IP.

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses                                          |
|----------------------|---------------------|---------------------------------------------------------------|
| Jump-Box-Provisioner | Yes                 | Local Machine IP                                              |
| Web-1                | No                  | 10.1.0.4                                                      |
| Web-2                | No                  | 10.1.0.4                                                      |
| Web-3                | No                  | 10.1.0.4                                                      |
| ELK-SERVER           | Yes                 | 10.1.0.4, Kibana over port 5601, Elasticsearch over port 9200 |

## Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because with the utilization of Infrastructure as Code (IAC) there is less of a chance of human error. It also much faster to setup, configure, deploy, or tear down machines. 

The playbook implements the following tasks:
* Install docker.io using the apt module
* Install python3-pip3 using the apt module
* Install docker using the pip module
* Use systctl to increase size of virtual memory
* Download and launch a Docker ELK container with published ports: 5601,9200, and 5044
* Enable Docker to start on boot

The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.
![](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Diagrams/docker_ps_output.PNG)

## Target Machines & Beats
This ELK server is configured to monitor the following machines:

* Web-1: 10.0.0.5
* Web-2: 10.0.0.6
* Web-3: 10.0.0.7

We have installed the following Beats on these machines:

* Filebeat
* Metricbeat

These Beats allow us to collect the following information from each machine:

* Filebeat detects changes to file systems and collects log data to sends them to Elasticsearch or Logstash (for indexing). If a log file is created, edited, or deleted, Filebeat will alert you to those changes.
* Metricbeat monitors and collects system metrics and stastics and fowards them to Elasticsearch or Logstash. For example, Metricbeat can be utilized to monitor CPU information.

## Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
SSH into the control node and follow the steps below:

* Copy the configuration files to /etc/ansible in your Ansible control node.
* Update the hosts file to include the IP addresses of your webservers and ELK server.

Example: 
| [webservers]                                                                                                                                                   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 10.0.0.5 ansible_python_interpreter=/usr/bin/python3 
10.0.0.6 ansible_python_interpreter=/usr/bin/python3 
10.0.0.7 ansible_python_interpreter=/usr/bin/python3 |

| [elk]                                                |
|------------------------------------------------------|
| 10.1.0.4 ansible_python_interpreter=/usr/bin/python3 |

* Run the playbook, and navigate to http://[*Your ELK Server Public IP*]:5601 to check that the installation worked as expected.

## Commands
### Commands for ELK Server Setup:

- **SSH into JumpBox**
  - ssh (username)@(Jump-Box-Provisioner Public IP)
- **Attach Ansible container**
  - sudo docker container list -a
  - sudo docker start (ansible container)
  - sudo docker attach (ansible container)
- **Add IP address to hosts file**
  - sudo nano /etc/ansible/hosts
- **Add ELK server IP**
  - [elk]
  - 10.1.0.4 ansible\_python\_interpreter=/usr/bin/python3
- **Add username to ansible configuration**
  - cd /etc/ansible
  - sudo nano ansible.cfg
- **Add username**
  - Remote\_user = (username)
- **Run ELK playbook**
  - ansible-playbook install-elk.yml
- **SSH into ELK server**
  - ssh (username)@(ELK sever Private IP)

### Commands for Filebeat setup

- **SSH into JumpBox**
  - ssh (username)@(Jump-Box-Provisioner Public IP)
- **SSH into ELK Server**
  - ssh (username)@(ELK Server Private IP)
- **Edit Filebeat configuration file after copying it into the /etc/ansible directory**
  - sudo nano /etc/ansible/filebeat-config.yml
    - **Edits to Make:** 
      - Scroll to the Elasticsearch output field and add the ELK Sever IP to the hosts with port 9200
        - Example: hosts: [10.1.0.4:9200]
      - Scroll to the Kibana field and add the ELK Server IP to the host with port 5601
        - Example: host: “10.1.0.4:5601”
- **Add the Filebeat Playbook (filebeat-playbook.yml) to /etc/ansible directory**
- **Run the Filebeat Playbook**
  - ansible-playbook filebeat-playbook.yml

### Commands for Metricbeat Setup

- **SSH into JumpBox**
  - ssh (username)@( Jump-Box-Provisioner Public IP)
- **SSH into ELK Server**
  - ssh (username)@(ELK Server Private IP)
- **Edit Metricbeat configuration file after copying it into the /etc/ansible directory**
  - sudo nano /etc/ansible/metricbeat-config.yml
    - **Edits to Make:**
      - Scroll to Elasticsearch output field and add ELK Server IP to the hosts with port 9200
        - Example: hosts: [10.1.0.4:9200]
      - Scroll to Kibana field and ad the ELK Server IP to the host with port 5601
        - Example: host: “10.1.0.1:5601”
- **Add the Metricbeat Playbook (metricbeat-playbook.yml) to the /etc/ansible directory**
- **Run the Metricbeat Playbook**
  - ansible-playbook metricbeat-playbook.yml
