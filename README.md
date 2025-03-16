# Kubernetes VM Deployment with Terraform on Proxmox
## Documentation for the Terraform provider
[terraform-provider](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/guides/cloud-init)

This repository contains Terraform configurations to deploy a Kubernetes cluster on Proxmox using the bpg/proxmox provider. The setup provisions one master node and a configurable number of worker nodes, all based on a Cloud-Init enabled Ubuntu template.

🚀 Features

Deploys Kubernetes VMs on Proxmox using Terraform

Uses Cloud-Init for easy provisioning

Configurable number of worker nodes

Automatically assigns CPU, memory, and disk resources

Dynamically configures networking