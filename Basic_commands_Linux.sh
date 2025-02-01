AWS Azure and DevOps:
-----------------------
1.Linux Intro
2.Linux Versions
3.Creating a Linux Server in local desktop/laptop
4.Creating a Linux Server in AWS Cloud 
5.Find Hostname and IP Address of the Server

1) Linux Intro
-----------------------------------------------------------------------------------------
i) Client Operating System-windows 10,windows 7, windows vista, Windows XP,-Windows.

ii) Server Operating System -RedHat7,RedHat6 Ubuntu,Suses,BSD
                             windows 2016 windows 2012,windows 2008/R2

Linux ->Sercurity,Stable,Command Line Interface (CLI),GUI.

####linus torvalds =unix

=== linux =====
open source 
bugs
- light weight os
- kernal + GNU
- 


--------------------------------------------------------------------------------------------
2)Linux Version
---------------------------------------------------06/06/2024------------------------
								linux commands
								..............
1) pwd = print working directry
2) ls =list
3) ls -al =all lists
4) cd = change directry
5) cd ../ =back step
6) touch = create a file (touch filename to  create file) eg: touch f1
7) mkdir = create a folder (mkdir foldername to create folder) eg: mkdir aws
8) mv = move 
9) clear = clear
10) exit = exit the path
11) rm = remove file or folder eg: rm filename to remove the file
12) rm -r = folder inside the file to remove this eg: rm -r foldername (rm -r aws)
13) cp = copy the file eg: cp filename foldername --cp rs ramesh1918 to copy the file(rs) into rames1918 folder
14) ln = link the other folder sour path dec path link
15) cat = read the file ( cat filename) eg: cat hydevops.txt
16) nano = edit the file write in the file msg eg:nano filename (nano rs)
17) echo = print of the date
18) less = to read less date
19) man  = helping commands eg: man man ,man more, man CPU ALLOC----CPU commands details
 
20)tar = tar folder create( tar -cvf ramesh1918.tar ramesh1918 )
21) grep = hightlit grep the msg eg: cat filename | grep -i telugu (cat rs | grep -i telugu)
22) head = to read first or top line eg:( head filename)
23) tail = to read the last lines (eg:=tail -n 1 rs) (tail -n 1 filename)
24)	diff = find the difference two file
25) cmp allows you to check if two files 
26) sort = peena nuchi kindiki up to down or down to up
27) *** export = export the values eg: export a=b then enter echo $a to give the a value is diplsy is b
28)zip=tar 
29)unzuip =untar
30)***ssh =secure shell command in linux to longin other linux to use the ssh
31) service = stop the service and stop the service
32)	ps = process eg : PID 	, 21362 pts/1 00:00:00 sudo
33) kill = kill the proces kill id no to kills the software eg: kill 21362
34)	killall
35) df = disk free
36)	mount = one haddisk add the other haddisk ues this mount
37) ls -lr = list reverse other to display files and folders
38) chmod =chmod +x filename other user to edit the file to use this
39) ifconfig = display network interfaces IP address
40) ping www.google.com = ping the network
41) wget = wget -A zip -r 1 http:// omeka.org/add-ons/themes/
-A only accept zip files -r recurse -l 1 one level deep( only files directly linked from this page)  create directry
42) iptables = allows the fire the walls
43) YUM = yellow dog upadata Manegar(use in linux)  software install  APT = ubuntu ,RPM = RedHot linux pakkage manegar use the project (rpm- when you want to convert a package into linux runnable package)
44) sudo =root acess super user eg : sudo su
45) cal =

46)top = tasks manegar, all process running all tasks
47)useradd = new user added eg : useradd name enter su to change the new user (su ram)
48)usermod = user modefications
49) passwd create or update passwords user
50) vi = file text editer i enter inset to edit te file to save : w q
51) free = free space
- free -m
- free -g
- df -h
- du 

---------------------------------------------------------------------------------------------

# Command to create directory in Linux
$ mkdir testing -create a folder
# Command to change the directory in Linux
$ cd testing
ls	 -    List the directory (folder) system.
cd -      pathname	Change directory (folder) in the file system.
cd .. -   Move one level up (one folder) in the file system.
cp	-     Copy a file to another folder.
mv	-     Move a file to another folder.
mkdir	 -  Creates a new directory (folder).
rmdir	 - Remove a directory (folder).
clear	 -  Clears the CLI window.
exit	 - Closes the CLI window.
man   -    command	Shows the manual for a given command.
open   -   The open command lets you open a file using this  syntax: open <filename>
touch  -   You can create an empty file using the touch command syntax: touch <filename>
find   -   The find command can be used to find files or folders matching a particular search pattern. It searches recursively syntax:find folder1 folder2 -name filename.txt
in     -   The ln command is part of the Linux file system commands We have 2 types of links: hard links and soft links
gzip  -    You can compress a file using the gzip compression protocol named LZ77 using the gzip command. syntax:gzip filename
gunzip -   The gunzip command is basically equivalent to the gzip command, except the -d option is always enabled by default  syntax:gunzip filename.gz  , gunzip -c filename.gz > anotherfilename
tar     -  The tar command is used to create an archive, grouping multiple files in a single file. syntax: This command creates an archive named archive.tar with the content of file1 and file2 : tar -cf archive.tar file1 file2
alias  -  You can create a new command, for example I like to call it ll , that is an alias to ls -al . syntax: alias ll='ls -al'
cat   -   Access the file syntax: cat file
less      
tail   -  The best use case of tail in my opinion is when called with the -f option. It opens the file at the end, and watches for file changes. Any time there is new content in the file, it is printed in the window. This is great for watching log files, for example syntax:tail -f /var/log/system.log
wc
grep  -  You can use grep to search in files, or combine it with pipes to filter the output of another command.
sort  -   The sort command in Linux is used to sort lines of text files or standard input in various ways. It can sort data alphabetically, numerically, or based on specific fields.
uniq
diff    -  The diff command in Linux is used to compare the contents of two files line by line. It outputs the differences between the files, which can be useful for identifying changes, discrepancies, or for merging changes in code.syntax:diff file1.txt file2.txt

echo   -  The echo command does one simple job: it prints to the output the argument passed to it. syntax:echo "hello"
chmod   -  Every file in the Linux / macOS Operating Systems (and UNIX systems in general) has 3 permissions: Read, write, execute.
          Number	Octal Permission Representation	Ref
0	No permission	---
1	Execute permission	--x
2	Write permission	-w-
3	Execute and write permission: 1 (execute) + 2 (write) = 3	-wx
4	Read permission	r--
5	Read and execute permission: 4 (read) + 1 (execute) = 5	r-x
6	Read and write permission: 4 (read) + 2 (write) = 6	rw-
7	All permissions: 4 (read) + 2 (write) + 1 (execute) = 7	rwx

$ chmod 755 testfile
$ls -l testfile
-rwxr-xr-x  1 amrood   users 1024  Nov 2 00:10  testfile
$chmod 743 testfile
$ls -l testfile
-rwxr---wx  1 amrood   users 1024  Nov 2 00:10  testfile
$chmod 043 testfile
$ls -l testfile
----r---wx  1 amrood   users 1024  Nov 2 00:10  testfile





chown -   The owner (and the root user) can change the owner to another user, too, using the chown command: chown <owner> <file>
umask -     When you create a file, you don't have to decide permissions up front. Permissions have defaults.

du    -    The du command will calculate the size of a directory as a whole:
df    -    The df command is used to get disk usage information.
 
ps     -   Your computer is running, at all times, tons of different processes
top    -    The top command in Linux provides a dynamic, real-time view of the system's running processes, displaying resource usage, including CPU and memory usage. It's useful for monitoring the performance of your system and identifying processes consuming excessive resources.
kill    -  The kill command in Linux is used to send signals to processes, with the most common signal being SIGKILL to terminate a process. It allows you to manage and control processes by sending them different types of signals, like stopping or terminating them.
killall  -  The killall command in Linux is used to terminate all instances of a process by name, rather than by Process ID (PID). It sends a signal (by default, SIGTERM) to all processes matching the specified name.
jobs      - jobs command lists background and suspended processes in the current shell.
bg     -    The bg command in Linux is used to resume a stopped job in the background. This allows you to continue running a process without having it occupy the terminal.
fg     -    The fg command in Linux is used to bring a background job (or a stopped job) to the foreground in the current terminal session. This allows you to interact with the job directly.
type   -    The type command in Linux is used to determine how a command is interpreted by the shell. It can tell you if a command is a built-in shell command, an alias, a function, or an external executable. syntax: type cd =cd is a shell builtin
which   -   The which command in Linux is used to locate the executable file associated with a command. It searches for the command in the directories listed in the PATH environment variable and returns the path to the executable.
nohup   -
xargs  -
vim   -   edit file syntax:vim filename 
emacs -   edit file
nano   -   edit file
whoami  - t looks like you might have meant "whoami." The whoami command in Linux is used to display the username of the current user who is logged into the shell sessio
who  -    
su    -   The su command in Linux stands for "substitute user" or "switch user." It allows you to switch to another user account in the current terminal session. By default, if no username is specified, it switches to the root user.
sudo   -   The sudo command in Linux stands for "superuser do." It allows a permitted user to execute a command as the superuser (root) or another user, as specified by the security policy configured in the /etc/sudoers file.
passwd  -  set a new password
ping    -  pinging the web eg:ping www.google.com

Clear   - clear the display
history  - check history of command
export   - The export command in Linux is used to set environment variables or mark shell variables for export to child processes. This allows the variables to be accessed by scripts or commands executed from the current shell.
crontab - crontab is a command-line utility in Unix-like operating systems that allows you to schedule and automate tasks (commands or scripts) to run at specified times or intervals. It uses a configuration file called a "crontab file." syntax:crontab -e
uname    - name of operating system
env       -  The env command in Linux is used to print or set environment variables in the current shell session. It's commonly used to run commands in a modified environment or to display the current environment variables.

curl        curl command is curl https://www.tutorialspoint.com/unix/unix-getting-started.htm searching the web page

wget       same searching the webpage
 

 # curl https://www.tutorialspoint.com/unix/unix-getting-started.htm
 # curl https://bjpcjp.github.io/pdfs/devops/linux-commands-handbook.pdf


------------------------------------------------------------------------------------------07/06/2024----------------------------------------------------------------------------------------
	 
1) what are ports? 


 (windows linux \ putty TCP/22)---------connect TCP/22-ssh-----(linux Server)
						----------TCP/45545--------



   Software Port -0 to 65535
   RDP -TCP/3389 -WINDOWS
   SSH -TCP/22 -Linux
   DNS -UDP/53
   HTTP -TCP/80
   HTTPS -TCP/389
  Standard ports -0 to 1024
2) what is SSH
  Secure Shell client server Architechure.
 putty -SSH client
 SSHD -SSH deamon
 ps -e	
---------------- 23.22.193.209 ----- ip address-----------------------
3)  public key and privaty key
 public key - lock server ki estaru 
 privaty key - key user tho untundi
 aws - public key & private key create 
4) SSH-Keygen ssh-keygen to genarete the private key public key
 ssh-keygen ssh -ls enter enter ls .ssh/
 puttygen - download pri & publi create keys

5) sshd editing- nano sshd_config
  change prot from tcp/22 to tcp/4444 
enable password authention
 enable root login
creating user and assigning key in aws---- useradd -m testuser1 enter cat /etc/passwd enter
 clear su - testuser1 to change the username

6) configuring the putyy(fonts ,colors &logging)?
sysconfig
 having a password less authentication between linux instances

7) ***linux Cron Scheduler
part-1
 whate is cron and crontab (cron table)? crontab -l (find / -name *crontab*)cr
  how the cron schedule work?
 diffrent cron commands 
part-2
 create acron scheduler in a linux machine
 create a script and scheduler it with cron
 restricting user using cron :wq

**crontab -e----crontab edting ,crontab -l --list check file cron is use -- testing -cat /tmp/testfile

**echo 
 crontab -e edit,crontab -r remove
cat /etc/crontab enter
-------------------------
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly;
 crontab.guru
*  *               *  *  * 
30 21,23,24(22-24) 
eg:*/5 at every  5 minutes running
eg */30 * * * 1-5 --at every 30th minute on every day-of-week from monday through friday
8)  nano script.sh --edit the sh (#!/bin/bash
                                   echo $(whoami)
                                   echo $(date) 
     enter cat newfile----fri jan 15:17:01 UTP 2024
9) --hostname change command ---cd ~, cd /,ls ,cd etc ,ls ,vi hostname, reboot then change the hostname ------

 *** adding user to a group---
 cat /etc/group enter we can see the groups no
10) find the file or commands --find / -name commandname (find / -name groups)
 history command -history
-------------------------------------------------------------------------------------------08/06/2024---------------------------------------------------------------------------------------
1) cd ~ --go to the home page
  ls ~
 mkdir ~/foldername--to create the folder in home

2) Linux Network Troublesooting

3) one server to other server connection to create two server 
  connection of 
 
4)ping-- ping blueserver ernter not pinging--nano /etc/hosts--write ip address yellowserver            
5)ping -c 5 yellowserver ping 5time only
6) ping --ICMP TRAFFIC
ip address=  curl ifconfig.me
7)
8)
9)---------------------------------------------------------------------------------------------------
10) NAT Gateway
11
12Public subnets
13
14private subnets
15) ec2 meta-ec2 detelais commend
15	urukundu.live  ---DNS NAME
   shivam1.urukundu.live
16) nano  /var/www/html/index.nginx-debian.html   ---html path for nginx








IAM Police changers



{
    "Version": "2012-10-17",
    "Statement": [{
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:RebootInstances"
            ],
            "Resource": "arn:aws:ec2:us-east-1:637423333416:instance/*",
            "Condition": {
                "StringEquals": {
                    "aws:ResourceTag/Owner": "AWSTESTUSER1"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:DescribeInstances",
            "Resource": "*"
        }
    ]
}

--------------------------------------------------------------
                  *s3*
                ==========

https://s3.amazonaws.com/www.urukundu.live/ntr3.jpg

https://s3.amazonaws.com/www.urukundu.live/ntr2.webp

https://s3.amazonaws.com/www.urukundu.live/ntr1.webp


-----------------------------------------------------------------------------------------

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::www.urukundu.live/*"
        }
    ]
}


========================HTML================================================
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="style.css">
	<title>Color Game</title>
</head>
<body>
	<h1>Welcome To AWS Training In Telugu Batch 27 By Sreeharsha Veerapalli</h1>
	<h1>Working With Git Braching</h1>
	<img src="https://s3.amazonaws.com/www.urukundu.live/ntr2.webp" alt="">
	<div id="smallcont">
		<div></div>
		<div id="try1">Lets Play</div>
	</div>
	<div id="container">
		<div class="square"></div>
		<div class="square"></div>
		<div class="square"></div>
		<div class="square"></div>
		<div class="square"></div>
		<div class="square"></div>
	</div>
	
</body>
<script type="text/javascript" src="scorekeeper.js"></script>
</html>






-------------------------------------------------------------------------------------------






{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:GetObjectVersion"
            ],
            "Resource": "arn:aws:s3:::www.urukundu.live/*"
        }
    ]
}





{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetBucketLocation",
        "s3:ListAllMyBuckets"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Stmt1719459365648",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live/*"
    }
  ]
}















{
	"Version": "2012-10-17",
	"Statement": [
		{
		    "Effect": "Allow",
			"Action": [
			    "s3:GetBuketLocation",
			    "s3:ListAllMyBuckets"
			    ],
			"Resource": "*"
		},
             {
                "Effect": "Allow",
                "Action": ["s3:ListBucket"],
                "Resource": ["arn:aws:s3:::test"]
              },
		  {
			"Sid": "Stmt1719459365648",
			"Action": "s3:*",
			"Effect": "Allow",
			"Resource": "arn:aws:s3:::www.urukundu.live/*"
		}
	]
}


















{
	"Version": "2012-10-17",
	"Statement": [
		{
		    "Effect": "Allow",
			"Action": [
			    "s3:GetBuketLocation",
			    "s3:ListAllMyBuckets"
			    ],
			"Resource": "*"
		},
         {
                "Effect": "Allow",
                "Action": ["s3:ListBucket"],
                "Resource": ["arn:aws:s3:::www.urukundu.live"]
              },
		  {
			"Sid": "Stmt1719459365648",
			"Action": "s3:*",
			"Effect": "Allow",
			"Resource": "arn:aws:s3:::www.urukundu.live/*"
		}
	]
}





IAM Policy code



{
  "Id": "Policy1719463741216",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1719463739249",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live/*",
      "Principal": "*"
    }
  ]
}








------------------------------------------------------------------------------------------{
  "Id": "Policy1719464888236",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1719463739249",
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live/*",
      "Principal": "*"
    },
    {
      "Sid": "Stmt1719464554919",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live/*",
      "Principal": "*"
    },
    {
      "Sid": "Stmt1719464885993",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live",
      "Condition": {
        "IpAddress": {
          "aws:CurrentTime": "203.192.253.58"
        }
      },
      "Principal": "*"
    }
  ]
}





{
  "Id": "Policy1719465109733",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1719465107404",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::www.urukundu.live/*",
      "Condition": {
        "IpAddress": {
          "aws:CurrentTime": "203.192.253.58"
        }
      },
      "Principal": "*"
    }
  ]
}

----------------------------------------------------------------------------------
jre install in ubuntu
apt update
java -version
sudo apt install default-jde
---------jdk--------------
sudo apt install default-jdk
jdk


;p3j-smovR*)h60aDZQw6fmym&8h%6?8


ntr1db.cluster-choum28gwr4t.us-east-1.rds.amazonaws.com

ntr1db.cluster-choum28gwr4t.us-east-1.rds.amazonaws.com





DlwJ@qYx0IcyClbTV3grUbP9LmJ.ZJz=








-----------------------------------------------------------------------------




 
#    (	
#     "AGENT_CODE" CHAR(6) NOT NULL PRIMARY KEY, 
# 	"AGENT_NAME" CHAR(40), 
# 	"WORKING_AREA" CHAR(35), 
# 	"COMMISSION" NUMBER(10,2), 
# 	"PHONE_NO" CHAR(15), 
# 	"COUNTRY" VARCHAR2(25) 
# 	 );
# INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
# INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
# INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
# INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', '0.15', '077-45625874', '');
# INSERT INTO AGENTS VALUES ('A010', 'Santakumar', 'Chennai', '0.14', '007-22388644', '');
# INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
# INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', '0.13', '045-21447739', '');
# INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', '0.14', '077-12346674', '');
# INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', '0.11', '029-12358964', '');
# INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
# INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', '0.15', '008-22544166', '');
# INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', '0.11', '008-22536178', '');
# Here is the command to create the table customer :

#    (	"CUST_CODE" VARCHAR2(6) NOT NULL PRIMARY KEY, 
# 	"CUST_NAME" VARCHAR2(40) NOT NULL, 
# 	"CUST_CITY" CHAR(35), 
# 	"WORKING_AREA" VARCHAR2(35) NOT NULL, 
# 	"CUST_COUNTRY" VARCHAR2(20) NOT NULL, 
# 	"GRADE" NUMBER, 
# 	"OPENING_AMT" NUMBER(12,2) NOT NULL, 
# 	"RECEIVE_AMT" NUMBER(12,2) NOT NULL, 
# 	"PAYMENT_AMT" NUMBER(12,2) NOT NULL, 
# 	"OUTSTANDING_AMT" NUMBER(12,2) NOT NULL, 
# 	"PHONE_NO" VARCHAR2(17) NOT NULL, 
# 	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS
# );   


# INSERT INTO CUSTOMER VALUES ('C00013', 'Holmes', 'London', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003');
# INSERT INTO CUSTOMER VALUES ('C00001', 'Micheal', 'New York', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008');
# INSERT INTO CUSTOMER VALUES ('C00020', 'Albert', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008');
# INSERT INTO CUSTOMER VALUES ('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011');
# INSERT INTO CUSTOMER VALUES ('C00024', 'Cook', 'London', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006');
# INSERT INTO CUSTOMER VALUES ('C00015', 'Stuart', 'London', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003');
# INSERT INTO CUSTOMER VALUES ('C00002', 'Bolt', 'New York', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008');
# INSERT INTO CUSTOMER VALUES ('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005');
# INSERT INTO CUSTOMER VALUES ('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005');
# INSERT INTO CUSTOMER VALUES ('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010');
# INSERT INTO CUSTOMER VALUES ('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002');
# INSERT INTO CUSTOMER VALUES ('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010');
# INSERT INTO CUSTOMER VALUES ('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678','A002');
# INSERT INTO CUSTOMER VALUES ('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005');
# INSERT INTO CUSTOMER VALUES ('C00023', 'Karl', 'London', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006');
# INSERT INTO CUSTOMER VALUES ('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004');
# INSERT INTO CUSTOMER VALUES ('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009');
# INSERT INTO CUSTOMER VALUES ('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007');
# INSERT INTO CUSTOMER VALUES ('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012');
# INSERT INTO CUSTOMER VALUES ('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004');
# INSERT INTO CUSTOMER VALUES ('C00003', 'Martin', 'Torento', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004');
# INSERT INTO CUSTOMER VALUES ('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002');
# INSERT INTO CUSTOMER VALUES ('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001');
# INSERT INTO CUSTOMER VALUES ('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007');
# INSERT INTO CUSTOMER VALUES ('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010');
# Here is the command to create the table orders :


#    (
#         "ORD_NUM" NUMBER(6,0) NOT NULL PRIMARY KEY, 
# 	"ORD_AMOUNT" NUMBER(12,2) NOT NULL, 
# 	"ADVANCE_AMOUNT" NUMBER(12,2) NOT NULL, 
# 	"ORD_DATE" DATE NOT NULL, 
# 	"CUST_CODE" VARCHAR2(6) NOT NULL REFERENCES CUSTOMER, 
# 	"AGENT_CODE" CHAR(6) NOT NULL REFERENCES AGENTS, 
# 	"ORD_DESCRIPTION" VARCHAR2(60) NOT NULL
#    );


# INSERT INTO ORDERS VALUES('200100', '1000.00', '600.00', '08/01/2008', 'C00013', 'A003', 'SOD');
# INSERT INTO ORDERS VALUES('200110', '3000.00', '500.00', '04/15/2008', 'C00019', 'A010', 'SOD');
# INSERT INTO ORDERS VALUES('200107', '4500.00', '900.00', '08/30/2008', 'C00007', 'A010', 'SOD');
# INSERT INTO ORDERS VALUES('200112', '2000.00', '400.00', '05/30/2008', 'C00016', 'A007', 'SOD'); 
# INSERT INTO ORDERS VALUES('200113', '4000.00', '600.00', '06/10/2008', 'C00022', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200102', '2000.00', '300.00', '05/25/2008', 'C00012', 'A012', 'SOD');
# INSERT INTO ORDERS VALUES('200114', '3500.00', '2000.00', '08/15/2008', 'C00002', 'A008', 'SOD');
# INSERT INTO ORDERS VALUES('200122', '2500.00', '400.00', '09/16/2008', 'C00003', 'A004', 'SOD');
# INSERT INTO ORDERS VALUES('200118', '500.00', '100.00', '07/20/2008', 'C00023', 'A006', 'SOD');
# INSERT INTO ORDERS VALUES('200119', '4000.00', '700.00', '09/16/2008', 'C00007', 'A010', 'SOD');
# INSERT INTO ORDERS VALUES('200121', '1500.00', '600.00', '09/23/2008', 'C00008', 'A004', 'SOD');
# INSERT INTO ORDERS VALUES('200130', '2500.00', '400.00', '07/30/2008', 'C00025', 'A011', 'SOD');
# INSERT INTO ORDERS VALUES('200134', '4200.00', '1800.00', '09/25/2008', 'C00004', 'A005', 'SOD');
# INSERT INTO ORDERS VALUES('200108', '4000.00', '600.00', '02/15/2008', 'C00008', 'A004', 'SOD');
# INSERT INTO ORDERS VALUES('200103', '1500.00', '700.00', '05/15/2008', 'C00021', 'A005', 'SOD');
# INSERT INTO ORDERS VALUES('200105', '2500.00', '500.00', '07/18/2008', 'C00025', 'A011', 'SOD');
# INSERT INTO ORDERS VALUES('200109', '3500.00', '800.00', '07/30/2008', 'C00011', 'A010', 'SOD');
# INSERT INTO ORDERS VALUES('200101', '3000.00', '1000.00', '07/15/2008', 'C00001', 'A008', 'SOD');
# INSERT INTO ORDERS VALUES('200111', '1000.00', '300.00', '07/10/2008', 'C00020', 'A008', 'SOD');
# INSERT INTO ORDERS VALUES('200104', '1500.00', '500.00', '03/13/2008', 'C00006', 'A004', 'SOD');
# INSERT INTO ORDERS VALUES('200106', '2500.00', '700.00', '04/20/2008', 'C00005', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200125', '2000.00', '600.00', '10/10/2008', 'C00018', 'A005', 'SOD');
# INSERT INTO ORDERS VALUES('200117', '800.00', '200.00', '10/20/2008', 'C00014', 'A001', 'SOD');
# INSERT INTO ORDERS VALUES('200123', '500.00', '100.00', '09/16/2008', 'C00022', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200120', '500.00', '100.00', '07/20/2008', 'C00009', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200116', '500.00', '100.00', '07/13/2008', 'C00010', 'A009', 'SOD');
# INSERT INTO ORDERS VALUES('200124', '500.00', '100.00', '06/20/2008', 'C00017', 'A007', 'SOD'); 
# INSERT INTO ORDERS VALUES('200126', '500.00', '100.00', '06/24/2008', 'C00022', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200129', '2500.00', '500.00', '07/20/2008', 'C00024', 'A006', 'SOD');
# INSERT INTO ORDERS VALUES('200127', '2500.00', '400.00', '07/20/2008', 'C00015', 'A003', 'SOD');
# INSERT INTO ORDERS VALUES('200128', '3500.00', '1500.00', '07/20/2008', 'C00009', 'A002', 'SOD');
# INSERT INTO ORDERS VALUES('200135', '2000.00', '800.00', '09/16/2008', 'C00007', 'A010', 'SOD');
# INSERT INTO ORDERS VALUES('200131', '900.00', '150.00', '08/26/2008', 'C00012', 'A012', 'SOD');
# INSERT INTO ORDERS VALUES('200133', '1200.00', '400.00', '06/29/2008', 'C00009', 'A002', 'SOD');











-------------------------------------------------
#!/bin/bash 
yum update -y
amazon-linux-extras install nginx1.12
service nginx start
echo '<h1>WEBSERVER-1</h1>' >>
/usr/share/nginx/html/index.html



#!/bin/bash
sudo apt update
sudo apt install nginx -y




Activation Code   mkdir /tmp/ssm

curl

https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-s sm-agent.deb-o/tmp/ssm/amazon-ssm-agent.deb

sudo dpkg -i/tmp/ssm/amazon-ssm-agent.deb sudo service amazon-ssm-agent stop

sudo amazon-ssm-agent-register-code "RgMn9krEw7ENIEtFKGSu-id "e95022e3-a6e2-4395-9584-0bed27ed835b" -region "us-east-1"

sudo service amazon-ssm-agent start




Activation Code   FXRlL5dKocixAolCkGQi
Activation ID   08793e4e-cbdb-4539-9e5a-52884926f14a


mkdir /tmp/ssm

curl

https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-s sm-agent.deb-o/tmp/ssm/amazon-ssm-agent.deb

sudo dpkg -i/tmp/ssm/amazon-ssm-agent.deb sudo service amazon-ssm-agent stop

sudo amazon-ssm-agent-register-code " FXRlL5dKocixAolCkGQi "08793e4e-cbdb-4539-9e5a-52884926f14a" -region "us-east-1"

sudo service amazon-ssm-agent start





mkdir /tmp/ssm
cd /tmp/ssm
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
sudo dpkg -i amazon-ssm-agent.deb
sudo amazon-ssm-agent-register-code " FXRlL5dKocixAolCkGQi "08793e4e-cbdb-4539-9e5a-52884926f14a" -region "us-east-1"
sudo start amazon-ssm-agent
sudo status amazon-ssm-agent

---------------------------------------------------------------------------------------------------------------------------------------------------------





































