# terraform-vsphere

This is my highly customized workflow for standing up new VMs in my homelab using Terraform, cloud-init, and vSphere.
## Purpose
This is the most important part of how I stand up new VMs in my homelab. Having taken the standard template created by Packer, I use a terraform module to stamp out the basic bits of a given VM (including network config, etc), then pass it the name of an Ansible playbook to be run on the instance's first boot. 

Using this workflow, a new VM can be created from nothing to a fully functioning VM in a repeatable, reliable fashion. 

The other half of this project can be found [here](https://github.com/reschouw/packer-vsphere). 

## Overview
This project stands up a fresh Ubuntu 18.04 instance using Hashicorp's Packer. It's most important task is to install the prerequisites for using Terraform to pass cloud-init the code to automatically download my Ansible Repo and run a specified playbook (as well as taking care of all the networking config, hostnames, etc)

## Important Considerations

 1. Terraform 0.13 (currently in public beta) will allow the use of for_each and count with modules, but for now some repetition of the code for each instance is necessary. 
 2. The Terraform provider for vsphere is not nearly as mature as the ones for major cloud providers, and the vsphere api itself doesn't always lend itself to being easily integrated with Terraform. That being said, this workflow is complete and has been used repeatedly to stand up new VMs, and the contributors to the [vSphere provider](https://github.com/hashicorp/terraform-provider-vsphere) are continually improving it. 
 3. Much of this workflow is dependent on my homelab environment. For example, you will see references to specific repos in my self hosted GitLab instance. Any use outside of my homelab will require significant alterations, but the general workflow and some workarounds are more generally applicable. 

## Installation
This project depends both on having an existing vSphere environment and several other things like being able to access my self-hosted GitLab instance. If you've already adapted the code, then you probably already know how to use Terraform and the prerequisite components. That being said, some useful links are below:

Installation instructions for Terraform can be found [here](https://learn.hashicorp.com/terraform/getting-started/install.html).

Installation instructions for aws-vault (An excellent AWS Access Key manager) can be found [here](https://github.com/99designs/aws-vault)

## Lessons Learned

 - I really enjoyed working through the process of going from Terraform to cloud-init to fully-functioning VM with one simple "terraform apply". Being able to type one command in and have all that happen is just really cool. 
 - This was an excellent introduction into the more advanced bits of Terraform, specifically modules
 - Every bit of the needed config to stand up a new vm is commited as code in one repo or another. Which theoretically means backups are unnecessary for anything that doesn't hold stateful data. Even better than "have you turned it off and on again" is "have you destroyed it and rebuilt it entirely from scratch"
### Author
Ryan Schouweiler
