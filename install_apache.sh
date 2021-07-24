#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
echo "<h1>Welcome to Apache created by Terraform</h1>" > /var/www/html/index.html
