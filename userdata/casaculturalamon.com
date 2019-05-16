--- 
customlog: 
  - 
    format: combined
    target: /usr/local/apache/domlogs/casaculturalamon.com
  - 
    format: "\"%{%s}t %I .\\n%{%s}t %O .\""
    target: /usr/local/apache/domlogs/casaculturalamon.com-bytes_log
documentroot: /home/casacult/public_html
group: casacult
hascgi: 1
homedir: /home/casacult
ifmodulemoddeflatec: 
  addoutputfilterbytype: 
    - 
      filter: DEFLATE
      mime: "application/javascript text/css application/vnd.ms-fontobject "
ifmodulemoddisablesuexecc: {}

ip: 109.73.236.180
owner: root
phpopenbasedirprotect: 1
port: 81
scriptalias: 
  - 
    path: /home/casacult/public_html/cgi-bin
    url: /cgi-bin/
  - 
    path: /home/casacult/public_html/cgi-bin/
    url: /cgi-bin/
serveradmin: webmaster@casaculturalamon.com
serveralias: mail.casaculturalamon.com www.casaculturalamon.com
servername: casaculturalamon.com
usecanonicalname: 'Off'
user: casacult
userdirprotect: ''
