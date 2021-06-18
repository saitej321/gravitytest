Level1:

Run the below script as root user:

sh level1.sh

unique.log will be generated which will have list of new connections only

Create a cronjob in your linux box as below:
crontab -e
*/10 * * * * * level1.sh


How would you prove the code is correct? : 
This can be verified by running the script and making sure its picking unique new connections and verifying from /proc/net/tcp file that connections (local and remote) are intact


How would you make this solution better?:
The solution can be done better by using some advanced scipting in python or using some external third party tools like Wireshark etc which is used for packet capturing from source to destination

Is it possible for this program to miss a connection?
Very less chance to miss a new connection as script is designed in such a way that it captures all new connections and writes to unique.log file

If you weren't following these requirements, how would you solve the problem of logging every new connection?
I culd have simply used below command to for capturing new connections:

iptables -I INPUT -p tcp -m tcp --dport 5901 -m state --state NEW  -j LOG --log-level 1 --log-prefix "New Connection "



Level2:

Run the script level2.sh and portscan.log will be generated which will have list of all multiport scans

Create a crontab as below so that it runs every 10seconds:
crontab -e
*/10 * * * * * level2.sh

Run testcases.sh for running test cases.




Why did you choose x to write the build automation? : I preferred shell script as its ery east to maintain and code management is easy

Is there anything else you would test if you had more time? I have covered two test case where i will check if file is empty, or there is no multiport scans or if there is a multiport scan, it will show in the output showing message for same.

What is the most important tool, script, or technique you have for solving problems in production? Explain why this tool/script/technique is the most important.
We can use Jenkins for CICD integrted with powershell\shell script. I follow drill down approach wherein i start from debugging logs from my application logging monitor and based on that i drill down to root of problem. Kiali is one of the good example which shows where exactly is your microservice pattern is broken in production and this approach really helps while fixing issues in production.





