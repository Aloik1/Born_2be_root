# Born_2be_root

## Hello everyone!

Welcome to this guide for anyone who feels lost and doesn’t know where to start their journey with backend coding. This guide will provide step-by-step instructions on how to complete the Born_2be_root project, with a bonus section at the end.

This is not a copy-paste type of guide; I strongly suggest you read it and explore different ways to achieve the same results. This is a beautiful project—don't discard it just because it's a bit long.

With that said, let's dive into it!

---

## Introduction

The Born_2be_root project is all about navigating and managing a Linux-based system. We will focus on a Debian system, so apologies to all the Rocky fans out there!  
[Here is my subject](https://github.com/Aloik1/Born_2be_root/blob/documents/born2beroot%20english.pdf): your may differ.

---

## Table of Contents

1. [Basic Theory Questions](#basic-theory-questions)
2. [Installation of a Debian System](#installation-of-a-debian-system)
   - [Step 1: Download Debian ISO](#step-1-download-debian-iso)
   - [Step 2: Create a New Virtual Machine](#step-2-create-a-new-virtual-machine)
   - [Step 3: Open VM Settings](#step-3-open-vm-settings)
   - [Step 4: Start the Virtual Machine](#step-4-start-the-virtual-machine)
   - [Step 5: Install Debian](#step-5-install-debian)
   - [Step 6: Network Configuration](#step-6-network-configuration)
   - [Step 7: User Account Setup](#step-7-user-account-setup)
   - [Step 8: Select Time Zone](#step-8-select-time-zone)
   - [Step 9: Disk Partitioning](#step-9-disk-partitioning)
   - [Step 10: Finalize Installation](#step-10-finalize-installation)
   - [Step 11: Install GRUB Bootloader](#step-11-install-grub-bootloader)
3. [Project Guide](#project-guide)
   - [Simple Configuration](#simple-configuration)
   - [User](#user)
   - [Hostname](#hostname)
   - [Sudo](#sudo)
   - [UFW](#ufw)
   - [SSH](#ssh)
   
5. [Bonus Part Installation](#bonus-part-installation)
   - [Step 1: Choose Manual Partitioning](#step-1-choose-manual-partitioning)
   - [Step 2: Create the Boot Partition](#step-2-create-the-boot-partition)
   - [Step 3: Create an Encrypted Partition for LVM](#step-3-create-an-encrypted-partition-for-lvm)
   - [Step 4: Set Up Encryption](#step-4-set-up-encryption)
   - [Step 5: Create the LVM Volume Group](#step-5-create-the-lvm-volume-group)
   - [Step 6: Create Logical Volumes](#step-6-create-logical-volumes)

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

1. In the VirtualBox Manager, click on the **"New"** button at the top left.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(1).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Enter a name for your virtual machine (e.g., "born-2be-root").
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(2).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Choose your folder (I recommend `sgoinfre`, but since i'm doing this guide on my own computer, i chose a different folder).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(3).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. Select your Debian `.iso` file.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(4).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Mark **“Skip Unattended Installation”**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(6).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

6. Choose the amount of RAM (I recommend 1024 MB).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(7).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

7. Set the size for your virtual hard disk (`12 GB` if you’re not planning on doing the BONUS PART, or `30 GB` if you do) and click **"Next"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(8).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

8. Click **“Finish”** to complete the virtual machine setup.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(9).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 3: Open VM Settings

1. **Select your VM** and click the **"Settings"** button at the top.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(140).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Go to the **"Storage"** tab.

3. Under **"Controller: IDE"**, click on the empty disk icon.

4. Click the disk icon next to **"Optical Drive"** and select your Debian 12 ISO file.

5. Click **“Ok”** to close the settings window.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(141).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 4: Start the Virtual Machine

With the virtual machine selected, click the **"Start"** button at the top.

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(10).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 5: Install Debian
Before we do anything with the Installation, scale your VM screen to your preference. I used 150%, but feel free to change this setting as you see fit.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Change_screen_size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Choose_screen_size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

1. Use the arrow keys to select **"Install"** (not the graphical option) and press Enter.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(12).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Follow the prompts to choose your preferred `language`, `country`, and `locale`. I'm in Madrid, so I chose Spain.
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

3. Choose your keyboard layout.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/keyboard.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 6: Network Configuration

Enter a hostname for your system (`your_login42`) and configure the network (**leave domain name blank for basic setup**).

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(20).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(21).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 7: User Account Setup

1. Choose a password for the root user (I recommend having at least `1 uppercase letter, 1 lowercase letter, and a digit`. For example: Mynewproject123).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(22).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Re-enter the root password to verify.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(23).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Enter the new username (`your_login`) and set a **password** for this user, following the same complexity guidelines.
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

1. For the [BONUS PART](#bonus-part-installation), refer to the bonus installation section. Otherwise, choose "Guided - use entire disk and set up encrypted LVM" and press Enter.
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

#### 2. Choose "No" when prompted to scan for additional media.
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

And voilà! You have installed Debian on your VM. Just hit “Continue,” and you are all set to start the project.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(48).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

## Project Guide

Alright, after this long installation, let’s get into the fun part. I found it easier to start from evaluation and prepare for what is going to be asked of you. Go [HERE](https://www.42evals.com) to check all the questions you will be asked during the defense of this project.

As you can see, the evaluation is divided into multiple blocks of questions. We will complete this project in the same fashion. If you are interested in what each command does, I will do my best to explain it. You can click on Explanation below the commands to see what exactly they do :)

Before anything, we need to install the essentials. Go to your root user.
```bash
su
```
Install: sudo (Explanation)
```bash
apt install sudo
```

Add your user to sudo group. Don’t worry, we will explain this later on. 
Use: (Explanation)
```bash
sudo usermod -aG sudo user
```
Now go back to your user: 
```bash
su user
```

## Simple Configuration

### Points to Defend

- [Check for absence of graphical environment.](#check-for-absence-of-graphical-environment)
- [Check OS (Debian or Rocky).](#check-os-debian-or-rocky)
- [Check for password on start.](#check-for-password-on-start)
- [Connect with a user (Mustn't be root)](#connect-with-a-user-mustnt-be-root)
- [Check password rules.](#check-password-rules)
- [Check if UFW is installed.](#check-if-ufw-is-installed)
- [Check if SSH is installed.](#check-if-ssh-is-installed)
- [Check script appearance.](#check-for-appearance-of-script)

### Check for Absence of Graphical Environment

The simplest way to check the absence of graphical environment is to check if you can see your cursor. If it disappears when you hover over your VM, there is no graphical interface. 
Also, you can use the command `echo $DISPLAY`. If it returns anything but an empty line, you are using a graphical interface. 

### Check OS (Debian or Rocky)

A simple command to check your OS is: (Explanation)

```bash 
head -u 2 /etc/os-release
```
### Check for Password on Start

You can use the following command to check this
```bash
sudo reboot
```
### Connect with a user (Mustn't be root)

You can check this at the beginning of the command line. If your user isn’t root, you should see something like:
```ruby
user@hostname:~$
```
If your user is root, you will see "root" in front:
```ruby
root@hostname:~#
```
### Check password rules
First, let's see what does the subject tell us to do:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/password_policy_subject.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

To set up our password policy, we will be using:
```bash
nano -l
```
Don't forget to use `sudo` to modify files.

We have a couple of points to go over here. Here they are:
To set up the first 3 points, modify `/etc/login.defs`:  

Line 165: `PASS_MAX_DAYS=30`  
Line 166: `PASS_MIN_DAYS=2`  
Line 167: `PASS_WARN_AGE=7`  

It should look something like this:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/login_defs.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

To set up the rest, we are going to install:
```bash
sudo apt install libpam-pwquality
```
Now modify `/etc/security/pwquality.conf` (don’t forget to uncomment these lines and read descriptions):  

- Line 11: `minlen` (minimum length)  
- Line 34: `minclass` (different types of characters)  
- Line 15: `dcredit` (number of digits)  
- Line 20: `ucredit` (number of uppercase letters)  
- Line 25: `lcredit` (number of lowercase letters)  
- Line 38: `maxrepeat` (max of consecutive same characters)  
- Line 55: `usercheck` (check for username in password, change to 1)  
- Line 70: `retry` (number of tries)  
- Line 74: `enforce_for_root` (make root follow these rules)  

After everything you are left with something like this:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/pwquality_conf1.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/pwquality_conf2.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

We have 1 more setting to change. Go to `/etc/pam.d/common-password`:

- Line 25: Add `difok=7 user!=root`  
      1. `difok`: number of characters different from last password.  
      2. `user!=root`: enforce for everyone except root.  
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/pam_d_common-password.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

Now that we have our rules, they will apply to everyone but the already existing users.
let's change that:  
1. First, let's check our password policy for current user. Use:
```bash
sudo chage -l user
```
Explanation (doesn't work yet) 
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Password%20policy%20current%20user.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. To change these options we will use flags that replace `-l`:

   * `-W` + `number`: change warning.  
   
   * `-M` + `number`: Change password max duration.

   * `-m` + `number`: change password minimum time before changing again.

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/password%20policy%20changed%20for%20current%20user.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Check if UFW is Installed

To install, use:
```bash
sudo apt install ufw
```
Use this to start UFW on system startup:
```bash
sudo ufw enable
```
Use this command to turn it on.  
```bash
sudo service ufw start
```
To check it, use:
```bash
sudo service ufw status
```
It should look like this:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/UFW_status.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Check if SSH is installed

To install, use:
```bash
sudo apt install ssh
```
Use `sudo service ssh start` to turn it on.
Use `sudo systemctl status ssh` to check SSH status.
Here is how it looks in terminal:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/SSH_status.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Check for appearance of Script
- When we create the script, it should appear every 10 minutes.

## User

### Points to defend

- [Check for a user with your login name.](#check-for-a-user-with-your-loginname)
- [Check if your user is in "sudo" and "user42" groups.](#check-if-your-user-is-in-sudo-and-user42-groups)
- [Check password policy. Create a new user.](#check-password-policy-create-a-new-user)
- [Create a new group "evaluating" and add this new user to it.](#create-a-new-group-evaluating-and-add-this-new-user-to-it)
- [Check if the new user is in the "evaluating" Group](#check-if-the-new-user-is-in-the-evaluating-group)
- [Explain advantages and disadvantages of password policy](#advantages-and-disadvantages-of-password-policy)
- [Extra commands](#extra-commands) (you will not defend these, but they are useful)

### Check for a user with your login name

In order to check your user, type:
```bash
whoami
```

### Check if your user is in "sudo" and "user42" groups

There are 2 ways to check user groups:  
1. Use:  
```bash
id -Gn user
```
Explanation (doesn't work yet)  
2. Or:  
```bash
groups user
```
Explanation (doesn't work yet)

### Check password policy. Create a new user

> [!WARNING]    
> The subject does not require you to create a new user. This step if for practice only

To create a new user, run:
```bash
sudo adduser newuser
```
Explanation (doesn't work yet)

### Create a new group "evaluating" and add this new user to it  

> [!WARNING]    
> The subject does not require you to create "evaluating" group. This step if for practice only

To create a new group, use:
```bash
sudo groupadd groupname
```
Explanation (doesn't work yet)  
In our case, this will look like this:
```bash
sudo groupadd evaluating
```

To add a user to a group, we will use the next command:
```bash
sudo usermod -aG evaluating newuser
```
Explanation (doesn't work yet)

### Check if the New User is in the "evaluating" Group

Same as before, we will use:
```bash
groups newuser
```

### Advantages and disadvantages of password policy

- Advantages:  
   1. Increased Security: A strong password policy helps protect user accounts from unauthorized access.  
   2. Compliance: Many organizations are required to enforce strict password policies to comply with industry regulations.  
- Disadvantages:  
   1. User Frustration: Complex password requirements can lead to user frustration and increased support requests.  
   2. Password Fatigue: Users may resort to insecure practices, like writing down passwords or using simple patterns, to remember complex passwords.
 
### Extra commands

- To delete a group use:
```bash
sudo groupdel groupname
```
Explanation (doesn't work yet)
- To delete a user from a group:
```bash
sudo gpasswd -d username groupname
```
Explanation (doesn't work yet)
- To delete a user entirely:
```bash
sudo userdel
```
Explanation (doesn't work yet)
 
## Hostname

### Points to defend
- [Check hostname](#check-hostname)
- [Change your hostname](#change-your-hostname)
- [Restore your previous hostname](#restore-your-hostname)
- [Display partitions and compare with subject](#display-partitions-and-compare-them-with-subject)
- [Explain how LVM works and why is it beneficial](#explain-how-lvm-works-and-why-is-it-beneficial)

### Check hostname
Hostname is always displayed at the beginning in the command line.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Hostname.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
Additionally you can run:

```bash
hostname
```

### Change your hostname

> [!WARNING]    
> The subject does not require you to change your hostname. This step if for practice only

To change your hostname, modify `/etc/hostname`
```bash
sudo nano -l /etc/hostname
```
then you will need to reboot your systen for the changes to take place.  

```bash
sudo reboot
```
### Restore your hostname
Same thing as changing it, just change it to what is used to be ;)

### Display partitions and compare them with subject
These are the partitions with no bonus part:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/partitions%20no%20bonus.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
These are the partitions with bonus part:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(59).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Explain how LVM works and why is it beneficial

LVM (Logical Volume Manager) is a flexible storage manager for Linux
Its benefits include:
   - The ability to resize volumes on-the-fly (without the need to reboot the system to apply changes)
   - Create snapshots for backups
   - Aggregate multiple physical disks into a single logical volume. This allows for more flexible and efficient storage management.

## Sudo

### Points to defend.
- [Check if sudo is installed](#check-if-sudo-is-installed)
- [Assign your new user to `sudo` group](#assign-your-new-user-to-sudo-group)
- [Explain the purpose and operation of sudo with examples](#explain-the-purpose-and-operation-of-sudo-with-examples)
- [Demonstrate implementation of rules from subject](#demonstrate-implementation-of-rules-from-subject)
- [Verify that /var/log/sudo exists and has at least 1 file](#verify-that-varlogsudo-exists-and-has-at-least-1-file)
- [Check the contents of that file](#check-the-contents-of-that-file)
- [Run a sudo command and see if history changes](#run-a-sudo-command-and-see-if-history-changes)

### Check if sudo is installed

This is straightforward. Run:
```bash
sudo -V
```
Explanation (doesn't work yet)

### Assign your new user to sudo group

> [!WARNING]    
> The subject does not require you to complete this step. This step if for practice only

Just like before, we shall use the same command as before:
```bash
sudo usermod -aG sudo newuser
```

To check, again, just like before, run:  
```bash
groups newuser
```
Or:  
```bash
id -Gn newuser
```

### Explain the purpose and operation of sudo with examples

Sudo stands for: superuser do.  
It's a crutial command that allows a user, who is a part of sudo group to execute a command with extender permissions.  
It's used to not risk using root user to execute sensible commands. Any installation of packages of modification of essential system components (Firewall, SSH, etc.) should be executed with sudo.

### Demonstrate implementation of rules from subject

Let's first see what are these rules:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/sudo%20rules.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

1. For the first 2 points we will modify `sudo visudo` file.
```bash
sudo visudo
```
Explanation (doesn't work yet)
- Once there, you will see a couple of lines starting with **"Defaults"**. We will be adding a couple lines:
     * `Defaults   passwd_tries=3` - to have only 3 tries to get the password right
     * `Defaults   badpass_message="message"` - to display a customized message when the password is wrong
- Also, TTY mode is modified here:
     * `Defaults   requiretty` - will require TTY to use `sudo` or `root` account.

When you finish, it should look something like this:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/sudo%20visudo%20modified.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- Now that we modified `sudo visudo`, let's log our sudo commands into one file.
   * First, create `/var/log/sudo/` directory
```bash
sudo mkdir /var/log/sudo
```
   * Create a file for your log. It has to me `.log`
```bash
sudo nano -l filename.log
```
   * Now lets go back to `sudo visudo` and add something else.
```bash
sudo visudo
```
   * Just like before, add these lines:
        -  `Defaults   log_host, log_year` - optional, but looks really professional. Adds who executes sudo commands and when
        -  `defaults   log_input, log_output, logfile="/var/log/sudo/filename.log"` - Adds input and output of sudo commands and writes them to your `.log` file.
 
This should look something like this:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/sudo%20visudo%20log.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
   * The last thing, the restricted directories are set by default already, so skip that step.

### Verify that /var/log/sudo exists and has at least 1 file
Refer to the last point. We already created both the directory and the file.
If you want to check, for the directory, type:
```bash
cd /var/log/sudo
```
And then, to see the file:
```bash
ls
```

### Check the contents of that file

To check the content of the file:
```bash
cat /var/log/sudo/filename.log
```
It should display a history of sudo, similar to this:  
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/sudolog%20history.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Run a sudo command and see if history changes  

Run any sudo command:  
```bash
sudo whatever_you_like
```
Then again, display the file:  
```bash
cat /var/log/sudo/filename.log
```
Your sudo command should have been added to the `.log` file:  
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/sudolog%20modified.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

## UFW

### Points to defend
- [Verify that UFW is installed and works correctly](#verify-that-ufw-is-installed-and-works-correctly)
- [Explain what is UFW and why is it important to use](#explain-what-is-ufw-and-why-is-it-important-to-use)
- [Display rules for UFW. Check for port 4242 rule](#display-rules-for-ufw-check-for-port-4242-rule)
- [Add a rule for port 8080 and check if it's added. Then delete it](#add-a-rule-for-port-8080-and-check-if-its-added-then-delete-it)

### Verify that UFW is installed and works correctly
Run a simple:
```bash
sudo ufw version
```
And to verify it's working correctly:
```bash
sudo service ufw status
```
Check [HERE](#check-if-ufw-is-installed) if its the same and if not, make sure to modify it.

### Explain what is UFW and why is it important to use

UFW (Uncomplicated Firewall) is a user-friendly firewall for Linux systems.  
It allows users to easily set up and manage firewall rules to control incoming and outgoing network traffic.  
UFW is important because it helps enhance system security by allowing only authorized connections, protecting against unauthorized access, and minimizing the risk of network-based attacks.

### Display rules for UFW. Check for port 4242 rule

To display rules for UFW let's use:
```bash
sudo ufw status numbered
```
In order to add rules, run this command:
```bash
sudo ufw allow
```
In our case this command looks something like this:
```bash
sudo ufw allow 4242
```
Then check again with `sudo ufw status numbered` and check if the new rule is added. 

### Add a rule for port 8080 and check if it's added. Then delete it

> [!WARNING]    
> The subject does not require you to add this rule. This step if for practice only

To see the rules we want to delete let's use:  
```bash
sudo ufw status numbered
```
To delete a UFW rule run:  
```bash
sudo ufw delete + rule_number
```
Keep in mind you have to use `sudo ufw status numbered` after every deletion, because rule numbers change each time you delete a rule.
This is how it should look:  
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/ufw%20delete%20rules.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

## SSH

### Point to defend
- Check if SSH is installed and check if it works correctly
- Explain what is SSH and why is it important to use it
- Check if SSH only uses port 4242
- Connect your new user to SSH via key or password
- Make sure you can't use SSH with root user

### Check if SSH is installed and check if it works correctly

Run a simple:
```bash
sudo service ssh version
```
And to verify it's working correctly:
```bash
sudo service ssh status
```
Check [HERE](#check-if-ssh-is-installed) if its the same and if not, make sure to modify it.

### Explain what is SSH and whyy is it important to use it

SSH (Secure Shell) is a cryptographic network protocol that enables secure communication between a client and a server over an unsecured network.  
It provides a secure way to access and manage remote systems, allowing users to execute commands and transfer files.  
Using SSH is essential for protecting sensitive information from eavesdropping and unauthorized access during remote administration.

### Check if SSH only uses port 4242

Go to:
```bash
sudo nano -l /etc/ssh/sshd_config
```
- Line 14: Remove `#` and change port number to `4242`
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/ssh%20port.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

Don't forget to:
```bash
sudo service ssh restart
```
This will apply the changes to ports.

### Connect your new user to SSH via key or password
There are 2 ways to do this: one as intended and another way cooler and will let you copy commands from this guide directly into your machine tarminal heh.

The first (less cool) method:
   * Get your host IP:
```bash
hostname -i
```
   * Run next command:
```bash
ssh username_you_want_to_connect_to@hostname_ip -p 4242
```
Explanation (doesn't work yet)
It will ask for password for user you want to connect to, and done.

Now, the cool way (my way :)):
   * Just like before, get your host IP  
   * Go to VirtualBox and go to: settings > Network > Advanced > Port Forwarding
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/VM%20settings.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/VM%20Port%20forwarding.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/VM%20port%20forwarding%20adding.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

We are adding port forwarding to 4243 because 4242 is blocked.  

   * Go to your machine terminal (not your VM)  
   * Run the same command as before
```bash
ssh username_you_want_to_connect_to@hostname_ip -p 4243
```
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/SSH%20connect%20terminal.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
   * Enter your user password
And you have officially connected your PC terminal to the VM.
To check, run:
```bash
wall echo Hello
```
Explanation (doesn't work yet)
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Chech%20SSH%20connection.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Make sure you can't use SSH with root user
To disable SSH connections with root, modify:
```bash
sudo nano -l /etc/ssh/sshd_config
```
   - Line 33: Change to: `PermitRootLogin no`
This is how this looks:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Deny%20root%20login%20SSH.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

Don't forget to run:
```bash
sudo systemctl restart ssh
```
This applies the changes to SSH configuration.


---
  
## Bonus part installation

In this section, we'll go through the steps to manually configure your partitions using Logical Volume Manager (LVM). You'll set up a primary boot partition and an encrypted logical partition containing several logical volumes.

### Step 1: Choose Manual Partitioning

1. When prompted for disk partitioning, select **"Manual"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(53).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. You’ll be taken to the partitioning screen, where you can create the necessary partitions. Choose your disk to partition.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(55).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Choose **"Yes"** to create a new partition table.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(56).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 2: Create the Boot Partition

1. Select free space on the disk and choose **"Create a new partition"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(57).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(58).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Set the size of the boot partition (we will use 500 Mb).
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(60).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. Choose **"Primary"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(61).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Set it to **"Beginning of the space"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(62).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

7. Set the mount point to **`/boot`**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/mount%20point%20for%20boot%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(64).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

8. Hit Enter on **"Done setting up the partition"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(66).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 3: Create an Encrypted Partition for LVM

1. Select the remaining free space and choose **"Create a new partition"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(67).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(68).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Use the maximum available space. Type **"max"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(69).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Choose **"Logical"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(70).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. Choose "Mount point" option. Choose **"Do not mount it"** option.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(71).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(72).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Select **"Done setting up the partition"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(73).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 4: Set Up Encryption

1. After creating the physical volume, select it and choose **"Configure encrypted volumes"**. Hit Enter on **"Yes"** to write changes to the disk.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(74).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(75).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Select **"Configure encrypted volumes"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(76).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Select the partition you want to encrypt. Choose **`/dev/sda5`**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(78).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. Confirm the settings. Hit **"Done setting up the partition."**
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(79).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Hit **"Finish"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(80).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

6. This process needs to erase data from the partition. Confirm by pressing **"Yes"** and then hit **"Cancel"** since we have no data to erase.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/confirm%20data%20erasing%20process.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(81).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

7. Create a passphrase to encrypt your partition, make sure to follow the same complexity guidelines as hostname and user.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(82).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
 8. Re-enter the passphrase.
 <p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(83).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 5: Create the LVM Volume Group

1. Select **"Configure the Logical Volume Manager."**
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(84).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

2. Hit **"Yes"** to write changes to disks.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(85).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. Choose **"Create volume group"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(86).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Create a new volume group and name it **`LVMGroup`**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(88).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

7. Select **`/dev/mapper/sda5_crypt`** and hit **"Enter"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(89).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

### Step 6: Create Logical Volumes

Now, you will create the seven logical volumes. The process is the same for most of them.

1. Hit **"Create logical volume"** (same for all).
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(91).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
2. Choose Volume group (sice we only created one, it's the same for all)
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(92).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

3. Repeat first steps with these inputs to create your logical volumes.
   We will need: `root`, `swap`, `home`, `var`, `srv`, `tmp` and `var-log`.
- **ROOT:**

Root name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/root%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Root size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/root%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **SWAP:**

Swap name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/swap%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Swap size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/swap%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **HOME:**

Home name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/home%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Home size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/home%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **VAR:**

Var name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/var%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Var size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/var%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **SRV:**

Srv name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/srv%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Srv size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/srv%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **TMP:**

Tmp name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/tmp%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Tmp size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/tmp%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- **VAR-LOG:**

Var-log name:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/var-log%20name.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
  Var-log size:
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/var-log%20size.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

4. If you wish, check if you did everything right by hitting **Enter** on **"Display configuration details"**. When you are done, hit **Enter**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(111).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(112).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
It should look similar to the image, proviided in the subject. Check names and sizes. My subject had this image.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(59).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

5. Hit "Enter" on **"Finish"**.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/LVM%20volumes1.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

After creating logical volumes, you'll be prompted to set the filesystem for each one:
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(114).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

6. For next steps, we will do mostly the same thing again. You will choose each of the logical volumes you created and modify them. To select, hit **"Enter"** on `#1` with assigned space. 
  - Choose **"Use as: do not use"** option.
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(115).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  - Choose **"Ext4 journaling file system."** for: `root`, `home`, `var`, `srv`, `tmp`, `val-log`. Choose **"Swap area"** for: `swap`.
Note, `var-log` is a little different.
  - As for mount point, most of out logical volumes will have the same mount point option as their name:  
   -- Root:   /  
   -- home:   /home  
   -- var:    /var  
   -- swap:   nothing  
   -- tmp:    /tmp  
   -- srv:    /srv
   -- var-log: manual
  
  - Press **"Done setting up the partition"**.  
Here is how each one of the partitions should look

  **Root**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Root%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Swap**
<p>
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Swap%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Home**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Home%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Var**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Var%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Srv**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Srv%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Tmp**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Tmp%20partition.png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

  **Var-log**
- Choose var-log to modify it.
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(132).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- Select **"Mount point"** > **"Enter manually"**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(133).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(134).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- Type `/var/log`
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(135).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

- Press **"Done setting up the partition"**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(136).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

7. Go all the way down and press **"Finish partitioning and write changes to disk"**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(137).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

8. Select **"Yes"** and press **Enter**
<p>
<img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(138).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
</p>

9. **Great Job!! You successfully partitioned your disk manually. Now go [HERE](#2-choose-no-when-prompted-to-scan-for-additional-media) to continue your installation**

---

