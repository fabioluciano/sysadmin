#!/bin/sh
svnadmin create --fs-type fsfs /var/svn/${1}/${2}
chown -R apache:apache /var/svn/${1}/${2}
chmod -R g+w /var/svn/${1}/${2}/
chmod g+s /var/svn/${1}/${2}/db

#Atualiza contextos para o SELinux
chcon -R -t httpd_sys_content_t /var/svn/${1}/${2}
chcon -R -t httpd_sys_rw_content_t /var/svn/${1}/${2}
