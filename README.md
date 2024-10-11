# Born_2be_root
A fullly completed Born_2be_root project form Project 42, 2024, Madrid 

## Introduction

[**View the ESP Version of this Guide**](link-to-esp-version)

Welcome to the **Born_2be_root** project! This guide is designed for anyone who feels lost in their journey with backend coding. Whether you're a beginner or looking to expand your knowledge, this step-by-step guide will help you navigate and manage a Linux-type system, specifically focusing on Debian. 

This is not a copy-paste guide; I encourage you to read thoroughly and explore alternative methods along the way. This project is rich and rewarding, so don't be deterred by its length. Let's dive in!

## Table of Contents

- [Basic Theory Questions](#basic-theory-questions)
- [Installation of a Debian System](#installation)

## Basic Theory Questions

### What is a VM (Virtual Machine)?

A Virtual Machine (VM) is an application that allows you to install an additional operating system on your physical machine, enabling you to run both simultaneously. 

**Benefits of VMs:**
- **Cost-Effective:** VMs share physical components with your computer, minimizing upkeep costs.
- **Security:** Running a VM mitigates risks to your primary system. For example, if a virus affects the VM, you can easily uninstall it without consequences to your main computer.

### Why Choose Debian or Rocky?

**Debian:**
- More support and flexibility.
- Stable and user-friendly.

**Rocky:**
- Oriented towards enterprises and closer to RHEL (Red Hat Enterprise Linux).
- Offers advanced security measures and package management through `yum` and `dnf`.

### Differences Between `apt` and `aptitude`

- **`apt`:** Executes commands explicitly as directed.
- **`aptitude`:** A more advanced package manager that differentiates between explicitly requested packages and dependencies. It can uninstall dependencies when they are no longer needed.

### What is AppArmor?

AppArmor is Debian’s default security system that implements Mandatory Access Control (MAC). It restricts applications to access only the essential files they need to function, enhancing the overall security of the system.

## Installation

Let's get started with the installation of your Debian system.

1. Visit the [Debian Download Page](https://www.debian.org/download.es.html).
2. Download the appropriate `.iso` file for Debian.

---

Feel free to explore and modify the content as you see fit. Happy coding!

