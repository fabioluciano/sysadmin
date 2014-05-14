#!/bin/sh

# Script for create svn repository on centos or redhat


# Main repository location
repository_root_location='/var/subversion'

# Don't edit
project=${1}
repository={2}
repository_path=$repository_root_location/$project/$repository

svnadmin create --fs-type fsfs $repository_path
chown -R apache:apache $repository_path
chmod -R g+w $repository_path
chmod g+s $repository_path

#Atualiza contextos para o SELinux
chcon -R -t httpd_sys_content_t $repository_path
chcon -R -t httpd_sys_rw_content_t $repository_path
