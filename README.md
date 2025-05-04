# Proxmox Workloads

A repository containing Infrastructure as Code (IaC) configurations for managing Proxmox virtual environments and workloads.

## Overview

This repository contains configurations and definitions for managing Proxmox VE workloads using Infrastructure as Code principles. It helps automate the deployment and management of virtual machines and containers in Proxmox environments.

## Prerequisites

- Proxmox VE server(s)
- Terraform installed on your local machine
- Basic understanding of Proxmox VE administration
- Proper network access to your Proxmox environment

## Getting Started

1. Clone this repository:
```bash
git clone https://github.com/InvalidIdentifier/proxmox-workloads.git
cd proxmox-workloads
```

2. Configure your Proxmox credentials (recommended to use environment variables or a credentials file outside of version control)

3. Initialize Terraform:
```bash
terraform init
```

4. Review and apply the configurations:
```bash
terraform plan
terraform apply
```

## Repository Structure

```
proxmox-workloads/
├── terraform/         # Terraform configuration files
├── variables/         # Variable definitions
└── examples/         # Example configurations
```

## Features

- Infrastructure as Code approach for Proxmox workload management
- Reproducible infrastructure deployments
- Version-controlled infrastructure definitions

## Configuration

Details about configuration options and variables will be added as the project evolves.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Proxmox VE team for their excellent virtualization platform
- The Terraform community for providing tools and documentation

---

Last updated: 2025-05-03
