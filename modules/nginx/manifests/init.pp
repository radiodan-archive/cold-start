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
    content => template("nginx/status511.html"),
  }

  file {"/etc/nginx/sites-enabled/default":
    ensure => "absent",
    require => Package["nginx"],
  }

  file { "/etc/nginx/sites-available/wpa_cli_web_redirect":
    ensure => 'present',
    require => Package["nginx"],
    content => template("nginx/wpa_cli_web_redirect"),
  }
}
