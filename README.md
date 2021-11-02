# Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

![](https://github.com/projects-ts/Project-Portfolio-for-GWU-Cybersecurity-Bootcamp/blob/main/Diagrams/Azure%20Network%20Diagram%20with%20ELK%20Stack%20Configuration%20for%20Cloud%20Monitoring.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAMLS files may be used to install only certain pieces of it, such as Filebeat.

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

* Jump-Box-Provisoner IP 10.0.0.4
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

