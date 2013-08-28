class nginx {
  package { "nginx": }

  service { "nginx":
    ensure => "running",
    require => Package['nginx'],
  }

  file { "/var/www":
    ensure => "directory",
  }

  file { "/var/www/wpa_cli_web_redirect":
    ensure => "directory",
    require => File['/var/www'],
  }

  file { "/var/www/wpa_cli_web_redirect/status511.html":
    ensure => 'present',
    require => File['/var/www/wpa_cli_web_redirect'],
    content => '
<html>
   <head>
      <title>Network Authentication Required</title>
      <meta http-equiv="refresh"
            content="0; url=http://raspberrypi.local:3000/">
   </head>
   <body>
      <p>You need to <a href="http://raspberrypi.local:3000/">
      configure a Wi-Fi network</a> to gain access.</p>
   </body>
</html>
    ',
  }

  file {"/etc/nginx/sites-enabled/default":
    ensure => "absent",
    require => Package["nginx"],
  }

  file { "/etc/nginx/sites-available/wpa_cli_web_redirect":
    ensure => 'present',
    require => Package["nginx"],
    content => '
server {
  listen 80;
  root /var/www/wpa_cli_web_redirect/;

  location / {
    return 511;
  }

  error_page 511 @status511;

  location @status511 {
    rewrite ^(.*)$ /status511.html break;
  }
}
    ',
  }
}
