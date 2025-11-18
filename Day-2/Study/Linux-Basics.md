## Principle of Linux

1. Everything is a file
2. Small, single-purpose programs ➡️ which can be combined together to work

3. Ability to chain programs together to perform complex tasks

4. Avoid captive user interfaces ➡️ designed to work mainly with shell or terminal

5.  Configuration data stored in a text file ➡️ /etc/passwd file stores all the password


## Components
1. Bootloader ➡️ code that runs to guide the booting process to start the OS

2. OS Kernel ➡️ main component of an OS. 
    -  Manages the resources for system's I/O devices at the hardware level.

3. Daemons ➡️ Backgroud Services

4. OS Shell ➡️ CLI
    -   Interface between the OS and the user
    -   Most Commonly used shells are Bash, Tcsh/Csh

5. Graphics Server
    -   Provides a graphical sub-system caller "X" or "X-Server" that allows graphical programs to run locally or remotely

6. Windows Manager ➡️ GUI
    -   Options: GNOME, KDE, MATE, Unity and Cinnamon
    -   A Desktop environment usually has several applications including files and web browsers. 


7. Utilities
    -   Application or utlities are programs that perform particular functions for the user or another programs.


## Linux Architecture
1. Hardware
    -   Peripheral devices such as system's RAM, Hard Drive, CPU and others.

2.  Kernel
    -   Core of Linux OS
        -   whose function is to virutalize and control common computer hardware resources like CPU, memory, accessed data and others.
    -   It gives each process its own virtual resources and prevents/mitigates conflicts between different processes.

3.  Shell
    -   CLI
        -   where user can enter commands into to execute the kernel's functions.

4.  System Utility
    -   Makes available to the user all of the operating system's functionality.       

## File System Hierarchy

|   Path   |  Description | Example
|----------|--------------|--------
|`/`|   Top level directory wich contains all of the files required to boot the OS before other files are mounted | 
|`/bin`|  Contains essential command-line utlities for system operation |    `ls`, `cat`, `cp`, `mv`
|`/boot`| Consists of static bootloader, kernel executable, and files required to boot the linus OS.
|`/dev`|    Contains device files to facilitate access to every hardware device attached to the system | `/dev/sda1` (disc partition), `/dev/tty1`
|`/etc`|    Contains System Wide (Local System) Configuration files. Configuration files for installed application may be saved here | `/etc/passwd`, `/etc/ssh/sshd_config`, `/etc/fstab`
|`/home`|   Each user on the system has a subdirectory here for storage | `/home/ribesh`
|`/lib`|    Shared library files in `/bin` and `/sbin`
|`/media`|  External removable media devices such as USB drives | `libc.so`, `libcrypto.so`
|`/mnt`|    Tempory mount points for regular filesystems
|`/opt`|    Optional files usch as third-party tools can be saved here
|`/root`|   The home directory for the root user
|`/sbin`|   Contains executables for system admistration, maily for root user|  `ifconfig`, `iptables`, `reboot`
|`/tmp`|    Store temporary files. Generally cleared during system boot and maybe deleted at other times without warning.
|`/usr`|    Contains executables, libraries, man files etc for user utlities | `/usr/bin/vim`, `/usr/share/icons`
|`/var`|    log files, email in-boxes, web applicaion related files, cron files and more | `/var/log`, 


## Prompt Description
- Bash Prompt is simple to understand
    -   By default, it shows information like username, computer's name, folder/directory you're currently working in.
-   It can be customized to provide useful information to the user

The `PS1` variable in Linux system controls how your command prompt looks like in the terminal.
-   Its like a **template** that defines the text you see each time the system is ready for you to type a command
-   By changing the `PS1` variable, you can change the prompt to display information such as your *username*, *your computer's name*, *the current folder*, or even add colors and special characters

You can also show other userful details like IP address, date, time and the **success or failure of the last command.**

Using Tools like **script** or reviewing the `.bash_history` file, you can record all the commands you've used and organize them by date and time, which aids in documentation and analysis.

|Special Character| Description 
|-----------------|-------------
|`\u`|    Current Username
|`\h`|    Hostname
|`\w`|    Current Working Directory 
|`\d`|    Date (Mon Feb 6)
|`\D{%Y-%m-%d}`|  Date(YYYY-MM-DD)
|`\H`|    Full Hostname
|`\j`|    Number of jobs managed by the shell
|`\n`|    Newline
|`\r`|    Carriage return
|`\s`|    Name of shell
|`\t`|    Current Time 24-hours (HH:MM:SS)
|`\T`|    Current Time 12-hours (HH:MM:SS)
|`\@`|    Current Time
|`\u`|    Current Username
|`\w`|    Full path of the current working directory

## Getting Help
1. man <_command_>
    -   `man ls`

2.  <_command_> --help
    -   `curl --help`

3.  <_command_> -h
    -   `curl -h`

4. apropos <_keyword_>
    -  `apropos sudo`
    ```bash
    ribesh@htb[/htb]$ apropos sudo

    sudo (8)             - execute a command as another user
    sudo.conf (5)        - configuration for sudo front end
    sudo_plugin (8)      - Sudo Plugin API
    sudo_root (8)        - How to run administrative commands
    sudoedit (8)         - execute a command as another user
    sudoers (5)          - default sudo security policy plugin
    sudoreplay (8)       - replay sudo session logs
    visudo (8)           - edit the sudoers file
    ```

## System Information
|Command| Description | Example
|-------|-------------|--------
|`whoami`|    Displays current username
|`id`|    Returns users identity
|`hostname`|  Sets or prints the name of current host system
|`uname`| Prints basic information about the OS and system hardware | `uname -r` , `uname -m `
|`pwd`| Returns working directory name
|`ifconfig`|  Used to assign or view an address to a network interface 
|`ip`|  Show or manipulate routing, network devices, interfaces and tunnels
|`netstat`| Shows network status
|`ss`|  Another utlity to investigate sockets
|`ps`|  Show Process status
|`who`| Displays who is logged in
|`env`| Prints environment or sets and executes commands | `env  ! grep MAIL` , `env ! grep SHELL`
|`lsblk`|   List block devices
|`lsusb`|   List USB devices
|`lsof`|    List opened files
|`lspci`|   List PCI devices