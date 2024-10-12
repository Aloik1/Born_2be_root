# Born_2be_root

## Hello everyone!

Welcome to this guide for anyone who feels lost and doesn’t know where to start their journey with backend coding. This guide will provide step-by-step instructions on how to complete the Born_2be_root project, with a bonus section at the end.

This is not a copy-paste type of guide; I strongly suggest you read it and explore different ways to achieve the same results. This is a beautiful project—don't discard it just because it's a bit long.

With that said, let's dive into it!

---

## Introduction

The Born_2be_root project is all about navigating and managing a Linux-based system. We will focus on a Debian system, so apologies to all the Rocky fans out there!

---

## Table of Contents

1. [Basic Theory Questions](#basic-theory-questions)
2. [Installation of a Debian System](#installation-of-a-debian-system)

---

## Basic Theory Questions

### What is a VM (Virtual Machine)?

A VM is an application that allows you to install an additional operating system on your physical machine, enabling you to run both systems simultaneously.

**Main Benefits of VMs**:
- **Cost-Efficient**: Maintenance costs are virtually zero since the VM shares physical components with your computer.
- **Safety**: In case of a security risk, your main computer remains safe. For example, if a virus affects the VM, you can uninstall it in seconds without any consequences to your host system.

### Why Choose Debian or Rocky? What Are Their Differences?

- **Debian**: Offers more support, flexibility, and is known for its stability and user-friendliness.
- **Rocky**: Oriented towards enterprises, closer to RHEL (Red Hat Enterprise Linux), with enhanced security measures and an advanced package manager (yum and dnf), offering flexibility for complex software deployments.

### Differences Between `apt` and `aptitude`

- **`apt`**: Executes only the commands specified in the command line.
- **`aptitude`**: A more advanced version of `apt` that distinguishes between explicitly requested packages and their dependencies. Unused dependencies will be uninstalled automatically.

### What is AppArmor?

AppArmor is Debian’s default security system that provides MAC (Mandatory Access Control) security. It restricts applications to access only the essential files they need to function.

---

## Installation of a Debian System

Alright, let’s get into the installation of our Debian system.

### Step 1: Download Debian ISO

Go to [Debian Download](https://www.debian.org/download) and download the appropriate `.iso` file.

### Step 2: Create a New Virtual Machine

1. In the VirtualBox Manager, click on the "New" button at the top left.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(1).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Enter a name for your virtual machine (e.g., "born-2be-root").
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(2).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
3. Choose your folder (I recommend “sgoinfre”, but since i'm doing this guide on my own computer, i chose a different folder).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(3).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
4. Select your Debian ISO file.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(4).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
5. Mark “Skip Unattended Installation”.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(6).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
6. Choose the amount of RAM (I recommend 1024 MB).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(7).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
7. Set the size for your virtual hard disk (12 GB if you’re not planning on doing the BONUS PART, or 30 GB if you do) and click "Next."
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(8).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
8. Click “Finish” to complete the virtual machine setup.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(9).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 3: Open VM Settings

1. **Select your VM** and click the "Settings" button at the top.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(140).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. **Go to the "Storage" tab**.

3. Under "Controller: IDE," click on the empty disk icon.

4. Click the disk icon next to "Optical Drive" and select your Debian 12 ISO file.

5. Click “OK” to close the settings window.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(141).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 4: Start the Virtual Machine

With the virtual machine selected, click the "Start" button at the top.

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(10).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 5: Install Debian

1. Use the arrow keys to select "Install" (not the graphical option) and press Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(12).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Follow the prompts to choose your preferred language, country, and locale. I'm in Madrid, so I chose Spain.

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(13).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(14).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(15).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(16).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(17).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 6: Network Configuration

Enter a hostname for your system (e.g., "your_login42") and configure the network (leave domain name blank for basic setup).

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(20).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(21).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 7: User Account Setup

1. Choose a password for the root user (I recommend having at least 1 uppercase letter, 1 lowercase letter, and a digit. For example: Mynewproject123).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(22).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Re-enter the root password to verify.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(23).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
3. Enter the new username (your_login) and set a password for this user, following the same complexity guidelines.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(24).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(25).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(27).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(28).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 8: Select Time Zone

Choose your time zone (e.g., Madrid if you’re in Spain).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(29).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 9: Disk Partitioning

1. For the BONUS PART, refer to the bonus installation section. Otherwise, choose "Guided - use entire disk and set up encrypted LVM" and press Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(30).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Select the virtual hard disk you created earlier and press Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(31).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
3. Choose "Separate /home, /var, and /tmp partitions" and press Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(32).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
4. Confirm the changes to write them to disk.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(33).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
5. Cancel the erasure of data, since there is no data to erase, we don't need it.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(34).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
6. Create an encryption passphrase (again, follow the complexity guidelines).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(35).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(36).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
7. Choose the amount of space to use for guided partitioning (type "max")
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(37).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
8. Now finish partitioning and write changes to disk and hit Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(38).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 10: Finalize Installation

1. Confirm the partitioning changes and select "Yes" to write the changes to disk.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(39).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Choose "No" when prompted to scan for additional media.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(40).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
3. Select your closest country and a suitable mirror (I chose deb.debian.org).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(41).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(42).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
4. Leave the proxy information blank and hit enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(43).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
5. Choose “No” for the popularity contest.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(44).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
6. Deselect everything and hit Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(45).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 11: Install GRUB Bootloader

When prompted, choose “Yes” to install the GRUB bootloader. Choose `/dev/sda` as the device for boot loader installation.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(46).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(47).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Completion

And voilà! You have installed Debian on your VM. Just hit “Continue,” and you are all set to start the project.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(48).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

---

