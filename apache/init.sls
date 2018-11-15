
install_apache:
   pkg.installed:
     - pkgs:
       - apache2
       - php-fpm
       - composer
/etc/apache2/mods-enabled/userdir.conf:
 file.symlink:
   - target: ../mods-available/userdir.conf
/usr/lib/cgi-bin/test.pl:
 file.managed:
   - source: salt://apache/test.pl
   - mode: 777
/etc/apache2/mods-enabled/userdir.load:
 file.symlink:
   - target: ../mods-available/userdir.load

/etc/apache2/mods-enabled/cgid.load:
 file.symlink:
   - target: ../mods-available/cgid.load
/etc/apache2/mods-enabled/cgid.conf:
 file.symlink:
   - target: ../mods-available/cgid.conf

apache2service:
 service.running:
   - name: apache2
   - watch:
     - file: /etc/apache2/mods-enabled/userdir.conf
     - file: /etc/apache2/mods-enabled/userdir.load
     - file: /etc/apache2/mods-enabled/cgid.load
     - file: /etc/apache2/mods-enabled/cgid.conf