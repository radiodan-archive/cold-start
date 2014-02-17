class nodejs {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
  package { 'python-software-properties':
    ensure => installed,
           require => Exec['apt-get update'],
  }
  exec { 'sudo add-apt-repository ppa:chris-lea/node.js':
    command => 'add-apt-repository ppa:chris-lea/node.js',
            path => '/usr/bin/',
            require => Package['python-software-properties']
  }
  exec { 'apt-get update II':
    command => '/usr/bin/apt-get update',
            require => Exec['sudo add-apt-repository ppa:chris-lea/node.js']
  }
  file { "/etc/apt/apt.conf.d/99auth":
    owner => root,
    group => root,
    content => "APT::Get::AllowUnauthenticated yes;",
    mode => 644,
    require => Exec['apt-get update II']
  }
  package { 'nodejs':
    ensure => installed,
    require => File["/etc/apt/apt.conf.d/99auth"],
  }
}
