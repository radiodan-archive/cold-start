class nodejs {
  package {"python-software-properties": }

  exec { "add-node-ppa" :
    command => "/usr/bin/add-apt-repository ppa:chris-lea/node.js && /usr/bin/apt-get update",
    creates => "/etc/apt/sources.list.d/chris-lea-node.js-${lsbdistcodename}.list",
    require => Package['python-software-properties'],
  }

  package { "nodejs":
    require => Exec["add-node-ppa"],
    ensure  => 'present',
  }
}
