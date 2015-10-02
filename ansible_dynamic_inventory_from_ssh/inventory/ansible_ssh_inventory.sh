#! /bin/bash
#This snippet assume each "Host", "Hostname", "Port", "User" in separated line, and valid ssh config file.
## unknown source - will look up for creator to give credits
ssh_conf_to_ansible () {
awk 'BEGIN{IGNORECASE=1}
     {gsub(/\s+/," ");
      gsub("Host ","");
      gsub("Hostname ","ansible_ssh_host=");
      gsub("Port ","ansible_ssh_port=");
      gsub("User ","ansible_ssh_user=")};
 NR%4{printf $0" ";
      next;
     }1'
}

egrep -i "^(Host|Hostname|Port|User)" ~/.ssh/config | ssh_conf_to_ansible
