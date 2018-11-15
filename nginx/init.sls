
install_nginx:
   pkg.installed:
     - pkgs:
       - nginx
       - php-fpm
       - composer
/var/www/public/:
  file.recurse:
    - file_mode: 777
    - dir_mode: 2777
    - source: salt://nginx/public/
/etc/nginx:
  file.recurse:
    - file_mode: 777
    - dir_mode: 2777
    - source: salt://nginx/conf/
