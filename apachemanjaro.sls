install_apache:
   pkg.installed:
     - pkgs:
       - apache
       - php-fpm
       - composer
