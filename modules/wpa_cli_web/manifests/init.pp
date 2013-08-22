class wpa_cli_web {
  package { 'wpa_cli_web':
    provider => 'gem',
    require => Package['ruby1.9.3'],
  }

  file { '/etc/init.d/wpa_cli_web':
    content => template('wpa_cli_web/wpa_init_d.erb'),
  }

  service { "wpa_cli_web":
    ensure => running,
    enable => true,
    require => [Package["wpa_cli_web"], File["/etc/init.d/wpa_cli_web"]],
  }
}
