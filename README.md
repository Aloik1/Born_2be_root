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
   - [Step 1: Download Debian ISO](#step-1:-download-debian-iso)
   - [Step 2: Create a New Virtual Machine](#step-2:-create-a-new-virtual-machine)
   - [Step 3: Open VM Settings](#step-3:-open-vm-settings)
   - [Step 4: Start the Virtual Machine](#step-4:-start-the-virtual-machine)
   - [Step 5: Install Debian](#step-5:-install-debian)
   - [Step 6: Network Configuration](#step-6:-network-configuration)
   - [Step 7: User Account Setup](#step-7:-user-account-setup)
   - [Step 8: Select Time Zone](#step-8:-select-time-zone)
   - [Step 9: Disk Partitioning](#step-9:-disk-partitioning)
   - [Step 10: Finalize Installation](#step-10:-finalize-installation)
   - [Step 11: Install GRUB Bootloader](#step-11:-install-grub-bootloader)
4. [Bonus Part Installation](#bonus-part-installation)
   - [Step 1: Choose Manual Partitioning](#step-1:-choose-manual-partitioning)
   - [Step 2: Create the Boot Partition](#step-2:-create-the-boot-partition)
   - [Step 3: Create an Encrypted Partition for LVM](#step-3:-create-an-encrypted-partition-for-lvm)
   - [Step 4: Set Up Encryption](#step-4:-set-up-encryption)
   - [Step 5: Create the LVM Volume Group](#step-5:-create-the-lvm-volume-group)
   - [Step 6: Create Logical Volumes](#step-6:-create-logical-volumes)
   - 

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
  <img src="https://github.com/Aloik1/Born_2be_root/blob/Images/Screenshot%20(62).png?raw=true" alt="Image 1" width="600" style="display:inline-block; margin-right:10px;">
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

6. This process will start erasing data. Hit **"Cancel"** since we have no data to erase.
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

  - Choose **"Ext4 journaling file system."** for: `root`, `home`, `var`, `srv`, `tmp`, `val-log`. Choose **"Swap area"** for: `swap`. Note, `var-log` is a little different.
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

9. **Great Job!! You successfully partitioned your disk manually. Now go [HERE](#2.-choose-"no"-when-prompted-to-scan-for-additional-media.) to continue your installation**
---

