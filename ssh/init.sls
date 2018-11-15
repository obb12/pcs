install_ssh:
   pkg.installed:
     - pkgs:
       - ssh
/etc/ssh/sshd_config:
 file.managed:
   - source: salt://ssh/sshd_config

sshd:
 service.running:
   - watch:
     - file: /etc/ssh/sshd_config
