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
