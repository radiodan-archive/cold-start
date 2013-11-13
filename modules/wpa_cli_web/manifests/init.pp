class wpa_cli_web {
  package { 'wpa_cli_web':
    provider => 'gem',
    require => Package['ruby1.9.3'],
    ensure => latest,
  }

  file { '/etc/init/wpa-cli-web.conf':
    content => template('wpa_cli_web/wpa_upstart.erb'),
    mode => 644,
  }

  service { "wpa_cli_web":
    ensure => stopped,
    require => [Package["wpa_cli_web"], File["/etc/init/wpa-cli-web.conf"]],

    # Workaround for issue http://projects.puppetlabs.com/issues/11989
    # provider => 'upstart',
    hasstatus  => true,
    hasrestart => true,
    start      => '/sbin/initctl start wpa-cli-web',
    stop       => '/sbin/initctl stop wpa-cli-web',
    status     => '/sbin/initctl status wpa-cli-web | grep "/running" 1>/dev/null 2>&1',
  }
}
