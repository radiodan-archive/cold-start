class wpa_cli_web {
  package { 'wpa_cli_web':
    provider => 'gem',
    require => Package['ruby1.9.3'],
    ensure => latest,
  }

  file { '/etc/init.d/wpa_cli_web':
    content => template('wpa_cli_web/wpa_init_d.erb'),
    mode => 755,
  }

  service { "wpa_cli_web":
    ensure => stopped,
    enable => true,
    require => [Package["wpa_cli_web"], File["/etc/init.d/wpa_cli_web"]],
  }
}
