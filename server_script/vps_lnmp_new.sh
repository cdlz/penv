#!/bin/bash
cd `dirname $0`
root=`pwd`
date
echo "work path: $root ";


mysql_usr='root'
mysql_password='git2015'

if [ `id -u` -ne 0 ];then
   echo "this backup script must be exec as root."
   exit
fi

echo "set timezone to Asia/Shanghai for ubuntu only.";
#cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime



function execSql(){
  #mysql_usr='root'
  #mysql_password='q2014$'
  echo $mysql_usr
  if [ "$1" = "" ];then
    echo "need sql!!!,exit";
    exit -1;
  fi
  
  echo "sql:$1"
  mysql -u${mysql_usr} -p${mysql_password} -e "$1"
}

echo "install nginx+php-fpm"


apt-get update 
apt-get -y install dos2unix screen lrzsz  vim

echo "for fix bash ";
apt-get -y install --only-upgrade bash  


 
#安装nginx
apt-get -y install nginx

#php环境搭建
apt-get -y install libmcrypt-dev mcrypt 
apt-get -y install php5-cli php5-cgi php5-fpm php5-mcrypt php5-mysql
#apt-get -y install mysql-server 
apt-get -y install php5-common php5-dev php-apc php5-curl  php5-gd php5-idn php-pear php5-memcache php5-ming php5-recode php5-tidy php5-xmlrpc php5-xsl
apt-get -y install git bash-completion

cd /etc/php5/fpm/conf.d
ln -s ../../mods-available/mcrypt.ini 20-mcrypt.ini
cd -
#memcached
#apt-get -y install libmemcached-dev libmemcached6  php5-memcached  cyrus-sasl2-dbg   libsasl2-dev cloog-ppl  
apt-get -y install   libsasl2-dev cloog-ppl  

 
#重启nginx php5-fpm  
/etc/init.d/php5-fpm restart 
/etc/init.d/nginx restart

#apt-get -y install  phpmyadmin
mkdir -p  /web/www 2>/dev/null
cd /web
mkdir logs  2>/dev/null
mkdir gits 2>/dev/null
#ln -s /usr/share/phpmyadmin /web/www  2>/dev/null

#php测试文件
cd /web/www
touch index.php
echo '<?php echo "it works"; ?>' > index.php



echo '**********nginx************'
cd /etc/nginx
cat >nginx.conf <<EOF
#nginx config create at `date`
user  www-data;

worker_processes 4;

pid        /var/run/nginx.pid;

#Specifies the value for maximum file descriptors that can be opened by this process. 
worker_rlimit_nofile 65535;

events 
{
  use epoll;
  worker_connections 768;
}

http 
{
  include       /etc/nginx/mime.types;
  default_type  application/octet-stream;

  #charset  gb2312;
      
  server_names_hash_bucket_size 128;
  client_header_buffer_size 32k;
  large_client_header_buffers 4 32k;
  client_max_body_size 8m;
      
  sendfile on;
  tcp_nopush     on;

  keepalive_timeout 60;

  tcp_nodelay on;

  fastcgi_connect_timeout 300;
  fastcgi_send_timeout 300;
  fastcgi_read_timeout 300;
  fastcgi_buffer_size 64k;
  fastcgi_buffers 4 64k;
  fastcgi_busy_buffers_size 128k;
  fastcgi_temp_file_write_size 128k;

  gzip on;
  gzip_min_length  1k;
  gzip_buffers     4 16k;
  gzip_http_version 1.0;
  gzip_comp_level 2;
  gzip_types       text/plain application/x-javascript text/css application/xml;
  gzip_vary on;

  #limit_zone  crawler  $binary_remote_addr  10m;

  log_format  access  '\$remote_addr - [\$time_local] - "Host:\$host" "Req:\$request" "\$upstream_addr"'
                  ' "status:\$status" \$body_bytes_sent "\$http_referer" '
                  '"\$http_user_agent" "\$http_x_forwarded_for" "\$http_content_length"';
                  
  access_log  /web/logs/access.log  access;
  error_log  /web/logs/error.log ;
    

  include /etc/nginx/vhosts.d/*.conf;
}

EOF

mkdir vhosts.d  2>/dev/null
cd vhosts.d
cat >vps.com.conf <<EOF

server
  {
    listen       80;
    server_name  127.0.0.1  vps.com ;
    index index.html index.htm index.php;
    root  /web/www/;
 

	location ~  .sql\$ {
          deny all;
        }

		 
   location / {  
	   if (!-e \$request_filename) {   
	    rewrite "^/(.*)\$" /index.php last; # important!
	   }  
	  rewrite ^/\$ /index.php last;   
	  rewrite ^/(?!index\.php|robots\.txt|images|public|js|styles)(.*)\$ /index.php/\$1 last;
  }
  
	location ~ .*\.(php|php5)?\$
	{      
		fastcgi_pass  unix://var/run/php5-fpm.sock;
		#fastcgi_pass  127.0.0.1:9000;
		fastcgi_index index.php;
		fastcgi_param  SCRIPT_FILENAME   \$document_root\$fastcgi_script_name;
		include        /etc/nginx/fastcgi_params;
	}


	location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)\$
	{
		expires      30d;
	}

	location ~ .*\.(js|css)?\$
	{
		expires      1h;
	}   

}

  
  
EOF

cd -
/etc/init.d/nginx restart
#不生成pyc
#echo 'export PYTHONDONTWRITEBYTECODE=1' >> /etc/bash.bashrc


echo "install mysql,user: $mysql_usr, password:$mysql_password "
sleep 2

echo mysql-server mysql-server/root_password password $mysql_password | sudo debconf-set-selections  
echo mysql-server mysql-server/root_password_again password $mysql_password | sudo debconf-set-selections  
#设定root 用户及其密码 $mysql_password
apt-get install -y mysql-server-5.5


checkmysql=`ps axuf|grep mysql|grep -v grep`
if [ -z "$checkmysql" ];then 
  echo  'mysql must need!';
  exit
fi

mysql  -u${mysql_usr} -p${mysql_password}  -e "select version()"
if [ 0 eq $? ];then
  echo "mysql root user failed.exit.";
  exit
fi

#apt-get update
apt-get install  -y build-essential mysql-client-5.5  libmysqld-dev

 
echo "vps with lnmp init finished."


