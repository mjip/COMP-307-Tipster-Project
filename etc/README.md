Because the website runs on HTTPS, there are certain Apache Server configuration files which will need to be altered in order for the site to run correctly.

If running on a Linux or Mac OS, these are the following steps which will need to be followed. The same steps can be followed on Windows, however the location of the XAMPP files will most likely be different.

1) Open the XAMPP/etc/ folder
2) Open php.ini and replace it with the php.ini file from this github folder
3) Open httpd.conf and replace it with the httpd.conf file from this github folder
4) Open the XAMPP/etc/extra folder
5) Open httpd-ssl.conf and replace it with the httpd-ssl.conf file from this github folder
6) Open httpd-vhosts.conf and replace it with the httpd-vhosts.conf file from this github folder
